#' Sample names using [randomNames::randomNames()]
#'
#' @description
#' Sample names for specified sexes by sampling with replacement to avoid
#' exhausting number of name when `sample.with.replacement = FALSE`. The
#' duplicated names during sampling need to be removed to ensure each
#' individual has a unique name. In order to have enough unique names, more
#' names than required are sampled from [randomNames()], and the level of
#' oversampling is determined by the `buffer_factor` argument. A
#' `buffer_factor` too high and the more names are sampled which takes longer,
#' a `buffer_factor` too low and not enough unique names are sampled and
#' the `.sample_names()` function will need to loop until it has enough
#' unique names.
#'
#' @inheritParams .add_date
#' @param buffer_factor A single `numeric` determining the level of
#' oversampling (or buffer) when creating a vector of unique names from
#' [randomNames()].
#'
#' @return A `character` vector.
#' @keywords internal
.sample_names <- function(.data,
                          buffer_factor = 1.5) {
  m_idx <- .data$sex == "m"
  f_idx <- .data$sex == "f"
  num_m <- sum(m_idx)
  num_f <- sum(f_idx)
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
  names_mf[m_idx] <- names_m
  names_mf[f_idx] <- names_f

  # return vector of names
  names_mf
}

#' Check if \R object is a single `NA`
#'
#' Check if an \R object is specifically a single logical [`NA`] (i.e.
#' non-vectorised). [`NA_real_`], [`NA_character_`], [`NA_integer_`],
#' [`NA_complex_`] return `FALSE`.
#'
#' @param x An \R object
#'
#' @return A single boolean `logical`.
#' @keywords internal
is_na <- function(x) {
  if (length(x) == 1 && is.atomic(x) && is.logical(x)) {
    # check is.na() inside if as it warns for closures
    return(all(is.na(x)))
  }
  return(FALSE)
}

#' Convert `<epidist>` or `NA` to function
#'
#' @description
#' An extension to [as.function()], particularly the \pkg{epiparameter}
#' `as.function` S3 method, with the added feature that [`NA`]s are converted
#' into functions that generate a vector of `NA`s to behave equivalently to
#' the generator functions output from
#' `as.function(..., func_type = "generate")`.
#'
#' If a function is already passed to `as_function` it will be returned
#' unchanged.
#'
#' There is also input checking to error if input is not an `<epidist>`,
#' `function` ([closure]), or for onset-to-event distributions `NA`.
#'
#' @param x A named list containing either `<epidist>`, `function` or `NA`.
#' Named list elements are: `"contact_distribution"`, `"infect_period"`,
#' `"onset_to_hosp"`, `"onset_to_death"`.
#'
#' @return A list of `function`s.
#' @keywords internal
as_function <- function(x) {
  stopifnot(
    "Input delay distributions need to be either functions or <epidist>" =
      inherits(x$contact_distribution, c("function", "epidist")) &&
      inherits(x$infect_period, c("function", "epidist"))
  )
  stopifnot(
    "onset_to_hosp and onset_to_death need to be a function, <epidist> or NA" =
      inherits(x$onset_to_hosp, c("function", "epidist")) ||
      is_na(x$onset_to_hosp) &&
      inherits(x$onset_to_death, c("function", "epidist")) ||
      is_na(x$onset_to_death)
  )
  contact_distribution <- as.function(
    x$contact_distribution, func_type = "density"
  )
  infect_period <- as.function(x$infect_period, func_type = "generate")
  if (!is_na(x$onset_to_hosp)) {
    onset_to_hosp <- as.function(x$onset_to_hosp, func_type = "generate")
  } else {
    # function to generate NA instead of hospitalisation times
    onset_to_hosp <- function(x) rep(NA, times = x)
  }
  if (!is_na(x$onset_to_death)) {
    onset_to_death <- as.function(x$onset_to_death, func_type = "generate")
  } else {
    # function to generate NA instead of death times
    onset_to_death <- function(x) rep(NA, times = x)
  }

  # return list of functions
  list(
    contact_distribution = contact_distribution,
    infect_period = infect_period,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death
  )
}
