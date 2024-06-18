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
#' @inheritParams .add_cols
#' @param buffer_factor A single `numeric` determining the level of
#' oversampling (or buffer) when creating a vector of unique names from
#' [randomNames()].
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
#' Named list elements are: `"contact_distribution"`, `"infectious_period"`,
#' `"onset_to_hosp"`, `"onset_to_death"`, `"onset_to_recovery".`
#'
#' @return A list of `function`s.
#' @keywords internal
as_function <- function(x) {
  stopifnot(
    "Input delay distributions need to be either functions or <epidist>" =
      inherits(x$contact_distribution, c("function", "epidist")) &&
      inherits(x$infectious_period, c("function", "epidist")),
    "onset_to_hosp, onset_to_death and onset_to_recovery need to be a function,
    <epidist> or NA" =
      inherits(x$onset_to_hosp, c("function", "epidist")) ||
      rlang::is_lgl_na(x$onset_to_hosp) &&
      inherits(x$onset_to_death, c("function", "epidist")) ||
      rlang::is_lgl_na(x$onset_to_death)
  )
  contact_distribution <- as.function(
    x$contact_distribution, func_type = "density"
  )
  infectious_period <- as.function(x$infectious_period, func_type = "generate")
  if (rlang::is_lgl_na(x$onset_to_hosp)) {
    # function to generate NA instead of hospitalisation times
    onset_to_hosp <- function(x) rep(NA, times = x)
  } else {
    onset_to_hosp <- as.function(x$onset_to_hosp, func_type = "generate")
  }
  if (rlang::is_lgl_na(x$onset_to_death)) {
    # function to generate NA instead of death times
    onset_to_death <- function(x) rep(NA, times = x)
  } else {
    onset_to_death <- as.function(x$onset_to_death, func_type = "generate")
  }
  if (rlang::is_lgl_na(x$onset_to_recovery)) {
    # function to generate NA instead of recovery times
    onset_to_recovery <- function(x) rep(NA, times = x)
  } else {
    onset_to_recovery <- as.function(
      x$onset_to_recovery, func_type = "generate"
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

#' Sample age of individuals
#'
#' @description
#' The ages are sampled either uniformly (using [sample()]), or are sampled
#' with age-structured populations when the `population_age` argument is a
#' `<data.frame>`.
#'
#' @inheritParams sim_linelist
#' @param n A single `numeric` specifying how many times to sample.
#'
#' @return A `numeric` vector.
#' @keywords internal
.sample_age <- function(index_age, population_age, n, contact_df) {
  contact_sample_weight <- 1L
  if (is.data.frame(contact_df)) {
    # find which age group index case is in
    age_groups <- apply(
      contact_df[, c("min_age", "max_age")],
      MARGIN = 1,
      function(x) x[1]:x[2]
    )
    age_group_row <- vapply(
      age_groups,
      function(x, y) any(y %in% x),
      FUN.VALUE = logical(1),
      y = index_age
    )

    # subset matrix to index case row and replicate weight ages in each group
    contact_df_row <- contact_df[age_group_row, ]
    contact_sample_weight <- rep(
      unlist(contact_df_row[, 3:ncol(contact_df)]),
      times = lengths(age_groups)
    )
  }

  if (is.data.frame(population_age)) {
    age_groups <- apply(population_age, MARGIN = 1, function(x) x[1]:x[2])
    age <- unlist(age_groups)
    pop_sample_weight <- rep(
      population_age$proportion,
      times = lengths(age_groups)
    )
    # normalise for vector length
    pop_sample_weight <- pop_sample_weight /
      rep(lengths(age_groups), times = lengths(age_groups))
  } else {
    age <- population_age[["lower"]]:population_age[["upper"]]
    pop_sample_weight <- 1L
  }

  # combine sample weights from contacts and population
  sample_weight <- contact_sample_weight * pop_sample_weight

  # sample age
  age <- sample(x = age, size = n, replace = TRUE, prob = sample_weight)

  # return age vector
  age
}


#' Format a contact matrix into the \pkg{simulist} style and convert to
#' `<data.frame>`
#'
#' @param x A contact `matrix`.
#'
#' @return A contact matrix `<data.frame>`.
#' @keywords internal
.format_contact_matrix <- function(x, population_age) {
  # convert matrix to data.frame
  x <- as.data.frame(x)
  colnames(x) <- row.names(x)

  # get lower and upper age limits for each group
  age_groups <- row.names(x)
  age_bounds <- strsplit(age_groups, split = ",", fixed = TRUE)
  age_bounds <- lapply(
    age_bounds,
    gsub,
    pattern = ".*?([0-9]+).*",
    replacement = "\\1"
  )
  age_bounds <- lapply(age_bounds, as.numeric)
  # if last element has single element (e.g. 40+) append upper age bound
  if (length(age_bounds[length(age_bounds)]) == 1) {
    age_bounds[[length(age_bounds)]] <- c(
      age_bounds[[length(age_bounds)]],
      population_age[["upper"]]
    )
  }

  min_age <- vapply(age_bounds, "[[", FUN.VALUE = numeric(1), 1)
  max_age <- vapply(age_bounds, "[[", FUN.VALUE = numeric(1), 2)
  # adjust max values that are exclusive bounds
  max_age_ <- max_age - 1
  # oldest age group has inclusive upper bound
  max_age_[length(max_age_)] <- max_age[length(max_age)]
  max_age <- max_age_

  # bind min and max age for each group to data.frame
  x <- cbind(min_age = min_age, max_age = max_age, x)
  row.names(x) <- NULL

  # return contact matrix data.frame
  x
}
