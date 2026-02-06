# Simulate contacts for an infectious disease outbreak

Simulate contacts for an infectious disease outbreak

## Usage

``` r
sim_contacts(
  contact_distribution = function(x) stats::dpois(x = x, lambda = 2),
  infectious_period = function(n) stats::rlnorm(n = n, meanlog = 2, sdlog = 0.5),
  prob_infection = 0.5,
  outbreak_start_date = as.Date("2023-01-01"),
  anonymise = FALSE,
  outbreak_size = c(10, 10000),
  population_age = c(1, 90),
  contact_tracing_status_probs = c(under_followup = 0.7, lost_to_followup = 0.2, unknown
    = 0.1),
  config = create_config()
)
```

## Arguments

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

A contacts `<data.frame>`.

The structure of the output is:

- `from`:

  `character` column with name of case.

- `to`:

  `character` column with name of contacts of case.

- `age`:

  `integer` with age of infectee.

- `sex`:

  `character` column with either `"m"` or `"f"` for the sex of the
  contact.

- `date_first_contact`:

  `<Date>` column for the first contact between case and contacts.

- `date_last_contact`:

  `<Date>` column for the last contact between case and contacts.

- `was_case`:

  `logical` boolean column with either `TRUE` or `FALSE` for if the
  contact becomes a case.

- `status`:

  `character` column with the status of each contact. By default it is
  either `"case"`, `"under_followup"` `"lost_to_followup"`, or
  `"unknown"`.

## Author

Joshua W. Lambert, Carmen Tamayo

## Examples

``` r
# quickly simulate contact tracing data using the function defaults
contacts <- sim_contacts()
#> Warning: Number of cases exceeds maximum outbreak size. 
#> Returning data early with 10152 cases and 20191 total contacts (including cases).
head(contacts)
#>                from                to age sex date_first_contact
#> 1    Dalena Meadows Nabeela el-Saadeh  85   f         2022-12-31
#> 2    Dalena Meadows Haitham el-Zamani  10   m         2022-12-26
#> 3 Nabeela el-Saadeh  Luc Demmer-White  25   m         2023-01-10
#> 4 Nabeela el-Saadeh   Zachary Johnson  17   m         2023-01-09
#> 5 Nabeela el-Saadeh Sebastian Benally  47   m         2023-01-09
#> 6 Nabeela el-Saadeh  Raamiz al-Salame  48   m         2023-01-10
#>   date_last_contact was_case         status
#> 1        2023-01-04     TRUE           case
#> 2        2023-01-03     TRUE           case
#> 3        2023-01-15     TRUE           case
#> 4        2023-01-15    FALSE under_followup
#> 5        2023-01-15    FALSE under_followup
#> 6        2023-01-17     TRUE           case

# to simulate more realistic contact tracing data load epiparameters from
# {epiparameter}
library(epiparameter)
contact_distribution <- epiparameter(
  disease = "COVID-19",
  epi_name = "contact distribution",
  prob_distribution = create_prob_distribution(
    prob_distribution = "pois",
    prob_distribution_params = c(mean = 2)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

infectious_period <- epiparameter(
  disease = "COVID-19",
  epi_name = "infectious period",
  prob_distribution = create_prob_distribution(
    prob_distribution = "gamma",
    prob_distribution_params = c(shape = 1, scale = 1)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

contacts <- sim_contacts(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5
)
```
