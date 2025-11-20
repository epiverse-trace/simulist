# Add line list event dates and case information as columns to infectious history `<data.frame>`

These `.add_*()` functions add columns to the `<data.frame>` output by
[`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/dev/reference/dot-sim_network_bp.md).
The `<data.frame>` supplied to `.data` will have a different number of
columns depending on which function is being called (i.e. the
`<data.frame>` supplied to `.add_hospitalisation()` will have more
columns than the `<data.frame>` supplied to `.add_date_contact()` as
former function is called later in the simulation).

The event date could be first contact, last contact or other.

## Usage

``` r
.add_date_contact(
  .data,
  first_contact_distribution,
  last_contact_distribution,
  outbreak_start_date
)

.add_hospitalisation(.data, onset_to_hosp, hosp_risk)

.add_outcome(
  .data,
  onset_to_death,
  onset_to_recovery,
  hosp_death_risk,
  non_hosp_death_risk,
  config
)

.add_names(.data, anonymise = FALSE)

.add_ct(.data, distribution)
```

## Arguments

- .data:

  A `<data.frame>` containing the infectious history from a branching
  process simulation
  ([`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/dev/reference/dot-sim_network_bp.md)).

- first_contact_distribution, last_contact_distribution:

  A `function` to generate the time for the first or last contact
  between the infector and infectee (exposure window). See
  [`create_config()`](https://epiverse-trace.github.io/simulist/dev/reference/create_config.md).

- outbreak_start_date:

  A `date` for the start of the outbreak.

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

- hosp_risk:

  Either a single `numeric` for the hospitalisation risk of everyone in
  the population, or a `<data.frame>` with age specific hospitalisation
  risks. Default is 20% hospitalisation (`0.2`) for the entire
  population. If the `onset_to_hosp` argument is set to `NULL` this
  argument will automatically be set to `NULL` if not specified or can
  be manually set to `NULL`. See details and examples for more
  information.

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

- onset_to_recovery:

  A `function` or an `<epiparameter>` object for the onset-to-recovery
  delay distribution. `onset_to_recovery` can also be `NULL` to not
  simulate dates for individuals that recovered.

  The function can be defined or anonymous. The function must return a
  vector of `numeric`s for the length of the onset-to-recovery delay.
  The function must have a single argument.

  An `<epiparameter>` can be provided. This will be converted into a
  random number generator internally.

  The default is `NULL` so by default cases that recover get an `NA` in
  the `$date_outcome` line list column.

  For hospitalised cases, the function ensures the onset-to-recovery
  time is greater than the onset-to-hospitalisation time. After
  many (1000) attempts, if an onset-to-recovery time (from
  `onset_to_recovery`) cannot be sampled that is greater than a
  onset-to-hospitalisation time (from `onset_to_hosp`) then the function
  will error. Due to this conditional sampling, the onset-to-recovery
  times in the line list may not resemble the distributional form input
  into the function.

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

- config:

  A list of settings to adjust the randomly sampled delays and Ct
  values. See
  [`create_config()`](https://epiverse-trace.github.io/simulist/dev/reference/create_config.md)
  for more information.

- anonymise:

  A `logical` boolean for whether case names should be anonymised.
  Default is `FALSE`.

## Value

A `<data.frame>` with one more column than input into `.data`. Unless
the column heading is already present in which the data is overwritten.
