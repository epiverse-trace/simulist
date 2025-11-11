# Adjust or subset a line list to account for right truncation

Adjust or subset the line list `<data.frame>` by removing cases that
have not been reported by the truncation time and setting
hospitalisation admission or outcome dates that are after the truncation
point to `NA`.

This is to replicate real-time outbreak data where recent cases or
outcomes are not yet observed or reported (right truncation). It implies
an assumption that symptom onsets are reported with a delay but
hospitalisations are reported instantly.

## Usage

``` r
truncate_linelist(
  linelist,
  truncation_day = 14,
  unit = c("days", "weeks", "months", "years"),
  direction = c("backwards", "forwards")
)
```

## Arguments

- linelist:

  Line list `<data.frame>` output from
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md).

- truncation_day:

  A single `numeric` specifying the number of days (default), weeks,
  months or years before the end of the outbreak (default) or since the
  start of the outbreak (see `direction` argument) to truncate the line
  list at. By default it is 14 days before the end of the outbreak.

  Alternatively, `truncation_day` can accept a `<Date>` and this is used
  as the `truncation_day` and the `unit` and `direction` is ignored.

- unit:

  A `character` string, either `"days"` (default), `"weeks"`,
  `"months"`, or `"years"`, specifying the units of the `truncation_day`
  argument.

  Years are assumed to be 365.25 days and months are assumed to be
  365.25 / 12 days (same as lubridate).

- direction:

  A `character` string, either `"backwards"` (default) or `"forwards"`.
  `direction = backwards` defines the `truncation_day` as the time
  before the end of the outbreak. `direction = forwards` defines the
  `truncation_day` as the time since the start of the outbreak.

## Value

A line list `<data.frame>`.

The output `<data.frame>` has the same structure as the input
`<data.frame>` from
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md),
but can be a subset and dates after truncation set to `NA`.

## Details

The day on which the line list is truncated is the same for all
individuals in the line list, and is specified by the `truncation_day`
and `unit` arguments.

## Examples

``` r
set.seed(1)
linelist <- sim_linelist()
linelist_trunc <- truncate_linelist(linelist)

# set truncation point 3 weeks before the end of outbreak
linelist_trunc <- truncate_linelist(
  linelist,
  truncation_day = 3,
  unit = "weeks"
)

# set truncation point to 2 months since the start of outbreak
linelist_trunc <- truncate_linelist(
  linelist,
  truncation_day = 2,
  unit = "months",
  direction = "forwards"
)

# set truncation point to 2023-03-01
linelist_trunc <- truncate_linelist(
  linelist,
  truncation_day = as.Date("2023-03-01")
)
```
