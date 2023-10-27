#' Check if `<data.frame>` defining age-stratified hospitalisation or death rate
#' is correct
#'
#' @param x A `<data.frame>`.
#'
#' @return A `<data.frame>`, also called for error side-effects when input is
#' invalid.
#' @keywords internal
.check_rate_df <- function(x, age_range) {
  # check input
  stopifnot(
    "column names should be 'age_limit' & 'rate'" =
      setequal(c("age_limit", "rate"), colnames(x)),
    "minimum age of lowest age group should match lower age range" =
      age_range[1] == min(x$age_limit),
    "lower bound of oldest age group must be lower than highest age range" =
      age_range[2] > max(x$age_limit),
    "age limit or rate cannot be NA or NaN" =
      !anyNA(x),
    "rate should be between 0 and 1" =
      min(x$rate) >= 0 & max(x$rate) <= 1,
    "age limit in rate data frame must be unique" =
      !(anyDuplicated(x$age_limit) > 0)
  )

  # order rate df on age_limit
  x <- x[order(x$age_limit), ]

  # format rate data frame
  age_range_ <- age_range[1]:age_range[2]
  # findInterval inclusive/exclusive bound rules match age bracket
  age_groups <- unname(split(age_range_, findInterval(age_range_, x$age_limit)))

  # add and sort data frames cols
  x$max_age <- vapply(age_groups, max, FUN.VALUE = numeric(1))
  colnames(x) <- c("min_age", "rate", "max_age")
  x <- x[, c("min_age", "max_age", "rate")]

  # add informative row names
  row.names(x) <- paste0(
    "[", x$min_age, ",", (x$max_age + 1), ")"
  )
  # last age bracket has inclusive upper bound
  row.names(x)[nrow(x)] <- paste0(
    "[", x$min_age[nrow(x)], ",", x$max_age[nrow(x)], "]"
  )

  # return rate data frame
  x
}
