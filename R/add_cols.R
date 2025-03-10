#' Add line list event dates and case information as columns to infectious
#' history `<data.frame>`
#'
#' @description These `.add_*()` functions add columns to the `<data.frame>`
#' output by [.sim_network_bp()]. The `<data.frame>` supplied to `.data` will
#' have a different number of columns depending on which function is being
#' called (i.e. the `<data.frame>` supplied to [.add_hospitalisation()] will
#' have more columns than the `<data.frame>` supplied to [.add_date_contact()]
#' as former function is called later in the simulation).
#'
#' The event date could be first contact, last contact or other.
#'
#' @param .data A `<data.frame>` containing the infectious history from a
#' branching process simulation ([.sim_network_bp()]).
#' @param first_contact_distribution,last_contact_distribution A `function` to
#' generate the time for the first or last contact between the infector
#' and infectee (exposure window). See [create_config()].
#' @inheritParams sim_linelist
#' @param data_entry_event  A `character` string, either `"onset"` (default),
#' `"admission"`, or `"outcome"`. This controls which event the reporting date
#' is based on. If the `reporting_delay = NULL` then the `$date_reporting`
#' column in the output line list will be identical to the date of the event
#' specified by `data_entry_event`, either `$date_onset` (default),
#' `$date_admission`, or `$date_outcome`. If a `reporting_delay` is specified
#' then this will be added to the event specified by `data_entry_event`.
#'
#' @name .add_cols
#'
#' @return A `<data.frame>` with one more column than input into `.data`.
#' Unless the column heading is already present in which the data is
#' overwritten.
#' @keywords internal
#'
NULL

#' @name .add_cols
.add_date_contact <- function(.data,
                              first_contact_distribution,
                              last_contact_distribution,
                              outbreak_start_date) {
  .check_func_req_args(
    first_contact_distribution,
    func_name = "first_contact_distribution"
  )
  .check_func_req_args(
    last_contact_distribution,
    func_name = "last_contact_distribution"
  )
  distribution_eval <- c(
    first_contact_distribution(1),
    last_contact_distribution(1)
  )
  # random numbers generated from discrete distributions produce integers
  if (any(!is.integer(distribution_eval) | distribution_eval < 0)) {
    stop(
      "First or last contact distribution specified in `config` must be a ",
      "(random) number generating functions that produces nonnegative ",
      "integers.",
      call. = FALSE
    )
  }

  # add date of first contact with infector
  .data$date_first_contact <- .data$infector_time -
    first_contact_distribution(nrow(.data))  + outbreak_start_date

  # add date of last contact with infector
  .data$date_last_contact <- .data$infector_time +
    last_contact_distribution(nrow(.data)) + outbreak_start_date

  # return data
  .data
}

#' @name .add_cols
.add_hospitalisation <- function(.data,
                                 onset_to_hosp,
                                 hosp_risk) {
  infected_lgl_idx <- .data$infected == "infected"
  num_infected <- sum(infected_lgl_idx)
  .data$hospitalisation <- NA_real_
  .data$hospitalisation[infected_lgl_idx] <- .data$time[infected_lgl_idx] +
    onset_to_hosp(num_infected)

  # hosp_risk is either numeric or <data.frame> or NULL
  if (!is.null(hosp_risk)) {
    if (is.numeric(hosp_risk)) {
      # single population risk is a special case of the age-strat risk
      # convert population risk to data.frame to apply the same operations
      hosp_risk <- data.frame(
        min_age = min(.data$age),
        max_age = max(.data$age),
        risk = hosp_risk
      )
    }
    # find risk group for each individual based on age
    # findInterval indexes from 0 so plus 1 for R vec indexing
    # oldest age group is inclusive at upper bound so rightmost.closed = TRUE
    hosp_risk_group_idx <- findInterval(
      x = .data$age,
      vec = hosp_risk$max_age,
      rightmost.closed = TRUE
    ) + 1
    # assign risk to each individual given age group
    hosp_risk_ <- hosp_risk$risk[hosp_risk_group_idx]
    # sample individuals to unhospitalise given risk group
    hosp_idx <- stats::rbinom(
      n = length(hosp_risk_),
      size = 1,
      prob = (1 - hosp_risk_)
    )
    # hosp index requires individuals to be in idx group (e.g. infected)
    hosp_lgl_idx <- as.logical(hosp_idx) & infected_lgl_idx
    .data$hospitalisation[hosp_lgl_idx] <- NA_real_
  }

  # return data
  .data
}

#' @name .add_cols
.add_outcome <- function(.data,
                         onset_to_death,
                         onset_to_recovery,
                         hosp_death_risk,
                         non_hosp_death_risk,
                         config) {
  infected_lgl_idx <- .data$infected == "infected"
  .data$outcome <- "contact"
  .data$outcome_time <- NA_real_
  .data$outcome[infected_lgl_idx] <- "recovered"
  .data <- .sample_outcome_time(
    .data, onset_to_outcome = onset_to_recovery, idx = infected_lgl_idx
  )
  hosp_lgl_idx <- !is.na(.data$hospitalisation) & infected_lgl_idx
  non_hosp_lgl_idx <- is.na(.data$hospitalisation) & infected_lgl_idx

  # internal function only called in .add_outcome()
  # assign deaths using population or age-stratified death risk
  # if risk is NULL then no deaths are assigned
  apply_death_risk <- function(.data, risk, idx, config) {
    if (!is.null(risk)) {
      # single population risk is a special case of the age-strat risk
      # convert population risk to data.frame to apply the same operations
      if (is.numeric(risk)) {
        risk <- data.frame(
          min_age = min(.data$age),
          max_age = max(.data$age),
          risk = risk
        )
      }
      # find risk group for each individual based on age
      # findInterval indexes from 0 so plus 1 for R vec indexing
      # oldest age group is inclusive at upper bound so rightmost.closed = TRUE
      risk_group_idx <- findInterval(
        x = .data$age,
        vec = risk$max_age,
        rightmost.closed = TRUE
      ) + 1
      # assign risk to each individual given age group
      risk_ <- risk$risk[risk_group_idx]
      if (is.function(config$time_varying_death_risk)) {
        .check_func_req_args(
          config$time_varying_death_risk,
          func_name = "time_varying_death_risk",
          n_req_args = 2,
          req_arg_names = c("risk", "time")
        )
        risk_ <- config$time_varying_death_risk(
          risk = risk$risk[risk_group_idx],
          time = .data$time
        )
        valid_risk <- checkmate::test_numeric(
          risk_,
          lower = 0,
          upper = 1,
          any.missing = FALSE
        )
        if (!valid_risk) {
          stop(
            "Time-varying death risk outside [0,1]. \n",
            "Check time-varying function.",
            call. = FALSE
          )
        }
      }
      # sample individuals to die given risk group
      died_idx <- stats::rbinom(n = length(risk_), size = 1, prob = risk_)
      # died index requires individuals to be in idx group (e.g. hosp)
      died_lgl_idx <- as.logical(died_idx) & idx
      .data$outcome[died_lgl_idx] <- "died"
      .data <- .sample_outcome_time(
        .data, onset_to_outcome = onset_to_death, idx = died_lgl_idx
      )
    }
    .data
  }

  .data <- apply_death_risk(
    .data, risk = hosp_death_risk, idx = hosp_lgl_idx, config = config
  )
  .data <- apply_death_risk(
    .data, risk = non_hosp_death_risk, idx = non_hosp_lgl_idx, config = config
  )

  # return data
  .data
}

#' @name .add_cols
.add_names <- function(.data, anonymise = FALSE) {
  .data$case_name <- .sample_names(.data = .data)
  if (anonymise) {
    .data$case_name <- .anonymise(.data$case_name)
  }

  # left join corresponding names to infectors preserving column and row order
  infector_names <- data.frame(id = .data$id, infector_name = .data$case_name)
  col_order <- c(colnames(.data), "infector_name")
  .data <- merge(
    .data, infector_names,
    by.x = "infector", by.y = "id", all.x = TRUE
  )
  .data <- .data[order(is.na(.data$infector_name), decreasing = TRUE), ]
  .data <- .data[col_order]
  row.names(.data) <- NULL

  # return named line list
  .data
}

#' @name .add_cols
.add_ct <- function(.data, distribution) {
  .check_func_req_args(distribution, func_name = "ct_distribution")
  distribution_eval <- distribution(1)
  if (!is.numeric(distribution_eval) || distribution_eval < 0) {
    stop(
      "Ct distribution specified in `config` must be a ",
      "(random) number generating functions that produces positive numbers.",
      call. = FALSE
    )
  }

  ct_value <- distribution(sum(.data$case_type == "confirmed", na.rm = TRUE))
  ct_value <- signif(ct_value, digits = 3)

  .data$ct_value <- NA_real_
  # which to handle NAs in data.frame col
  .data$ct_value[which(.data$case_type == "confirmed")] <- ct_value

  # return data
  .data
}

#' @name .add_cols
.add_reporting_delay <- function(.data, reporting_delay, data_entry_event) {
  # order of data_entry_events matters as used in loop below
  data_entry_events <- c("outcome", "admission", "onset")
  data_entry_event <- match.arg(data_entry_event, choices = data_entry_events)
  col_name <- paste("date", data_entry_event, sep = "_")
  if (is.null(reporting_delay)) {
    .data$date_reporting <- .data[[col_name]]
    return(.data)
  }
  .check_func_req_args(reporting_delay, func_name = "reportin_delay")
  # check if reporting_delay is NULL or generates a number
  reporting_delay_eval <- reporting_delay(1)
  if (!is.numeric(reporting_delay_eval)) {
    stop(
      "The `reporting_delay` must be NULL or a function that ",
      "generates numbers.",
      call. = FALSE
    )
  }

  # admissions and outcomes can be NA, in those cases fall back on the previous
  # event, events happen in the order onset -> admission -> outcome
  # there are no NAs in $date_onset so will break loop
  date_reporting <- rep(NA_real_, times = nrow(.data))
  event_idx <- which(data_entry_events %in% data_entry_event)
  while (anyNA(date_reporting)) {
    # idx to sample reporting dates for dates that are not already sampled
    date_lgl_idx <- !is.na(.data[[col_name]]) & is.na(date_reporting)
    date_reporting[date_lgl_idx] <- .data[[col_name]][date_lgl_idx] +
      reporting_delay(sum(date_lgl_idx))
    # use next event, 3 events in total, min avoids out-of-bound indexing
    event_idx <- min(event_idx + 1, 3)
    col_name <- paste("date", data_entry_events[event_idx], sep = "_")
  }

  # as.Date ensures <Date> in case coerced to numeric
  .data$date_reporting <- as.Date(date_reporting)

  # return data
  .data
}
