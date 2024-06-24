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
#' @param contact_type A `character` with the type of contact, either first
#' contact (`"first"`), or last contact (`"last"`).
#' @param distribution A `character` with the name of the distribution,
#' following the base R convention for distribution naming (e.g. Poisson
#' is `pois`).
#' @param ... [dots] Extra arguments to be passed to the distribution function
#' given in the `distribution` argument.
#' @inheritParams sim_linelist
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
                              contact_type = c("first", "last"),
                              distribution = c("pois", "geom"),
                              ...,
                              outbreak_start_date = NULL) {
  contact_type <- match.arg(contact_type)
  distribution <- match.arg(distribution)

  stopifnot(
    "outbreak_start_date is only required for adding date of last contact" =
      contact_type == "last" && !is.null(outbreak_start_date) ||
      contact_type == "first" && is.null(outbreak_start_date)
  )

  rdist <- switch(distribution,
    pois = stats::rpois,
    geom = stats::rgeom
  )

  # c() over ...length() to ensure NULL is not counted by length
  if (length(c(...)) == 0) {
    stop("Distribution parameters are missing, check config", call. = FALSE)
  }

  # name list elements with vec names to ensure arg matching in do.call
  args <- c(nrow(.data), list(...))

  contact_delay <- tryCatch(
    do.call(rdist, args = args),
    error = function(cnd) {
      stop(
        "Incorrect parameterisation of distribution, check config",
        call. = FALSE
      )
    },
    warning = function(cnd) {
      stop(
        "Incorrect parameterisation of distribution, check config",
        call. = FALSE
      )
    }
  )

  if (contact_type == "first") {
    # add date of first contact with infector
    .data$date_first_contact <- .data$date_last_contact - contact_delay
  } else {
    # add date of last contact with infector
    .data$date_last_contact <- .data$infector_time + contact_delay +
      outbreak_start_date
  }

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
      # size is converted to an integer internally in sample()
      pop_sample <- sample(
        which(infected_lgl_idx),
        replace = FALSE,
        size = (1 - hosp_risk) * num_infected
      )
      .data$hospitalisation[pop_sample] <- NA_real_
    } else {
      for (i in seq_len(nrow(hosp_risk))) {
        age_bracket <- hosp_risk$min_age[i]:hosp_risk$max_age[i]
        age_group <- which(.data$age %in% age_bracket)
        not_hosp_prob <- 1 - hosp_risk$risk[i]
        # size is converted to an integer internally in sample()
        age_group_sample <- sample(
          age_group,
          replace = FALSE,
          size = not_hosp_prob * length(age_group)
        )
        .data$hospitalisation[age_group_sample] <- NA_real_
      }
    }
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
  num_infected <- sum(infected_lgl_idx)
  .data$outcome <- "contact"
  .data$outcome_time <- NA_real_
  .data$outcome[infected_lgl_idx] <- "recovered"
  .data$outcome_time[infected_lgl_idx] <- .data$time[infected_lgl_idx] +
    onset_to_recovery(num_infected)
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
      .data$outcome_time[died_lgl_idx] <- .data$time[died_lgl_idx] +
        onset_to_death(sum(died_lgl_idx))
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
.add_ct <- function(.data, distribution = c("norm", "lnorm"), ...) {
  distribution <- match.arg(distribution)

  rdist <- switch(distribution,
    norm = stats::rnorm,
    lnorm = stats::rlnorm
  )

  # c() over ...length() to ensure NULL is not counted by length
  if (length(c(...)) == 0) {
    stop("Distribution parameters are missing, check config", call. = FALSE)
  }

  # name list elements with vec names to ensure arg matching in do.call
  args <- c(n = 1, list(...))

  ct_value <- tryCatch(
    do.call(rdist, args = args),
    error = function(cnd) {
      stop(
        "Incorrect parameterisation of distribution, check config",
        call. = FALSE
      )
    },
    warning = function(cnd) {
      stop(
        "Incorrect parameterisation of distribution, check config",
        call. = FALSE
      )
    }
  )

  .data$ct_value <- ifelse(
    test = .data$case_type == "confirmed",
    yes = ct_value,
    no = NA_real_
  )

  .data$ct_value <- signif(.data$ct_value, digits = 3)

  # return data
  .data
}
