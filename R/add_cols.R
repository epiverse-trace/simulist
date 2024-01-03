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
                              outbreak_start_date) {
  contact_type <- match.arg(contact_type)
  distribution <- match.arg(distribution)

  stopifnot(
    "outbreak_start_date is only required for adding date of last contact" =
      contact_type == "last" && !missing(outbreak_start_date) ||
      contact_type == "first" && missing(outbreak_start_date)
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
    do.call(rdist, args = args)
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
                                 hosp_rate) {
  .data$hospitalisation <- .data$time + onset_to_hosp(nrow(.data))

  if (is.numeric(hosp_rate)) {
    pop_sample <- sample(
      seq_len(nrow(.data)),
      replace = FALSE,
      size = (1 - hosp_rate) * nrow(.data)
    )
    .data$hospitalisation[pop_sample] <- NA
  } else {
    for (i in seq_len(nrow(hosp_rate))) {
      age_bracket <- hosp_rate$min_age[i]:hosp_rate$max_age[i]
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
  .data$deaths <- .data$time + onset_to_death(nrow(.data))

  apply_death_rate <- function(.data, rate, hosp = TRUE) {
    if (is.numeric(rate)) {
      pop_sample <- sample(
        seq_len(nrow(.data)),
        replace = FALSE,
        size = (1 - rate) * nrow(.data)
      )
      .data$deaths[pop_sample] <- NA
    } else {
      for (i in seq_len(nrow(rate))) {
        age_bracket <- rate$min_age[i]:rate$max_age[i]
        if (hosp) {
          age_group <- which(
            .data$age %in% age_bracket & !is.na(.data$hospitalisation)
          )
        } else {
          age_group <- which(
            .data$age %in% age_bracket & is.na(.data$hospitalisation)
          )
        }
        not_hosp_death_prob <- 1 - rate$rate[i]
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

  .data <- apply_death_rate(.data, rate = hosp_death_rate, hosp = TRUE)
  .data <- apply_death_rate(.data, rate = non_hosp_death_rate, hosp = FALSE)

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
    do.call(rdist, args = args)
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
