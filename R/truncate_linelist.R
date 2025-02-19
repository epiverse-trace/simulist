#' Adjust or subset a line list to account for right truncation
#'
#' @description
#' Adjust or subset the line list `<data.frame>` by either changing dates that
#' are within the right-truncation window to `NA` or removing cases that have
#' occurred within a delay period. This occurs to recent cases or outcomes
#' that are not yet recorded in the line list and will be revised upwards. See
#' `truncation_event` argument documentation for different types of truncation.
#'
#' @details
#' The truncation window is sampled for each individual and is specified by a
#' (random) number generating function supplied to the `delay`
#' argument. Therefore, if this function has variability
#' (e.g. a probability distribution) it will not be a fixed time window for
#' all individuals. It is possible that someone with a more recent date of
#' onset is kept but someone with a less recent date of onset is removed due
#' to the variability in the reporting delays. See examples for variable or
#' fixed `delay` functions.
#'
#' @param linelist A `<data.frame>` output from [sim_linelist()].
#' @param delay A `function` (either anonymous or predefined) that
#' has a single argument and generates random numbers given a probability
#' distribution. The function must return a vector of real numbers for
#' representing the reporting delay between the right-truncation point and the
#' cut off date (`max_date`).
#'
#' Default is a random number generator that is lognormally
#' distributed ([rlnorm()]) delay with parameters `meanlog = 0.58` and
#' `sdlog = 0.47`, which corresponds to a mean of 2 and a standard deviation
#' of 1.
#' @param max_date A maximum date to cut off the outbreak and apply reporting
#' delays. Default is `NULL`, so the maximum date will be automatically
#' calculated as the date at the end of the outbreak (i.e. date of the last
#' outcome).
#' @param truncation_event A `character` string with which event in the line
#' list the right truncation should apply to. The default is `"reporting"` for
#' the reporting delay, which is likely the most common form of right truncation
#' in real-time outbreak data. When `truncation_event = "reporting"` if a date
#' of reporting (`$date_reporting`) is more recent than the sampled truncation
#' time then the individual (row) is removed from the line list. If the date of
#' reporting is less recent than the sampled truncation time but either the
#' date of hospitalisation (`$date_admission`) or date of outcome
#' (`$date_outcome`) is more recent than the sampled truncation time then these
#' dates are converted from `Date`s to `NA`s.
#'
#' The other options for `truncation_event` are `"onset"`, `"admission"`
#' or `"outcome"`.  If these are chosen then if the truncation point is more
#' recent than the date of symptom onset, date of hospital admission, or
#' date of outcome (death or recovery), respectively, then these individuals
#' (rows) will be removed from the line list (i.e. the `<data.frame>` is
#' subset). If the event is less recent than the sampled truncation time then
#' any events after the truncation point will be set to `NA`.
#'
#' @return A line list `<data.frame>`.
#' @export
#'
#' @examples
#' set.seed(1)
#' linelist <- sim_linelist()
#' linelist_trunc <- truncate_linelist(linelist)
#'
#' # set maximum date to apply truncation to 2023-01-01
#' linelist_trunc <- truncate_linelist(linelist, max_date = "2023-01-01")
#'
#' # apply longer truncation to hospital admission
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   delay = function(x) rlnorm(n = x, meanlog = 2, sdlog = 0.5),
#'   truncation_event = "admission"
#' )
#'
#' # variable right truncation with mean 2 and sd 1 (default behaviour)
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   delay = function(x) rlnorm(n = x, meanlog = 0.58, sdlog = 0.47)
#' )
#'
#' # fixed right truncation of 5 days
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   delay = function(x) rep(5, n = x)
#' )
truncate_linelist <- function(linelist,
                              delay = function(x) stats::rlnorm(n = x, meanlog = 0.58, sdlog = 0.47), # nolint line_length_linter
                              max_date = NULL,
                              truncation_event = c("reporting", "onset",
                                                   "admission", "outcome")) {
  .check_linelist(linelist)
  .check_func_req_args(func = delay, func_name = "delay", n_req_args = 1)
  truncation_event <- match.arg(truncation_event)
  if (is.null(max_date)) {
    date_cols <- grep(pattern = "date_", x = colnames(linelist), fixed = TRUE)
    max_date <- as.Date(
      max(unlist(linelist[, date_cols]), na.rm = TRUE),
      origin = "1970-01-01"
    )
  }
  if (!inherits(max_date, "Date")) {
    # enables numeric max_date for R <4.3.0
    # https://github.com/wch/r-source/commit/920affdc32cba1baa765fb3a647570d407dfccaa # nolint line_length_linter
    max_date <- as.Date(max_date, origin = "1970-01-01")
    message(
      "Truncation max date is: ", max_date, ".\n",
      "Assuming an origin of '1970-01-01' in line with R >= v4.3.0."
    )
  }
  col_name <- paste0("date_", truncation_event)
  trunc_time <- delay(nrow(linelist))
  # sample which onset dates are longer than reporting delay (i.e. reported)
  reported_lgl_idx <-
    (max_date - linelist[[col_name]]) > trunc_time
  # convert NAs to TRUE to prevent issues with subsetting with NAs
  reported_lgl_idx[is.na(reported_lgl_idx)] <- TRUE
  linelist <- linelist[reported_lgl_idx, ]

  # subset truncation times to remove times for individuals removed above
  trunc_time <- trunc_time[reported_lgl_idx]

  # convert events (reporting, admissions & outcomes) more recent than
  # truncation time to NA
  missing_outcome_lgl_idx <- (max_date - linelist$date_outcome) < trunc_time
  linelist$date_outcome[missing_outcome_lgl_idx] <- NA_real_
  missing_admission_lgl_idx <- (max_date - linelist$date_admission) < trunc_time
  linelist$date_admission[missing_admission_lgl_idx] <- NA_real_
  missing_reporting_lgl_idx <- (max_date - linelist$date_reporting) < trunc_time
  linelist$date_reporting[missing_reporting_lgl_idx] <- NA_real_

  row.names(linelist) <- NULL
  linelist
}
