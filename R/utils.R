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
