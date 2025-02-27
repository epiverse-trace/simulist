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
#' The point at which the line list is right-truncated is the same for
#' all individuals in the line list, and is specified by the
#' `truncation_time` and `unit` arguments.
#'
#' @inheritParams messy_linelist
#' @param truncation_time A single `numeric` specifying the number of
#' days (default), weeks, months or years before the end of the outbreak
#' (default) or since the start of the outbreak (see `direction` argument)
#' to truncate the line list at. By default it is 14 days before the end
#' of the outbreak.
#'
#' Alternatively, `truncation_time` can accept a `<Date>` and this is
#' used as the `truncation_time` and the `unit` and `direction` is ignored.
#'
#' @param unit A `character` string, either `"days"` (default),
#' `"weeks"`, `"months"`, or `"years"`, specifying the units of the
#' `truncation_time` argument.
#'
#' Years are assumed to be 365.25 days and months are assumed to be 365.25 / 12
#' days (same as \pkg{lubridate}).
#'
#' @param direction A `character` string, either `"backwards"` (default) or
#' `"forwards"`. `direction = backwards` defines the `truncation_time` as
#' the time before the end of the outbreak. `direction = forwards` defines
#' the `truncation_time` as the time since the start of the outbreak.
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
#'   truncation_time = 3,
#'   unit = "weeks"
#' )
#'
#' # set truncation point to 2 months since the start of outbreak
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   truncation_time = 2,
#'   unit = "months",
#'   direction = "forwards"
#' )
#'
#' # set truncation point to 2023-03-01
#' linelist_trunc <- truncate_linelist(
#'   linelist,
#'   truncation_time = as.Date("2023-03-01")
#' )
truncate_linelist <- function(linelist,
                              truncation_time = 14,
                              unit = c("days", "weeks", "months", "years"),
                              direction = c("backwards", "forwards")) {
  arg_ignore <- missing(unit) && missing(direction)
  .check_linelist(linelist)
  stopifnot(
    "`truncation_time` must be a single positive numeric or a <Date> object." =
      checkmate::test_number(truncation_time, lower = 0, finite = TRUE) ||
      checkmate::test_date(truncation_time, any.missing = FALSE, len = 1)
    )
  unit <- match.arg(unit)
  direction <- match.arg(direction)

  if (is.numeric(truncation_time)) {
    # convert truncation_time to days
    truncation_time <- switch(unit,
      days = truncation_time,
      weeks = truncation_time * 7,
      months = truncation_time * (365.25 / 12),
      years = truncation_time * 365.25
    )

    date_cols <- grep(pattern = "date_", x = colnames(linelist), fixed = TRUE)
    if (direction == "backwards") {
      # get present as maximum date in line list
      max_date <- as.Date(
        max(unlist(linelist[, date_cols]), na.rm = TRUE),
        origin = "1970-01-01"
      )
      trunc_date <- max_date - truncation_time
    } else {
      # get outbreak start date as minimum date in line list
      min_date <- as.Date(
        min(unlist(linelist[, date_cols]), na.rm = TRUE),
        origin = "1970-01-01"
      )
      trunc_date <- min_date + truncation_time
    }
  } else {
    trunc_date <- truncation_time
    if (!arg_ignore) {
      warning(
        "When `truncation_time` is given as a <Date>, ",
        "`unit` and `direction` are ignored.",
        call. = FALSE
      )
    }
  }

  # which cases are reported before the truncation date (i.e. included)
  reported_lgl_idx <- trunc_date > linelist$date_reporting
  linelist <- linelist[reported_lgl_idx, ]

  # convert events (reporting, admissions & outcomes) more recent than
  # truncation time to NA
  linelist$date_outcome[linelist$date_outcome > trunc_date] <- NA_real_
  linelist$date_admission[linelist$date_admission > trunc_date] <- NA_real_

  row.names(linelist) <- NULL
  linelist
}
