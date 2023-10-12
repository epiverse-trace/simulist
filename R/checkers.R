#' Check if `<data.frame>` defining age-stratified hospitalisation or death rate
#' is correct
#'
#' @param x A `<data.frame>`.
#'
#' @return A `<data.frame>`, also called for error side-effects when input is
#' invalid.
#' @keywords internal
.check_rate_df <- function(x, age_range) {
  stopifnot(
    "column names should be 'min_age', 'max_age' & 'rate'" =
      c("min_age", "max_age", "rate") %in% colnames(x),
    "minimum age of lowest age group should match lower age range" =
      age_range[1] == min(x$min_age),
    "maximum age of the highest age group should match upper age range" =
      age_range[2] == max(x$max_age),
    "rate should be between 0 and 1" =
      min(x$rate) >= 0 & max(x$rate) <= 1
  )

  rownames(x) <- paste0(
    "[", x$min_age, ",", x$max_age, ")"
  )

  # last age bracket has inclusive upper bound
  rownames(x)[nrow(x)] <- gsub(
    pattern = ")",
    replacement = "]",
    x = rownames(x)[nrow(x)],
    fixed = TRUE
  )

  # return rate data frame
  x
}
