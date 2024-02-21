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
                          contact_interval,
                          prob_infect,
                          onset_to_hosp = NULL,
                          onset_to_death = NULL,
                          hosp_risk = NULL,
                          hosp_death_risk = NULL,
                          non_hosp_death_risk = NULL,
                          outbreak_start_date,
                          add_names = NULL,
                          add_ct = NULL,
                          min_outbreak_size,
                          population_age,
                          case_type_probs = NULL,
                          contact_tracing_status_probs = NULL,
                          config) {
  sim_type <- match.arg(sim_type)

  outbreak_size <- 0
  max_iter <- 0L
  # condition on a minimum chain size
  while (outbreak_size < min_outbreak_size) {
    .data <- .sim_network_bp(
      contact_distribution = contact_distribution,
      contact_interval = contact_interval,
      prob_infect = prob_infect,
      config = config
    )
    outbreak_size <- sum(.data$infected == "infected")
    max_iter <- max_iter + 1L
    if (max_iter >= 1e3) {
      stop(
        "Exceeded maximum number of iterations for simulating outbreak. \n",
        "Change input parameters or min_outbreak_size.",
        call. = FALSE
      )
    }
  }

  names(.data)[names(.data) == "ancestor"] <- "infector"

  # add delays dates
  .data$date_onset <- .data$time + outbreak_start_date

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
    contact_type = "last",
    distribution = config$last_contact_distribution,
    config$last_contact_distribution_params,
    outbreak_start_date = outbreak_start_date
  )
  .data <- .add_date_contact(
    .data = .data,
    contact_type = "first",
    distribution = config$first_contact_distribution,
    config$first_contact_distribution_params
  )

  # add random age and sex
  .data$sex <- sample(c("m", "f"), replace = TRUE, size = nrow(.data))
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
      population_age[1]:population_age[2],
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
    .data <- .add_deaths(
      .data = .data,
      onset_to_death = onset_to_death,
      hosp_death_risk = hosp_death_risk,
      non_hosp_death_risk = non_hosp_death_risk
    )

    # add hospitalisation and death dates
    .data$date_admission <- .data$hospitalisation + outbreak_start_date
    .data$date_death <- .data$deaths + outbreak_start_date

    linelist_cols <- c(
      "id", "case_type", "sex", "age", "date_onset", "date_admission",
      "date_death", "date_first_contact", "date_last_contact"
    )

    if (add_names) {
      .data <- .add_names(.data = .data)
      linelist_cols <- append(linelist_cols, "case_name", after = 1)
    }

    # add confirmed, probable, suspected case types
    .data$case_type[.data$infected == "infected"] <- sample(
      x = names(case_type_probs),
      size = sum(.data$infected == "infected"),
      replace = TRUE,
      prob = case_type_probs
    )

    # add Ct if confirmed
    if (add_ct) {
      .data <- .add_ct(
        .data = .data,
        distribution = config$ct_distribution,
        config$ct_distribution_params
      )
      linelist_cols <- c(linelist_cols, "ct_value")
    }
  }

  if (sim_type %in% c("contacts", "outbreak")) {
    if (!"infector_name" %in% colnames(.data)) {
      .data <- .add_names(.data = .data)
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
    contacts_tbl$was_case <- ifelse(
      test = .data$infected == "infected",
      yes = "Y",
      no = "N"
    )

    # add contact tracing status
    pick_N <- which(contacts_tbl$was_case == "N")
    status_type <- sample(
      names(contact_tracing_status_probs),
      size = length(pick_N),
      replace = TRUE,
      prob = contact_tracing_status_probs
    )
    contacts_tbl$status <- "case"
    contacts_tbl$status[pick_N] <- status_type

    contacts_tbl <- contacts_tbl[-1, ]

    row.names(contacts_tbl) <- NULL
  }

  if (sim_type == "contacts") {
    return(contacts_tbl)
  } else {
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
}
