# Censor dates in line list

Censor `<Date>` columns in line list output from
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
to a specified time interval.

This function is similar to
[`incidence2::incidence()`](https://rdrr.io/pkg/incidence2/man/incidence.html)
but does not aggregate events into an `<incidence2>` object, instead it
returns the same line list `<data.frame>` as input but with modified
event dates.

## Usage

``` r
censor_linelist(
  linelist,
  interval,
  reporting_artefact = c("none", "weekend_effects"),
  offset = min(linelist$date_onset, na.rm = TRUE)
)
```

## Arguments

- linelist:

  Line list `<data.frame>` output from
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md).

- interval:

  An `integer` or `character` string for the size of the time interval
  for censoring. Valid `character` options are:

  - `"daily`

  - `"weekly"`

  - `"epiweek"`

  - `"montly"`

  - `"yearly"`

  See details for information of the date/period objects that are
  returned for each interval type.

- reporting_artefact:

  A `character` string, either `"none"` (default) or `"weekend_effect"`.
  By default none of the dates are altered in other ways during
  censoring, however if `reporting_artefact = "weekend_effect"` then all
  the dates in the `$date_reporting` column that fall on a weekend are
  shifted to the following Monday. This artefact is commonly referred to
  as the "weekend effect" (see
  [doi:10.1186/s13104-025-07145-y](https://doi.org/10.1186/s13104-025-07145-y)
  ).

- offset:

  An `integer` or `<Date>` for the value to start counting the period
  from (0 is the start of the Unix epoch). Only applicable if `interval`
  is specified as an `integer`.

  Default date used to start counting from for the `<grates_period>` is
  the earliest symptom onset date (`$date_onset`). See
  [`grates::as_period()`](https://rdrr.io/pkg/grates/man/period_class.html)
  for more information.

  If setting `reporting_artefact = "weekend_effects"` the period may
  start or end on a weekend.

## Value

A line list `<data.frame>`.

## Details

The line list columns that contain `<Date>` objects are stored at double
point precision by default. In other words, they are not `integer`
values, so can be part way through a day. The exact numeric value of the
`<Date>` can be seen if you
[`unclass()`](https://rdrr.io/r/base/class.html) it.

Censoring line list dates reduces the time precision (window) of the
event. Often dates of events, such as symptom onset or hospital
admission are only known to the nearest day, not hour or minute. Other
events may be more coarsely censored, for example to the nearest week or
month. `censor_linelist()` converts the exact double point precision
event `<Date>` to the time `interval` specified.

Depending on the `interval` specified, the date columns will be returned
as different objects. Here is a list of the valid input `interval` and
the resulting class of the date column.

- `integer` -\> `<grates_period>` (see
  [`grates::as_period()`](https://rdrr.io/pkg/grates/man/period_class.html))

- `"daily"` -\> `<Date>` (see [Date](https://rdrr.io/r/base/Dates.html))

- `"weekly"` -\> `<grates_isoweek>` (see
  [`grates::as_isoweek()`](https://rdrr.io/pkg/grates/man/isoweek_class.html))

- `"epiweek"` -\> `<grates_epiweek>` (see
  [`grates::as_epiweek()`](https://rdrr.io/pkg/grates/man/epiweek_class.html))

- `"monthly"` -\> `<grates_yearmonth>` (see
  [`grates::as_yearmonth()`](https://rdrr.io/pkg/grates/man/yearmonth_class.html))

- `"yearly"` -\> `<grates_year>` (see
  [`grates::as_year()`](https://rdrr.io/pkg/grates/man/year_class.html))

## Examples

``` r
set.seed(1)
linelist <- sim_linelist()
linelist_cens <- censor_linelist(linelist, interval = "daily")

# censor to a 3-day period
linelist_cens <- censor_linelist(linelist, interval = 3)

# no reporting of events on weekends
linelist_cens <- censor_linelist(
  linelist,
  interval = "daily",
  reporting_artefact = "weekend_effects"
)
```
