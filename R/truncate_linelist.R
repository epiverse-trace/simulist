#' Adjust or subset a line list to account for right truncation
#'
#' @description
#' Adjust or subset the line list `<data.frame>` by removing cases that
#' have not been reported by the truncation time and setting hospitalisation
#' admission or outcome dates that are after the truncation point to `NA`.
#'
#' This is to replicate real-time outbreak data where recent cases or outcomes
#' are not yet observed or reported (right truncation). It implies an assumption
#' that symptom onsets are reported with a delay but hospitalisations are
#' reported instantly.
#'
#' @details
#' The day on which the line list is truncated is the same for
#' all individuals in the line list, and is specified by the
#' `truncation_day` and `unit` arguments.
#'
#' @inheritParams messy_linelist
#' @param truncation_day A single `numeric` specifying the number of
#' days (default), weeks, months or years before the end of the outbreak
#' (default) or since the start of the outbreak (see `direction` argument)
#' to truncate the line list at. By default it is 14 days before the end
#' of the outbreak.
#'
#' Alternatively, `truncation_day` can accept a `<Date>` and this is
#' used as the `truncation_day` and the `unit` and `direction` is ignored.
#'
#' @param unit A `character` string, either `"days"` (default),
#' `"weeks"`, `"months"`, or `"years"`, specifying the units of the
#' `truncation_day` argument.
#'
#' Years are assumed to be 365.25 days and months are assumed to be 365.25 / 12
#' days (same as \pkg{lubridate}).
#'
#' @param direction A `character` string, either `"backwards"` (default) or
#' `"forwards"`. `direction = backwards` defines the `truncation_day` as
#' the time before the end of the outbreak. `direction = forwards` defines
#' the `truncation_day` as the time since the start of the outbreak.
#'
#' @return A line list `<data.frame>`.
#' @export
#'
#' @examples
#' set.seed(1)
#' linelist <- sim_linelist()
#' linelist_trunc <- truncate_linelist(linelist)
#'
#' # set truncation point 3 weeks before the end of outbreak
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   truncation_day = 3,
#'   unit = "weeks"
#' )
#'
#' # set truncation point to 2 months since the start of outbreak
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   truncation_day = 2,
#'   unit = "months",
#'   direction = "forwards"
#' )
#'
#' # set truncation point to 2023-03-01
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   truncation_day = as.Date("2023-03-01")
#' )
truncate_linelist <- function(linelist,
                              truncation_day = 14,
                              unit = c("days", "weeks", "months", "years"),
                              direction = c("backwards", "forwards")) {
  arg_ignore <- missing(unit) && missing(direction)
  .check_linelist(linelist)
  linelist <- .as_df(linelist)
  stopifnot(
    "`truncation_day` must be a single nonnegative numeric or <Date> object." =
      checkmate::test_number(truncation_day, lower = 0, finite = TRUE) ||
      checkmate::test_date(truncation_day, any.missing = FALSE, len = 1)
    )
  unit <- match.arg(unit)
  direction <- match.arg(direction)

  if (is.numeric(truncation_day)) {
    # convert truncation_day to days
    truncation_day <- switch(unit,
      days = truncation_day,
      weeks = truncation_day * 7,
      months = truncation_day * (365.25 / 12),
      years = truncation_day * 365.25
    )

    date_cols <- grep(pattern = "date_", x = colnames(linelist), fixed = TRUE)
    if (direction == "backwards") {
      # get present as maximum date in line list
      max_date <- as.Date(
        max(unlist(linelist[, date_cols]), na.rm = TRUE),
        origin = "1970-01-01"
      )
      trunc_date <- max_date - truncation_day
    } else {
      # get outbreak start date as minimum date in line list
      min_date <- as.Date(
        min(unlist(linelist[, date_cols]), na.rm = TRUE),
        origin = "1970-01-01"
      )
      trunc_date <- min_date + truncation_day
    }
  } else {
    trunc_date <- truncation_day
    if (!arg_ignore) {
      warning(
        "When `truncation_day` is given as a <Date>, ",
        "`unit` and `direction` are ignored.",
        call. = FALSE
      )
    }
  }

  # which cases are reported before the truncation date (i.e. included)
  reported_lgl_idx <- trunc_date > linelist$date_reporting
  linelist <- linelist[reported_lgl_idx, ]

  # convert outcomes more recent than truncation time to NA by outcome date
  linelist$outcome[linelist$date_outcome > trunc_date] <- NA_character_

  # get date columns to be modified if after truncation time
  date_col_lgl_idx <- vapply(
    linelist, inherits, FUN.VALUE = logical(1), what = "Date"
  )
  date_cols <- colnames(linelist)[date_col_lgl_idx]
  for (date_col in date_cols) {
    # convert events (reporting, admissions & outcomes) more recent than
    # truncation time to NA
    linelist[[date_col]][linelist[[date_col]] > trunc_date] <- NA_real_
  }

  row.names(linelist) <- NULL
  linelist <- .restore_df_subclass(linelist)
  linelist
}
