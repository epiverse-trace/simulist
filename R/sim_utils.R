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
.sim_bp_linelist <- function(R,
                             serial_interval,
                             outbreak_start_date,
                             min_chain_size,
                             population_age,
                             config) {
  chain_size <- 0
  # condition on a minimum chain size
  while (chain_size < min_chain_size) {
    chain <- bpmodels::chain_sim(
      n = 1,
      offspring = "pois",
      stat = "size",
      serial = function(x) epiparameter::generate(serial_interval, x),
      lambda = R,
      tree = TRUE,
      infinite = 1000
    )
    chain_size <- max(chain$id)
  }

  names(chain)[names(chain) == "ancestor"] <- "infector"

  # add delays dates
  chain$onset_date <- chain$time + outbreak_start_date

  # add exposure date for cases
  id_time <- data.frame(infector = chain$id, infector_time = chain$time)

  # left join infector time to data preserving column and row order
  col_order <- c(colnames(chain), "infector_time")
  chain <- merge(chain, id_time, by = "infector", all.x = TRUE)
  chain <- chain[order(is.na(chain$infector), decreasing = TRUE), ]
  chain <- chain[col_order]
  row.names(chain) <- NULL

  chain <- .add_date_last_contact(
    .data = chain,
    outbreak_start_date = outbreak_start_date,
    distribution = config$last_contact_distribution,
    config$last_contact_distribution_params
  )
  chain <- .add_date_first_contact(
    .data = chain,
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
                                   hosp_rate,
                                   hosp_death_rate,
                                   non_hosp_death_rate,
                                   outbreak_start_date,
                                   add_names,
                                   add_ct,
                                   case_type_probs,
                                   config) {
  chain <- .add_hospitalisation(
    .data = chain,
    onset_to_hosp = onset_to_hosp,
    hosp_rate = hosp_rate
  )
  chain <- .add_deaths(
    .data = chain,
    onset_to_death = onset_to_death,
    hosp_death_rate = hosp_death_rate,
    non_hosp_death_rate = non_hosp_death_rate
  )

  # add hospitalisation and death dates
  chain$hospitalisation_date <- chain$hospitalisation + outbreak_start_date
  chain$death_date <- chain$deaths + outbreak_start_date

  linelist_cols <- c(
    "id", "case_type", "gender", "age", "onset_date", "hospitalisation_date",
    "death_date", "date_first_contact", "date_last_contact"
  )

  if (add_names) {
    chain <- .add_names(.data = chain)
    linelist_cols <- append(linelist_cols, "case_name", after = 1)
  }

  # add confirmed, probable, suspected case types
  chain$case_type <- sample(
    x = names(case_type_probs),
    size = nrow(chain),
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
