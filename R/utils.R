#' Sample names using [randomNames::randomNames()]
#'
#' @description
#' Sample names for specified sexes by sampling with replacement to avoid
#' exhausting number of name when `sample.with.replacement = FALSE`. The
#' duplicated names during sampling need to be removed to ensure each
#' individual has a unique name. In order to have enough unique names, more
#' names than required are sampled from [randomNames::randomNames()], and the
#' level of oversampling is determined by the `buffer_factor` argument. A
#' `buffer_factor` too high and the more names are sampled which takes longer,
#' a `buffer_factor` too low and not enough unique names are sampled and
#' the `.sample_names()` function will need to loop until it has enough
#' unique names.
#'
#' @inheritParams .add_cols
#' @param buffer_factor A single `numeric` determining the level of
#' oversampling (or buffer) when creating a vector of unique names from
#' [randomNames::randomNames()].
#'
#' @return A `character` vector.
#' @keywords internal
.sample_names <- function(.data,
                          buffer_factor = 1.5) {
  m_lgl_idx <- .data$sex == "m"
  f_lgl_idx <- .data$sex == "f"
  num_m <- sum(m_lgl_idx)
  num_f <- sum(f_lgl_idx)
  num_sample_m <- ceiling(num_m * buffer_factor)
  num_sample_f <- ceiling(num_f * buffer_factor)

  # create sample of names so there are no duplicates
  names_m <- character(0)
  while (length(names_m) < num_m) {
    names_m <- unique(
      randomNames::randomNames(
        which.names = "both",
        name.sep = " ",
        name.order = "first.last",
        gender = rep("M", num_sample_m),
        sample.with.replacement = TRUE
      )
    )
  }

  names_f <- character(0)
  while (length(names_f) < num_f) {
    names_f <- unique(
      randomNames::randomNames(
        which.names = "both",
        name.sep = " ",
        name.order = "first.last",
        gender = rep("F", num_sample_f),
        sample.with.replacement = TRUE
      )
    )
  }

  # subset to use required number of names
  names_m <- names_m[1:num_m]
  names_f <- names_f[1:num_f]

  # order names with sex codes from .data
  names_mf <- vector(mode = "character", length = nrow(.data))
  names_mf[m_lgl_idx] <- names_m
  names_mf[f_lgl_idx] <- names_f

  # return vector of names
  names_mf
}

#' Sample the onset-to-outcome time conditional that the outcome is after
#' a hospitalisation event
#'
#' @description
#' The outcome of a case, either died or recovered, can have a time of event,
#' but this must be after the hospitalisation time, if a case has been admitted
#' to hospital. This function samples either the onset-to-death or
#' onset-to-recovery time conditional on it being greater than a
#' onset-to-hospitalisation time for a given case, if the case was admitted
#' to hospital. It does this by resampling onset-to-outcome (death or recovery)
#' times if they are less than the onset-to-hospitalisation time (from
#' [.add_hospitalisation()]).
#'
#' @inheritParams .add_cols
#' @param onset_to_outcome A `function` for either the onset-to-death or
#' onset-to-recovery delay distribution. `onset_to_outcome` can also be set to
#' `NULL` to not simulate dates for individuals that died or recovered. See
#' [sim_linelist()] documentation for more information.
#' @param idx Either the `infected_lgl_idx` or `died_lgl_idx` from
#' `.add_outcomes()` to define who to sample recovery or death times for,
#' respectively.
#'
#' @return A `<data.frame>` with a potentially modified `$outcome_time` column.
#' @keywords internal
.sample_outcome_time <- function(.data,
                                 onset_to_outcome,
                                 idx) {
  delay <- onset_to_outcome(sum(idx))

  # if outcome times are NA then times don't need to be checked
  if (anyNA(delay)) return(.data)

  # get onset-to-hospitalisation delays from time of hospitalisation in outbreak
  oth <- .data$hospitalisation[idx] - .data$time[idx]
  # set non-hospitalised cases as -Inf for numerical comparison so
  # onset-to-death and onset-to-recovery time cannot be smaller
  oth[is.na(oth)] <- -Inf
  counter <- 1L
  # outcome (death/recovery) time must be after hospitalisation
  while (any(delay < oth)) {
    # resample delay to outcome
    delay[delay < oth] <- onset_to_outcome(sum(delay < oth))
    counter <- counter + 1L
    if (counter > 1000L) {
      stop(
        "Cannot sample an onset-to-outcome time greater than a ",
        "onset-to-hospitalisation time.\n Please check `onset_to_hosp`, ",
        "`onset_to_death` and `onset_to_recovery`.\n Death and recovery times ",
        "must be greater than hospital admission times.",
        call. = FALSE
      )
    }
  }
  .data$outcome_time[idx] <- .data$time[idx] + delay

  # return .data
  .data
}

#' Anonymise names
#'
#' @description
#' A simple algorithm to replace names with an alphanumeric string with an
#' fixed number of characters (i.e. [nchar()]) specified by `string_len`.
#'
#' @param x A vector of `character` strings.
#' @param string_len A single `numeric` specifying the number of alphanumeric
#' characters to use for each anonymising `character` string.
#' Default is `10`.
#'
#' @return A vector of `character` strings of equal length to the input.
#' @keywords internal
.anonymise <- function(x, string_len = 10) {
  # find any NAs in input vector
  na_idx <- is.na(x)
  # make copy of x
  x_ <- x
  # remove NAs from vector for anonymising
  x <- x[!is.na(x)]
  # unique vector so repeated strings get the same anon string
  uniq_x <- unique(x)
  # create characters to sample
  chars <- c(letters, LETTERS, 1:9)
  # while loop to ensure all anon strings are unique
  uniq_anon <- TRUE
  while (uniq_anon) {
    # sample and combine anonymised string
    anon <- vapply(
      uniq_x,
      function(x) {
        paste(
          sample(x = chars, size = string_len, replace = TRUE),
          collapse = ""
        )
      },
      FUN.VALUE = character(1)
    )
    if (anyDuplicated(anon) == 0) {
      uniq_anon <- FALSE
    }
  }
  # insert anon strings and NAs at original index position
  out <- rep(NA, times = length(na_idx))
  for (i in seq_along(anon)) {
    # which to drop NAs
    out[which(x_ == uniq_x[i])] <- anon[i]
  }
  # return character vector
  out
}

#' Convert `<epiparameter>` or `NULL` to function
#'
#' @description
#' An extension to [as.function()], particularly the \pkg{epiparameter}
#' `as.function` S3 method, with the added feature that [`NULL`]s are converted
#' into functions that generate a vector of `NA`s to behave equivalently to
#' the generator functions output from
#' `as.function(..., func_type = "generate")`.
#'
#' If a function is already passed to `as_function` it will be returned
#' unchanged.
#'
#' There is also input checking to error if input is not an `<epiparameter>`,
#' `function` ([closure]), or for onset-to-event distributions `NULL`.
#'
#' @param x A named list containing either `<epiparameter>`, `function` or
#' `NULL`. Named list elements are: `"contact_distribution"`,
#' `"infectious_period"`, `"onset_to_hosp"`, `"onset_to_death"`,
#' `"onset_to_recovery".`
#'
#' @return A list of `function`s.
#' @keywords internal
as_function <- function(x) {
  stopifnot(
    "Input delay distributions need to be either functions or <epiparameter>" =
      inherits(x$contact_distribution, c("function", "epiparameter")) &&
      inherits(x$infectious_period, c("function", "epiparameter")),
    "onset_to_hosp, onset_to_death and onset_to_recovery need to be a function,
    <epiparameter> or NULL" =
      (inherits(x$onset_to_hosp, c("function", "epiparameter")) ||
         is.null(x$onset_to_hosp)) &&
      (inherits(x$onset_to_death, c("function", "epiparameter")) ||
         is.null(x$onset_to_death))
  )
  contact_distribution <- as.function(
    x$contact_distribution,
    func_type = "density"
  )
  infectious_period <- as.function(x$infectious_period, func_type = "generate")
  if (is.null(x$onset_to_hosp)) {
    # function to generate NA instead of hospitalisation times
    onset_to_hosp <- function(x) rep(NA, times = x)
  } else {
    onset_to_hosp <- as.function(x$onset_to_hosp, func_type = "generate")
  }
  if (is.null(x$onset_to_death)) {
    # function to generate NA instead of death times
    onset_to_death <- function(x) rep(NA, times = x)
  } else {
    onset_to_death <- as.function(x$onset_to_death, func_type = "generate")
  }
  if (is.null(x$onset_to_recovery)) {
    # function to generate NA instead of recovery times
    onset_to_recovery <- function(x) rep(NA, times = x)
  } else {
    onset_to_recovery <- as.function(
      x$onset_to_recovery,
      func_type = "generate"
    )
  }

  # return list of functions
  list(
    contact_distribution = contact_distribution,
    infectious_period = infectious_period,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery
  )
}

#' Sample infectious period distribution and check value is positive
#'
#' @inheritParams sim_linelist
#'
#' @return A single `numeric`.
#' @keywords internal
#' @noRd
.sample_infectious_period <- function(infectious_period) {
  contact_infectious_period <- infectious_period(1)
  if (contact_infectious_period < 0) {
    stop(
      "Negative infectious period sampled. ",
      "The infectious period must be strictly positive.",
      call. = FALSE
    )
  }
  contact_infectious_period
}
