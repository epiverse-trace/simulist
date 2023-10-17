#' Add event date as column to infectious history `<data.frame>`
#'
#' @description The event date could be first contact, last contact or other.
#'
#' @param .data A `<data.frame>` containing the infectious history from a
#' branching process simulation
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
.add_date_first_contact <- function(.data,
                                    distribution = "pois",
                                    ...) {
  distribution <- match.arg(distribution)

  rdist <- switch(distribution,
    pois = stats::rpois
  )

  dist_params <- c(...)
  if (length(dist_params) == 0) {
    stop("Distribution parameters need to be supplied via ...", call. = FALSE)
  }

  .data$date_first_contact <- .data$date_last_contact -
    do.call(rdist, args = list(n = nrow(.data), dist_params))

  # return data
  .data
}

#' @name .add_date
.add_date_last_contact <- function(.data,
                                   outbreak_start_date,
                                   distribution = "pois",
                                   ...) {
  distribution <- match.arg(distribution)

  rdist <- switch(distribution,
    pois = stats::rpois
  )

  dist_params <- c(...)
  if (length(dist_params) == 0) {
    stop("Distribution parameters need to be supplied via ...", call. = FALSE)
  }
  .data$date_last_contact <- .data$infector_time +
    do.call(rdist, args = list(nrow(.data), dist_params)) +
    outbreak_start_date

  # return data
  .data
}

#' @name .add_date
.add_hospitalisation <- function(.data,
                                 onset_to_hosp,
                                 hosp_rate) {
  .data$hospitalisation <- .data$time +
    epiparameter::generate(onset_to_hosp, nrow(.data))
  .data$hosp_rounded <- round(.data$hospitalisation, digits = 0) # rounded for incidence2, could remove

  if (is.numeric(hosp_rate)) {
    pop_sample <- sample(
      seq_len(nrow(.data)),
      replace = FALSE,
      size = (1 - hosp_rate) * nrow(.data)
    )
    .data$hosp_rounded[pop_sample] <- NA
  } else {
    for (i in seq_len(nrow(hosp_rate))) {
      if (i == nrow(hosp_rate)) {
        # oldest age bracket has inclusive upper bound
        age_bracket <- hosp_rate$min_age[i]:hosp_rate$max_age[i]
      } else {
        # remove last integer from bracket due to exclusive upper bound
        age_bracket <- hosp_rate$min_age[i]:(hosp_rate$max_age[i] - 1)
      }
      age_group <- which(.data$age %in% age_bracket)
      not_hosp_prob <- 1 - hosp_rate$rate[i]
      age_group_sample <- sample(
        age_group,
        replace = FALSE,
        size = not_hosp_prob * length(age_group)
      )
      .data$hosp_rounded[age_group_sample] <- NA
    }
  }

  # return data
  .data
}

#' @name .add_date
.add_deaths <- function(.data,
                        onset_to_death,
                        hosp_death_rate,
                        non_hosp_death_rate) {
  .data$deaths <- .data$time +
    epiparameter::generate(onset_to_death, nrow(.data))
  .data$death_rounded <- round(.data$deaths, digits = 0) # rounded for incidence2, could remove

  apply_death_rate <- function(.data, rate, hosp = TRUE) {
    if (is.numeric(hosp_death_rate)) {
      pop_sample <- sample(
        seq_len(nrow(.data)),
        replace = FALSE,
        size = (1 - hosp_death_rate) * nrow(.data)
      )
      .data$death_rounded[pop_sample] <- NA
    } else {
      for (i in seq_len(nrow(hosp_death_rate))) {
        if (i == nrow(hosp_death_rate)) {
          # oldest age bracket has inclusive upper bound
          age_bracket <- hosp_death_rate$min_age[i]:hosp_death_rate$max_age[i]
        } else {
          # remove last integer from bracket due to exclusive upper bound
          age_bracket <- hosp_death_rate$min_age[i]:(hosp_death_rate$max_age[i] - 1)
        }
        if (hosp) {
          age_group <- which(.data$age %in% age_bracket & !is.na(.data$hosp_rounded))
        } else {
          age_group <- which(.data$age %in% age_bracket & is.na(.data$hosp_rounded))
        }
        not_hosp_death_prob <- 1 - hosp_death_rate$rate[i]
        age_group_sample <- sample(
          age_group,
          replace = FALSE,
          size = not_hosp_death_prob * length(age_group)
        )
        .data$death_rounded[age_group_sample] <- NA
      }
    }
    .data
  }

  .data <- apply_death_rate(.data, hosp_death_rate, hosp = TRUE)
  .data <- apply_death_rate(.data, non_hosp_death_rate, hosp = FALSE)

  # return data
  .data
}


#' Add linelist information as column to infectious history `<data.frame>`
#'
#' @param .data A `<data.frame>` containing the infectious history from a
#' branching process simulation
#' @param distribution A `character` with the name of the distribution,
#' following the base R convention for distribution naming (e.g. Poisson
#' is `pois`).
#' @param ... [dots] Extra arguments to be passed to the distribution function
#' given in the `distribution` argument.
#' @param onset_to_hosp An `<epidist>` object with the onset to hospitalisation
#' delay distribution.
#' @param onset_to_death An `<epidist>` object with the onset to death delay
#' distribution.
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
  # create sample of names so there are no duplicates
  cases_m <- sum(.data$gender == "m")
  cases_f <- sum(.data$gender == "f")
  names <- list(
    names_masc = randomNames::randomNames(
      n = cases_m,
      which.names = "both",
      name.sep = " ",
      name.order = "first.last",
      gender = 0,
      sample.with.replacement = FALSE
    ),
    names_fem = randomNames::randomNames(
      n = cases_f,
      which.names = "both",
      name.sep = " ",
      name.order = "first.last",
      gender = 1,
      sample.with.replacement = FALSE
    )
  )

  .data$case_name[.data$gender == "m"] <- names$names_masc # move to start of df
  .data$case_name[.data$gender == "f"] <- names$names_fem

  # add corresponding names to infectors
  infector_names <- .data[, c("id", "case_name")]
  names(infector_names)[2] <- "infector_name"
  .data <- dplyr::left_join(.data, infector_names, by = dplyr::join_by(infector == id))

  # return named linelist
  .data
}

#' @name .add_info
.add_ct <- function(.data, distribution = "norm", ...) {
  distribution <- match.arg(distribution)

  rdist <- switch(distribution,
    norm = stats::rnorm
  )

  dist_params <- c(...)
  if (length(dist_params) == 0) {
    stop("Distribution parameters need to be supplied via ...", call. = FALSE)
  }

  .data$ct_value <- ifelse(
    test = .data$case_type == "confirmed",
    yes = do.call(rdist, args = list(n = 1, dist_params)),
    no = NA_real_
  )

  .data$ct_value <- signif(.data$ct_value, digits = 3)

  # return data
  .data
}
