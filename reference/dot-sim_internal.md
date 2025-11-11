# Internal simulation function called by the exported simulation functions within simulist

This internal function simulates a line list, and when `sim_type` is
`"contacts"` or `"outbreak"` a contacts table as well.

## Usage

``` r
.sim_internal(
  sim_type = c("linelist", "contacts", "outbreak"),
  contact_distribution,
  infectious_period,
  prob_infection,
  onset_to_hosp = NULL,
  onset_to_death = NULL,
  onset_to_recovery = NULL,
  reporting_delay = NULL,
  hosp_risk = NULL,
  hosp_death_risk = NULL,
  non_hosp_death_risk = NULL,
  outbreak_start_date,
  anonymise = NULL,
  outbreak_size,
  population_age,
  case_type_probs = NULL,
  contact_tracing_status_probs = NULL,
  config
)
```

## Arguments

- sim_type:

  A `character` string specifying which simulation function this
  function is being called within.

- contact_distribution:

  A `function` or an `<epiparameter>` object to generate the number of
  contacts per infection.

  The function can be defined or anonymous. The function must have a
  single argument in the form of an `integer` vector with elements
  representing the number of contacts, and return a `numeric` vector
  where each element corresponds to the probability of observing the
  number of contacts in the vector passed to the function. The index of
  the `numeric` vector returned is offset by one to the corresponding
  probability of observing the number of contacts, i.e. the first
  element of the output vector is the probability of observing zero
  contacts, the second element is the probability of observing one
  contact, etc.

  An `<epiparameter>` can be provided. This will be converted into a
  probability mass function internally.

  The default is an anonymous function with a Poisson probability mass
  function ([`dpois()`](https://rdrr.io/r/stats/Poisson.html)) with a
  mean (\\\lambda\\) of 2 contacts per infection.

- infectious_period:

  A `function` or an `<epiparameter>` object for the infectious period.
  This defines the duration from becoming infectious to no longer
  infectious. In the simulation, individuals are assumed to become
  infectious immediately after being infected (the latency period is
  assumed to be zero). The time intervals between an infected individual
  and their contacts are assumed to be uniformly distributed within the
  infectious period. Infectious periods must be strictly positive.

  The function can be defined or anonymous. The function must return a
  vector of randomly generated real numbers representing sampled
  infectious periods. The function must have a single argument, the
  number of random infectious periods to generate.

  An `<epiparameter>` can be provided. This will be converted into
  random number generator internally.

  The default is an anonymous function with a lognormal distribution
  random number generator
  ([`rlnorm()`](https://rdrr.io/r/stats/Lognormal.html)) with
  `meanlog = 2` and `sdlog = 0.5`.

- prob_infection:

  A single `numeric` for the probability of a secondary contact being
  infected by an infected primary contact.

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

- reporting_delay:

  A `function` for the reporting delay distribution or `NULL`. The
  (random) number generating function creates delays between the time of
  symptom onset (`$date_onset`) and the case being reported
  (`$date_reporting`).

  The function can be defined or anonymous. The function must return a
  vector of `numeric`s for the length of the reporting delay. The
  function must have a single argument.

  The default is `NULL` so by default there is no reporting delay, and
  the `$date_reporting` line list column is identical to the
  `$date_onset` column.

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
  [`vignette("time-varying-cfr", package = "simulist")`](https://epiverse-trace.github.io/simulist/articles/time-varying-cfr.md)
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
  [`vignette("time-varying-cfr", package = "simulist")`](https://epiverse-trace.github.io/simulist/articles/time-varying-cfr.md)
  for more information.

- outbreak_start_date:

  A `date` for the start of the outbreak.

- anonymise:

  A `logical` boolean for whether case names should be anonymised.
  Default is `FALSE`.

- outbreak_size:

  A `numeric` vector of length 2 defining the minimum and the maximum
  number of infected individuals for the simulated outbreak. Default is
  `c(10, 1e4)`, so the minimum outbreak size is 10 infected individuals,
  and the maximum outbreak size is 10,000 infected individuals. Either
  number can be changed to increase or decrease the maximum or minimum
  outbreak size to allow simulating larger or smaller outbreaks. If the
  minimum outbreak size cannot be reached after running the simulation
  for many iterations (internally) then the function errors, whereas if
  the maximum outbreak size is exceeded the function returns the data
  early and a warning stating how many cases and contacts are returned.

- population_age:

  Either a `numeric` vector with two elements or a `<data.frame>` with
  age structure in the population. Use a `numeric` vector to specific
  the age range of the population, the first element is the lower bound
  for the age range, and and the second is the upper bound for the age
  range (both inclusive, i.e. \[lower, upper\]). The `<data.frame>` with
  age groups and the proportion of the population in that group. See
  details and examples for more information.

- case_type_probs:

  A named `numeric` vector with the probability of each case type. The
  names of the vector must be `"suspected"`, `"probable"`,
  `"confirmed"`. Values of each case type must sum to one.

- contact_tracing_status_probs:

  A named `numeric` vector with the probability of each contact tracing
  status. The names of the vector must be `"under_followup"`,
  `"lost_to_followup"`, `"unknown"`. Values of each contact tracing
  status must sum to one.

- config:

  A list of settings to adjust the randomly sampled delays and Ct
  values. See
  [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md)
  for more information.

## Value

A `<data.frame>` if `sim_type` is `"linelist"` or `"contacts"`, or a
list of two `<data.frame>`s if `sim_type` is `"outbreak"`.
