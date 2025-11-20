# Sample the onset-to-outcome time conditional that the outcome is after a hospitalisation event

The outcome of a case, either died or recovered, can have a time of
event, but this must be after the hospitalisation time, if a case has
been admitted to hospital. This function samples either the
onset-to-death or onset-to-recovery time conditional on it being greater
than a onset-to-hospitalisation time for a given case, if the case was
admitted to hospital. It does this by resampling onset-to-outcome (death
or recovery) times if they are less than the onset-to-hospitalisation
time (from
[`.add_hospitalisation()`](https://epiverse-trace.github.io/simulist/dev/reference/dot-add_cols.md)).

## Usage

``` r
.sample_outcome_time(.data, onset_to_outcome, idx)
```

## Arguments

- .data:

  A `<data.frame>` containing the infectious history from a branching
  process simulation
  ([`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/dev/reference/dot-sim_network_bp.md)).

- onset_to_outcome:

  A `function` for either the onset-to-death or onset-to-recovery delay
  distribution. `onset_to_outcome` can also be set to `NULL` to not
  simulate dates for individuals that died or recovered. See
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
  documentation for more information.

- idx:

  Either the `infected_lgl_idx` or `died_lgl_idx` from `.add_outcomes()`
  to define who to sample recovery or death times for, respectively.

## Value

A `<data.frame>` with a potentially modified `$outcome_time` column.
