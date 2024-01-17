#' Internal simulation functions used by the exported simulation functions
#' within \pkg{simulist}
#'
#' @description These functions enable the codebase to be modular and prevent
#' code being repeated across several simulation functions.
#'
#' @inheritParams sim_linelist
#'
#' @name .sim_utils
#'
#' @return A `<data.frame>`
#' @keywords internal
#'
NULL

#' @name .sim_utils
.sim_bp_linelist <- function(mean_contacts,
                             contact_interval,
                             prob_infect,
                             outbreak_start_date,
                             min_outbreak_size,
                             population_age,
                             config) {
  outbreak_size <- 0
  max_iter <- 0L
  # condition on a minimum chain size
  while (outbreak_size < min_outbreak_size) {
    chain <- .sim_network_bp(
      mean_contacts = mean_contacts,
      contact_interval = contact_interval,
      prob_infect = prob_infect
    )
    outbreak_size <- sum(chain$infected == "infected")
    max_iter <- max_iter + 1L
    if (max_iter >= 1e3) {
      stop(
        "Exceeded maximum number of iterations for simulating outbreak. \n",
        "Change input parameters or min_outbreak_size.",
        call. = FALSE
      )
    }
  }

  names(chain)[names(chain) == "ancestor"] <- "infector"

  # add delays dates
  chain$date_onset <- chain$time + outbreak_start_date

  # add exposure date for cases
  id_time <- data.frame(infector = chain$id, infector_time = chain$time)

  # left join infector time to data preserving column and row order
  col_order <- c(colnames(chain), "infector_time")
  chain <- merge(chain, id_time, by = "infector", all.x = TRUE)
  chain <- chain[order(is.na(chain$infector), decreasing = TRUE), ]
  chain <- chain[col_order]
  row.names(chain) <- NULL

  chain <- .add_date_contact(
    .data = chain,
    contact_type = "last",
    distribution = config$last_contact_distribution,
    config$last_contact_distribution_params,
    outbreak_start_date = outbreak_start_date
  )
  chain <- .add_date_contact(
    .data = chain,
    contact_type = "first",
    distribution = config$first_contact_distribution,
    config$first_contact_distribution_params
  )

  # add random age and gender
  chain$gender <- sample(c("m", "f"), replace = TRUE, size = nrow(chain))
  if (is.data.frame(population_age)) {
    age_groups <- apply(population_age, MARGIN = 1, function(x) x[1]:x[2])
    sample_weight <- rep(population_age$proportion, times = lengths(age_groups))
    # normalise for vector length
    sample_weight <- sample_weight /
      rep(lengths(age_groups), times = lengths(age_groups))
    chain$age <- sample(
      unlist(age_groups),
      size = nrow(chain),
      replace = TRUE,
      prob = sample_weight
    )
  } else {
    chain$age <- sample(
      population_age[1]:population_age[2],
      size = nrow(chain),
      replace = TRUE
    )
  }

  # return simulated line list
  chain
}

#' @name .sim_utils
.sim_clinical_linelist <- function(chain,
                                   onset_to_hosp,
                                   onset_to_death,
                                   hosp_risk,
                                   hosp_death_risk,
                                   non_hosp_death_risk,
                                   outbreak_start_date,
                                   add_names,
                                   add_ct,
                                   case_type_probs,
                                   config) {
  chain <- .add_hospitalisation(
    .data = chain,
    onset_to_hosp = onset_to_hosp,
    hosp_risk = hosp_risk
  )
  chain <- .add_deaths(
    .data = chain,
    onset_to_death = onset_to_death,
    hosp_death_risk = hosp_death_risk,
    non_hosp_death_risk = non_hosp_death_risk
  )

  # add hospitalisation and death dates
  chain$date_admission <- chain$hospitalisation + outbreak_start_date
  chain$date_death <- chain$deaths + outbreak_start_date

  linelist_cols <- c(
    "id", "case_type", "gender", "age", "date_onset", "date_admission",
    "date_death", "date_first_contact", "date_last_contact"
  )

  if (add_names) {
    chain <- .add_names(.data = chain)
    linelist_cols <- append(linelist_cols, "case_name", after = 1)
  }

  # add confirmed, probable, suspected case types
  chain$case_type[chain$infected == "infected"] <- sample(
    x = names(case_type_probs),
    size = sum(chain$infected == "infected"),
    replace = TRUE,
    prob = case_type_probs
  )

  # add Ct if confirmed
  if (add_ct) {
    chain <- .add_ct(
      .data = chain,
      distribution = config$ct_distribution,
      config$ct_distribution_params
    )
    linelist_cols <- c(linelist_cols, "ct_value")
  }

  # return list of line list and final cols
  list(
    chain = chain,
    cols = linelist_cols
  )
}
