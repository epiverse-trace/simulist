#' Internal simulation function called by the exported simulation functions
#' within \pkg{simulist}
#'
#' @description This internal function simulates a line list, and
#' when `sim_type` is `"contacts"` or `"outbreak"` a contacts table as well.
#'
#' @inheritParams sim_linelist
#' @inheritParams sim_contacts
#' @inheritParams .check_sim_input
#'
#' @return A `<data.frame>` if `sim_type` is `"linelist"` or `"contacts"`, or a
#' list of two `<data.frame>`s if `sim_type` is `"outbreak"`.
#' @keywords internal
.sim_internal <- function(sim_type = c("linelist", "contacts", "outbreak"),
                          contact_distribution,
                          infectious_period,
                          prob_infection,
                          incubation_period,
                          onset_to_hosp = NULL,
                          onset_to_death = NULL,
                          onset_to_recovery = NULL,
                          reporting_delay = NULL,
                          hosp_risk = NULL,
                          hosp_death_risk = NULL,
                          non_hosp_death_risk = NULL,
                          outbreak_start_date,
                          anonymise = NULL,
                          outbreak_size,
                          population_age,
                          case_type_probs = NULL,
                          contact_tracing_status_probs = NULL,
                          config) {
  sim_type <- match.arg(sim_type)

  num_cases <- 0
  max_iter <- 0L
  # condition on a minimum chain size
  while (num_cases < min(outbreak_size)) {
    .data <- .sim_network_bp(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = prob_infection,
      max_outbreak_size = max(outbreak_size),
      config = config
    )
    num_cases <- sum(.data$infected == "infected")
    max_iter <- max_iter + 1L
    if (max_iter >= 1e3) {
      stop(
        "Exceeded maximum number of iterations for simulating outbreak. \n",
        "Change input parameters or outbreak_size.",
        call. = FALSE
      )
    }
  }

  names(.data)[names(.data) == "ancestor"] <- "infector"

  # add delays dates
  .data$date_onset <- .data$time + outbreak_start_date +
    incubation_period(nrow(.data))

  # add reporting delays
  if (sim_type %in% c("linelist", "outbreak")) {
    .data$date_reporting <- .data$date_onset + reporting_delay(nrow(.data))
  } else {
    # reporting_delay is NULL in sim_contacts()
    .data$date_reporting <- .data$date_onset
  }

  # add exposure date for cases
  id_time <- data.frame(infector = .data$id, infector_time = .data$time)

  # left join infector time to data preserving column and row order
  col_order <- c(colnames(.data), "infector_time")
  .data <- merge(.data, id_time, by = "infector", all.x = TRUE)
  .data <- .data[order(is.na(.data$infector), decreasing = TRUE), ]
  .data <- .data[col_order]
  row.names(.data) <- NULL

  .data <- .add_date_contact(
    .data = .data,
    first_contact_distribution = config$first_contact_distribution,
    last_contact_distribution = config$last_contact_distribution,
    outbreak_start_date = outbreak_start_date
  )

  stopifnot(
    "`prob_male` in `config` must be >= 0 and <=1" =
      config$prob_male >= 0 && config$prob_male <= 1
  )

  # add random age and sex
  .data$sex <- sample(
    c("m", "f"),
    replace = TRUE,
    size = nrow(.data),
    prob = c(config$prob_male, (1 - config$prob_male))
  )
  if (is.data.frame(population_age)) {
    age_groups <- apply(population_age, MARGIN = 1, function(x) x[1]:x[2])
    sample_weight <- rep(population_age$proportion, times = lengths(age_groups))
    # normalise for vector length
    sample_weight <- sample_weight /
      rep(lengths(age_groups), times = lengths(age_groups))
    .data$age <- sample(
      unlist(age_groups),
      size = nrow(.data),
      replace = TRUE,
      prob = sample_weight
    )
  } else {
    .data$age <- sample(
      population_age[["lower"]]:population_age[["upper"]],
      size = nrow(.data),
      replace = TRUE
    )
  }

  if (sim_type %in% c("linelist", "outbreak")) {
    .data <- .add_hospitalisation(
      .data = .data,
      onset_to_hosp = onset_to_hosp,
      hosp_risk = hosp_risk
    )
    .data <- .add_outcome(
      .data = .data,
      onset_to_death = onset_to_death,
      onset_to_recovery = onset_to_recovery,
      hosp_death_risk = hosp_death_risk,
      non_hosp_death_risk = non_hosp_death_risk,
      config = config
    )

    # add hospitalisation and death dates
    .data$date_admission <- .data$hospitalisation + outbreak_start_date
    .data$date_outcome <- .data$outcome_time + outbreak_start_date

    linelist_cols <- c(
      "id", "case_type", "sex", "age", "date_onset", "date_reporting",
      "date_admission", "outcome", "date_outcome", "date_first_contact",
      "date_last_contact"
    )

    .data <- .add_names(.data = .data, anonymise = anonymise)
    linelist_cols <- append(linelist_cols, "case_name", after = 1)

    # add confirmed, probable, suspected case types
    .data$case_type[.data$infected == "infected"] <- sample(
      x = names(case_type_probs),
      size = sum(.data$infected == "infected"),
      replace = TRUE,
      prob = case_type_probs
    )

    # add Ct if confirmed
    .data <- .add_ct(.data = .data, distribution = config$ct_distribution)
    linelist_cols <- c(linelist_cols, "ct_value")
  }

  if (sim_type %in% c("contacts", "outbreak")) {
    if (!"infector_name" %in% colnames(.data)) {
      .data <- .add_names(.data = .data, anonymise = anonymise)
    }

    contacts_tbl <- subset(
      .data,
      select = c(
        "infector_name", "case_name", "age", "sex",
        "date_first_contact", "date_last_contact"
      )
    )
    colnames(contacts_tbl) <- c(
      "from", "to", "age", "sex", "date_first_contact",
      "date_last_contact"
    )
    contacts_tbl$was_case <- .data$infected == "infected"

    # add contact tracing status
    non_infect_contact_lgl_idx <- !contacts_tbl$was_case
    status_type <- sample(
      names(contact_tracing_status_probs),
      size = sum(non_infect_contact_lgl_idx),
      replace = TRUE,
      prob = contact_tracing_status_probs
    )
    contacts_tbl$status <- "case"
    contacts_tbl$status[non_infect_contact_lgl_idx] <- status_type

    contacts_tbl <- contacts_tbl[-1, ]

    row.names(contacts_tbl) <- NULL
  }

  if (sim_type == "contacts") {
    return(contacts_tbl)
  }
  .data <- .data[.data$infected == "infected", ]
  .data <- .data[, linelist_cols]
  row.names(.data) <- NULL

  switch(sim_type,
    linelist = return(.data),
    outbreak = return(list(
      linelist = .data,
      contacts = contacts_tbl
    ))
  )
}
