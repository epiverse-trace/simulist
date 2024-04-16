#' Add event date as column to infectious history `<data.frame>`
#'
#' @description The event date could be first contact, last contact or other.
#'
#' @param .data A `<data.frame>` containing the infectious history from a
#' branching process simulation.
#' @param contact_type A `character` with the type of contact, either first
#' contact (`"first"`), or last contact (`"last"`).
#' @param distribution A `character` with the name of the distribution,
#' following the base R convention for distribution naming (e.g. Poisson
#' is `pois`).
#' @param ... [dots] Extra arguments to be passed to the distribution function
#' given in the `distribution` argument.
#' @inheritParams sim_linelist
#'
#' @name .add_date
#'
#' @return A `<data.frame>` with one more column than input into `.data`.
#' Unless the column heading is already present in which the data is
#' overwritten.
#' @keywords internal
#'
NULL

#' @name .add_date
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
    .data$date_first_contact <- .data$date_last_contact - contact_delay
  } else {
    .data$date_last_contact <- .data$infector_time + contact_delay +
      outbreak_start_date
  }

  # return data
  .data
}

#' @name .add_date
.add_hospitalisation <- function(.data,
                                 onset_to_hosp,
                                 hosp_risk) {
  infected_idx <- .data$infected == "infected"
  num_infected <- sum(infected_idx)
  .data$hospitalisation <- NA_real_
  .data$hospitalisation[infected_idx] <- .data$time[infected_idx] +
    onset_to_hosp(num_infected)

  # hosp_risk is either numeric or <data.frame> or NA
  if (!is_na(hosp_risk)) {
    if (is.numeric(hosp_risk)) {
      # size is converted to an integer internally in sample()
      pop_sample <- sample(
        which(infected_idx),
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

#' @name .add_date
.add_outcome <- function(.data,
                         onset_to_death,
                         onset_to_recovery,
                         hosp_death_risk,
                         non_hosp_death_risk,
                         config) {
  infected_idx <- .data$infected == "infected"
  num_infected <- sum(infected_idx)
  .data$outcome <- "contact"
  .data$outcome_time <- NA_real_
  .data$outcome[infected_idx] <- "recovered"
  .data$outcome_time[infected_idx] <- .data$time[infected_idx] +
    onset_to_recovery(num_infected)
  hosp_idx <- !is.na(.data$hospitalisation) & infected_idx
  non_hosp_idx <- is.na(.data$hospitalisation) & infected_idx

  # define functions used only by .add_outcome
  time_varying_risk <- function(.data, died_idx, config) {
    # check time-varying function
    .check_func_req_args(config$time_varying_death_risk)

    # sample which deaths to keep with time-varying risk
    prob_death <- config$time_varying_death_risk(.data$time[died_idx])
    max_prob_death <- stats::optimise(
      f = config$time_varying_death_risk,
      interval = c(0, 100),
      maximum = TRUE
    )$objective
    norm_prob_death <- prob_death / max_prob_death
    # set all values > 1 and < 0 to 1 and 0 due to imprecision of optimise
    # TODO: ideally this step would be removed as no values are 0 > x < 1
    norm_prob_death[norm_prob_death > 1] <- 1
    norm_prob_death[norm_prob_death < 0] <- 0
    sampled_died <- stats::rbinom(
      n = length(died_idx),
      size = 1,
      prob = norm_prob_death
    )
    # subset deaths given sampling (logical conversion for vec subsetting)
    died_idx <- died_idx[as.logical(sampled_died)]

    # return sample of deaths
    died_idx
  }

  apply_death_risk <- function(.data, risk, idx, config) {
    if (!is_na(risk)) {
      # single population risk is a special case of the age-strat risk
      # convert population risk to data.frame to apply the same operations
      if (is.numeric(risk)) {
        risk <- data.frame(
          min_age = min(.data$age),
          max_age = max(.data$age),
          risk = risk
        )
      }
      for (i in seq_len(nrow(risk))) {
        age_bracket <- risk$min_age[i]:risk$max_age[i]
        age_group_idx <- which(.data$age %in% age_bracket & idx)
        # size is converted to an integer internally in sample()
        died_idx <- sample(
          age_group_idx,
          replace = FALSE,
          size = risk$risk[i] * length(age_group_idx)
        )
        if (is.function(config$time_varying_death_risk)) {
          died_idx <- time_varying_risk(
            .data,
            died_idx = died_idx,
            config = config
          )
        }
        .data$outcome[died_idx] <- "died"
        .data$outcome_time[died_idx] <- .data$time[died_idx] +
          onset_to_death(length(died_idx))
      }
    }
    .data
  }

  .data <- apply_death_risk(
    .data, risk = hosp_death_risk, idx = hosp_idx, config = config
  )
  .data <- apply_death_risk(
    .data, risk = non_hosp_death_risk, idx = non_hosp_idx, config = config
  )

  # return data
  .data
}

#' Add line list information as column to infectious history `<data.frame>`
#'
#' @param .data A `<data.frame>` containing the infectious history from a
#' branching process simulation
#' @param distribution A `character` with the name of the distribution,
#' following the base R convention for distribution naming (e.g. Poisson
#' is `pois`).
#' @param ... [dots] Extra arguments to be passed to the distribution function
#' given in the `distribution` argument.
#'
#' @name .add_info
#'
#' @return A `<data.frame>` with one more column than input into `.data`.
#' Unless the column heading is already present in which the data is
#' overwritten.
#' @keywords internal
#'
NULL

#' @name .add_info
.add_names <- function(.data) {
  .data$case_name <- .sample_names(.data = .data)

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

#' @name .add_info
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
