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

  if (is.numeric(hosp_risk)) {
    pop_sample <- sample(
      which(infected_idx),
      replace = FALSE,
      size = (1 - hosp_risk) * num_infected
    )
    .data$hospitalisation[pop_sample] <- NA
  } else {
    for (i in seq_len(nrow(hosp_risk))) {
      age_bracket <- hosp_risk$min_age[i]:hosp_risk$max_age[i]
      age_group <- which(.data$age %in% age_bracket)
      not_hosp_prob <- 1 - hosp_risk$risk[i]
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
                        hosp_death_risk,
                        non_hosp_death_risk) {
  infected_idx <- .data$infected == "infected"
  num_infected <- sum(infected_idx)
  .data$deaths <- NA_real_
  .data$deaths[infected_idx] <- .data$time[infected_idx] +
    onset_to_death(num_infected)

  apply_death_risk <- function(.data, risk, hosp = TRUE) {
    if (is.numeric(risk)) {
      pop_sample <- sample(
        which(infected_idx),
        replace = FALSE,
        size = (1 - risk) * num_infected
      )
      .data$deaths[pop_sample] <- NA
    } else {
      for (i in seq_len(nrow(risk))) {
        age_bracket <- risk$min_age[i]:risk$max_age[i]
        if (hosp) {
          age_group <- which(
            .data$age %in% age_bracket & !is.na(.data$hospitalisation)
          )
        } else {
          age_group <- which(
            .data$age %in% age_bracket & is.na(.data$hospitalisation)
          )
        }
        not_hosp_death_prob <- 1 - risk$risk[i]
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

  .data <- apply_death_risk(.data, risk = hosp_death_risk, hosp = TRUE)
  .data <- apply_death_risk(.data, risk = non_hosp_death_risk, hosp = FALSE)

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
