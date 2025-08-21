#' Censor dates in line list
#'
#' @description
#' Censor `<Date>` columns in line list output from [sim_linelist()] to a
#' specified time interval.
#'
#' This function is similar to [incidence2::incidence()] but does not aggregate
#' events into an `<incidence2>` object, instead it returns the same line list
#' `<data.frame>` as input but with modified event dates.
#'
#' @details
#' The line list columns that contain `<Date>` objects are stored at double
#' point precision by default. In other words, they are not `integer` values,
#' so can be part way through a day. The exact numeric value of the `<Date>`
#' can be seen if you [unclass()] it.
#'
#' Censoring line list dates reduces the time precision (window) of the event.
#' Often dates of events, such as symptom onset or hospital admission are only
#' known to the nearest day, not hour or minute. Other events may be more
#' coarsely censored, for example to the nearest week or month.
#' `censor_linelist()` converts the exact double point precision event
#' `<Date>` to the time `interval` specified.
#'
#' Depending on the `interval` specified, the date columns will be returned
#' as different objects. Here is a list of the valid input `interval` and the
#' resulting class of the date column.
#' * `integer` -> `<grates_period>` (see [grates::as_period()])
#' * `"daily"` -> `<Date>` (see [Date])
#' * `"weekly"` -> `<grates_isoweek>` (see [grates::as_isoweek()])
#' * `"epiweek"` -> `<grates_epiweek>` (see [grates::as_epiweek()])
#' * `"monthly"` -> `<grates_yearmonth>` (see [grates::as_yearmonth()])
#' * `"yearly"` -> `<grates_year>` (see [grates::as_year()])
#'
#' @inheritParams messy_linelist
#' @param interval An `integer` or `character` string for the size of the time
#' interval for censoring. Valid `character` options are:
#' * `"daily`
#' * `"weekly"`
#' * `"epiweek"`
#' * `"montly"`
#' * `"yearly"`
#'
#' See details for information of the date/period objects that are returned for
#' each interval type.
#'
#' @param reporting_artefact A `character` string, either `"none"` (default) or
#' `"weekend_effect"`. By default none of the dates are altered in other ways
#' during censoring, however if `reporting_artefact = "weekend_effect"` then
#' all the dates in the `$date_reporting` column that fall on a weekend are
#' shifted to the following Monday. This artefact is commonly referred to as the
#' "weekend effect" (see \doi{10.1186/s13104-025-07145-y}).
#' @param offset An `integer` or `<Date>` for the value to start counting the
#' period from (0 is the start of the Unix epoch). Only applicable if
#' `interval` is specified as an `integer`.
#'
#' Default date used to start counting from for the `<grates_period>` is the
#' earliest symptom onset date (`$date_onset`). See [grates::as_period()] for
#' more information.
#'
#' If setting `reporting_artefact = "weekend_effects"` the period may start or
#' end on a weekend.
#'
#' @return A line list `<data.frame>`.
#' @export
#'
#' @examples
#' set.seed(1)
#' linelist <- sim_linelist()
#' linelist_cens <- censor_linelist(linelist, interval = "daily")
#'
#' # censor to a 3-day period
#' linelist_cens <- censor_linelist(linelist, interval = 3)
#'
#' # no reporting of events on weekends
#' linelist_cens <- censor_linelist(
#'   linelist,
#'   interval = "daily",
#'   reporting_artefact = "weekend_effects"
#' )
censor_linelist <- function(linelist,
                            interval,
                            reporting_artefact = c("none", "weekend_effects"),
                            offset = min(linelist$date_onset, na.rm = TRUE)) {
  .check_linelist(linelist)
  linelist <- .as_df(linelist)
  reporting_artefact <- match.arg(reporting_artefact)

  if (reporting_artefact == "weekend_effects") {
    # shift weekend reporting dates to the following Monday
    wday <- weekdays(linelist$date_reporting)
    day_map <- c(
      Monday = 0, Tuesday = 0, Wednesday = 0, Thursday = 0, Friday = 0,
      Saturday = 2, Sunday = 1
    )
    linelist$date_reporting <- linelist$date_reporting + unname(day_map[wday])
  }

  if (checkmate::test_number(interval)) {
    checkmate::assert_integerish(
      interval, lower = 1, any.missing = FALSE, len = 1
    )

    linelist <- as.data.frame(
      lapply(linelist, function(x, interval) {
        if (inherits(x, "Date")) {
          x <- grates::as_period(x, n = interval, offset = offset)
        }
        x
      },
      interval = interval)
    )
  } else {
    interval <- match.arg(
      tolower(interval),
      c("daily", "weekly", "epiweek", "monthly", "yearly")
    )

    func <- switch(interval,
      # daily uses base R
      weekly = grates::as_isoweek,
      epiweek = grates::as_epiweek,
      monthly = grates::as_yearmonth,
      yearly = grates::as_year
    )

    linelist <- as.data.frame(
      lapply(linelist, FUN = function(x) {
        if (inherits(x, "Date")) {
          if (interval == "daily") {
            # origin for as.Date.numeric for R <4.3.0
            x <- as.Date(floor(as.numeric(x)), origin = "1970-01-01")
          } else {
            x <- do.call(func, args = list(x))
          }
        }
        x
      })
    )
  }

  linelist <- .restore_df_subclass(linelist)
  linelist
}
