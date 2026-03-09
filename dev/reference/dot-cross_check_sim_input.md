# Cross check the onset-to-hospitalisation or -death arguments are compatible with hospitalisation and death risks

There are two types of cross-checking:

1.  If the onset-to-event distribution is specified but the
    corresponding risk is not specified (i.e. `NULL`) the function will
    error ([`stop()`](https://rdrr.io/r/base/stop.html)).

2.  If the onset-to-event distribution is not specified (i.e. `NULL`)
    but the corresponding risk is specified the function will throw a
    warning ([`warning()`](https://rdrr.io/r/base/warning.html)).

The difference in condition handling is because in the case that the
onset-to-event is `NULL` the simulation can safely ignore the
corresponding risk, while throwing a warning, as there are no events. In
other words, if the onset-to-hospitalisation is not specified, no
infected individuals will go to hospital and the `date_admission` column
in the line list will all be `NA`s. However, if the onset-to-event is
specified and the corresponding risk is `NULL` then the proportion of
individuals infected that are hospitalised or die cannot be calculated
and therefore the simulation cannot run. It is in this latter case that
the cross-checking throws an error.

## Usage

``` r
.cross_check_sim_input(
  onset_to_hosp,
  onset_to_death,
  hosp_risk,
  hosp_death_risk,
  non_hosp_death_risk
)
```

## Arguments

- onset_to_hosp:

  A `function` or an `<epiparameter>` object for the
  onset-to-hospitalisation delay distribution. `onset_to_hosp` can also
  be set to `NULL` to not simulate hospitalisation (admission) dates.

  The function can be defined or anonymous. The function must return a
  vector of `numeric`s for the length of the onset-to-hospitalisation
  delay. The function must have a single argument.

  An `<epiparameter>` can be provided. This will be converted into a
  random number generator internally.

  The default is an anonymous function with a lognormal distribution
  random number generator
  ([`rlnorm()`](https://rdrr.io/r/stats/Lognormal.html)) with
  `meanlog = 1.5` and `sdlog = 0.5`.

  If `onset_to_hosp` is set to `NULL` then `hosp_risk` and
  `hosp_death_risk` will be automatically set to `NULL` if not manually
  specified.

- onset_to_death:

  A `function` or an `<epiparameter>` object for the onset-to-death
  delay distribution. `onset_to_death` can also be set to `NULL` to not
  simulate dates for individuals that died.

  The function can be defined or anonymous. The function must return a
  vector of `numeric`s for the length of the onset-to-death delay. The
  function must have a single argument.

  An `<epiparameter>` can be provided. This will be converted into a
  random number generator internally.

  The default is an anonymous function with a lognormal distribution
  random number generator
  ([`rlnorm()`](https://rdrr.io/r/stats/Lognormal.html)) with
  `meanlog = 2.5` and `sdlog = 0.5`.

  If `onset_to_death` is set to `NULL` then `non_hosp_death_risk` and
  `hosp_death_risk` will be automatically set to `NULL` if not manually
  specified.

  For hospitalised cases, the function ensures the onset-to-death time
  is greater than the onset-to-hospitalisation time. After many (1000)
  attempts, if an onset-to-death time (from `onset_to_death`) cannot be
  sampled that is greater than a onset-to-hospitalisation time (from
  `onset_to_hosp`) then the function will error. Due to this conditional
  sampling, the onset-to-death times in the line list may not resemble
  the distributional form input into the function.

- hosp_risk:

  Either a single `numeric` for the hospitalisation risk of everyone in
  the population, or a `<data.frame>` with age specific hospitalisation
  risks. Default is 20% hospitalisation (`0.2`) for the entire
  population. If the `onset_to_hosp` argument is set to `NULL` this
  argument will automatically be set to `NULL` if not specified or can
  be manually set to `NULL`. See details and examples for more
  information.

- hosp_death_risk:

  Either a single `numeric` for the death risk for hospitalised
  individuals across the population, or a `<data.frame>` with age
  specific hospitalised death risks Default is 50% death risk in
  hospitals (`0.5`) for the entire population. If the `onset_to_death`
  argument is set to `NULL` this argument will automatically be set to
  `NULL` if not specified or can be manually set to `NULL`. See details
  and examples for more information. The `hosp_death_risk` can vary
  through time if specified in the `time_varying_death_risk` element of
  `config`, see
  [`vignette("time-varying-cfr", package = "simulist")`](https://epiverse-trace.github.io/simulist/dev/articles/time-varying-cfr.md)
  for more information.

- non_hosp_death_risk:

  Either a single `numeric` for the death risk for outside of hospitals
  across the population, or a `<data.frame>` with age specific death
  risks outside of hospitals. Default is 5% death risk outside of
  hospitals (`0.05`) for the entire population. If the `onset_to_death`
  argument is set to `NULL` this argument will automatically be set to
  `NULL` if not specified or can be manually set to `NULL`. See details
  and examples for more information. The `non_hosp_death_risk` can vary
  through time if specified in the `time_varying_death_risk` element of
  `config`, see
  [`vignette("time-varying-cfr", package = "simulist")`](https://epiverse-trace.github.io/simulist/dev/articles/time-varying-cfr.md)
  for more information.

## Value

Invisibly return the `onset_to_hosp` argument. The function is called
for its side-effects, which will error or warn if the input is invalid.
