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
                                    distribution = c("pois", "geom"),
                                    ...) {
  distribution <- match.arg(distribution)

  rdist <- switch(distribution,
    pois = stats::rpois,
    geom = stats::rgeom
  )

  dist_params <- c(...)
  if (length(dist_params) == 0) {
    stop("Distribution parameters are missing, check config", call. = FALSE)
  }

  # name list elements with vec names to ensure arg matching in do.call
  args <- c(nrow(.data), as.list(dist_params))

  tryCatch(
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
    },
    first_contact_delay <- do.call(rdist, args = args) # nolint implicit assignment
  )

  .data$date_first_contact <- .data$date_last_contact - first_contact_delay

  # return data
  .data
}

#' @name .add_date
.add_date_last_contact <- function(.data,
                                   outbreak_start_date,
                                   distribution = c("pois", "geom"),
                                   ...) {
  distribution <- match.arg(distribution)

  rdist <- switch(distribution,
    pois = stats::rpois,
    geom = stats::rgeom
  )

  dist_params <- c(...)
  if (length(dist_params) == 0) {
    stop("Distribution parameters are missing, check config", call. = FALSE)
  }

  # name list elements with vec names to ensure arg matching in do.call
  args <- c(nrow(.data), as.list(dist_params))

  tryCatch(
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
    },
    last_contact_delay <- do.call(rdist, args = args) # nolint implicit assignment
  )

  .data$date_last_contact <- .data$infector_time + last_contact_delay +
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

  if (is.numeric(hosp_rate)) {
    pop_sample <- sample(
      seq_len(nrow(.data)),
      replace = FALSE,
      size = (1 - hosp_rate) * nrow(.data)
    )
    .data$hospitalisation[pop_sample] <- NA
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
      .data$hospitalisation[age_group_sample] <- NA
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

  apply_death_rate <- function(.data, rate, hosp = TRUE) {
    if (is.numeric(hosp_death_rate)) {
      pop_sample <- sample(
        seq_len(nrow(.data)),
        replace = FALSE,
        size = (1 - hosp_death_rate) * nrow(.data)
      )
      .data$deaths[pop_sample] <- NA
    } else {
      for (i in seq_len(nrow(hosp_death_rate))) {
        if (i == nrow(hosp_death_rate)) {
          # oldest age bracket has inclusive upper bound
          age_bracket <- hosp_death_rate$min_age[i]:hosp_death_rate$max_age[i]
        } else {
          # remove last integer from bracket due to exclusive upper bound
          age_bracket <-
            hosp_death_rate$min_age[i]:(hosp_death_rate$max_age[i] - 1)
        }
        if (hosp) {
          age_group <- which(
            .data$age %in% age_bracket & !is.na(.data$hospitalisation)
          )
        } else {
          age_group <- which(
            .data$age %in% age_bracket & is.na(.data$hospitalisation)
          )
        }
        not_hosp_death_prob <- 1 - hosp_death_rate$rate[i]
        age_group_sample <- sample(
          age_group,
          replace = FALSE,
          size = not_hosp_death_prob * length(age_group)
        )
        .data$deaths[age_group_sample] <- NA
      }
    }
    .data
  }

  .data <- apply_death_rate(.data, hosp_death_rate, hosp = TRUE)
  .data <- apply_death_rate(.data, non_hosp_death_rate, hosp = FALSE)

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
  .data$case_name <- randomNames::randomNames(
    which.names = "both",
    name.sep = " ",
    name.order = "first.last",
    gender = .data$gender,
    sample.with.replacement = FALSE
  )

  # left join corresponding names to infectors preserving column and row order
  infector_names <- data.frame(id = .data$id, infector_name = .data$case_name)
  col_order <- c(colnames(.data), "infector_name")
  .data <- merge(
    .data, infector_names, by.x = "infector", by.y = "id", all.x = TRUE
  )
  .data <- .data[order(is.na(.data$infector_name), decreasing = TRUE), ]
  .data <- .data[col_order]
  rownames(.data) <- NULL

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

  dist_params <- c(...)
  if (length(dist_params) == 0) {
    stop("Distribution parameters are missing, check config", call. = FALSE)
  }

  # name list elements with vec names to ensure arg matching in do.call
  args <- c(n = 1, as.list(dist_params))

  tryCatch(
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
    },
    ct_value <- do.call(rdist, args = args) # nolint implicit assignment
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
