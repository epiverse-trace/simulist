# Getting Started with {simulist}

This is an introductory vignette to the {simulist} R package. {simulist}
simulates two types of common epidemiological data collected during
infectious disease outbreaks: 1) a line list, which provides
individual-level descriptions of cases in an outbreak; 2) a contact
dataset, which provides details of which others individuals were in
contact with each of the cases.

The main function in the {simulist} package is
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md).
This functions takes in arguments that control the dynamics of the
outbreak, such as the infectious period, and outputs a line list table
(`<data.frame>`) with case information for each infected individual.

For this introduction we will simulate a line list for the early stages
of a COVID-19 (SARS-CoV-2) outbreak. This will require two R packages:
{simulist}, to produce the line list, and {epiparameter} to provide
epidemiological parameters, such as onset-to-death delays.

``` r
library(simulist)
library(epiparameter)
```

First we load in some data that is required for the line list
simulation. Data on epidemiological parameters and distributions are
read from the {epiparameter} R package.

``` r
# create contact distribution (not available from {epiparameter} database)
contact_distribution <- epiparameter(
  disease = "COVID-19",
  epi_name = "contact distribution",
  prob_distribution = create_prob_distribution(
    prob_distribution = "pois",
    prob_distribution_params = c(mean = 2)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

# create infectious period (not available from {epiparameter} database)
infectious_period <- epiparameter(
  disease = "COVID-19",
  epi_name = "infectious period",
  prob_distribution = create_prob_distribution(
    prob_distribution = "gamma",
    prob_distribution_params = c(shape = 1, scale = 1)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

onset_to_hosp <- epiparameter(
  disease = "COVID-19",
  epi_name = "onset to hospitalisation",
  prob_distribution = create_prob_distribution(
    prob_distribution = "lnorm",
    prob_distribution_params = c(meanlog = 1, sdlog = 0.5)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

# get onset to death from {epiparameter} database
onset_to_death <- epiparameter_db(
  disease = "COVID-19",
  epi_name = "onset to death",
  single_epiparameter = TRUE
)
#> Using Linton N, Kobayashi T, Yang Y, Hayashi K, Akhmetzhanov A, Jung S, Yuan
#> B, Kinoshita R, Nishiura H (2020). "Incubation Period and Other
#> Epidemiological Characteristics of 2019 Novel Coronavirus Infections
#> with Right Truncation: A Statistical Analysis of Publicly Available
#> Case Data." _Journal of Clinical Medicine_. doi:10.3390/jcm9020538
#> <https://doi.org/10.3390/jcm9020538>.. 
#> To retrieve the citation use the 'get_citation' function
```

The seed is set to ensure the output of the vignette is consistent. When
using {simulist}, setting the seed is not required unless you need to
simulate the same line list multiple times.

``` r
set.seed(123)
```

The first argument in
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
is the contact distribution (`contact_distribution`), which here we
specify as Poisson distribution with a mean (average) number of contacts
of 2, and with the infectious period and probability of infection per
contact (`prob_infection`) will control the growth rate of the simulated
epidemic. Here we set the probability of infection as 0.5 (on average
half of contacts become infected). The minimum requirements to simulate
a line list are the contact distribution, the infectious period,
probability of infection, onset-to-hospitalisation delay and
onset-to-death delay.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id             case_name case_type sex age date_onset date_reporting
#> 1  1         Fabian Mrazik confirmed   m  90 2023-01-01     2023-01-01
#> 2  3       Ashley Martinez confirmed   f  71 2023-01-01     2023-01-01
#> 3  4                Tia Vu  probable   f  48 2023-01-01     2023-01-01
#> 4  5 Abdul Majeed el-Saleh confirmed   m  77 2023-01-01     2023-01-01
#> 5  6        Courtney Flood suspected   f  83 2023-01-02     2023-01-02
#> 6  7          Joseph Jiron suspected   m  56 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2     2023-01-04      died   2023-01-10         2022-12-26        2023-01-06
#> 3           <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 4           <NA> recovered         <NA>         2022-12-31        2023-01-08
#> 5           <NA> recovered         <NA>         2022-12-26        2023-01-04
#> 6           <NA> recovered         <NA>         2022-12-28        2023-01-03
#>   ct_value
#> 1     21.9
#> 2     22.7
#> 3       NA
#> 4     27.4
#> 5       NA
#> 6       NA
```

## Controlling outbreak size

The reproduction number ($R$) has a strong influence on the size of an
outbreak. For {simulist}, the reproduction number is, not provided
directly, but rather is determined by the mean number of contacts and
the probability of infection. However, the {simulist} package generates
line list data using a stochastic algorithm, so even when $R < 1$ it can
produce a substantial outbreak by chance, or an $R > > 1$ will sometimes
not produce a vast epidemic in one simulation (i.e. one replicate) due
to the stochasticity.

*Alert*

The reproduction number ($R$) of the simulation results from the contact
distribution (`contact_distribution`) and the probability of infection
(`prob_infection`); the number of infections is a binomial sample of the
number of contacts for each case with the probability of infection
(i.e. being sampled) given by `prob_infect`. If the average number of
secondary infections from each primary case is greater than 1 ($R > 1$)
then this can lead to the outbreak becoming extremely large.

There is currently no depletion of susceptible individuals in the
simulation model (i.e. infinite population size), so the maximum
outbreak size (second element of the vector supplied to the
`outbreak_size` argument) can be used to return a line list early
without producing an excessively large data set.

If $R > 1$, the simulation may return early after reaching the maximum
outbreak size. In these scenarios when $R > 1$, the $R$ value is
controlling the rate at which the maximum outbreak size is reached
rather than the size of the outbreak (not all simulations with $R > 1$
will reach the maximum outbreak size due to stochasticity).

The simulation is therefore sensitive to the contact distribution and
probability of infection resulting in an $R$ just above or below 1.

When requiring a minimum or maximum outbreak size we can specify the
`outbreak_size` argument in
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md).
By default this is set to 10 and 10,000 for the minimum and maximum,
respectively. In the case of the minimum outbreak size, this means that
the simulation will not return a line list until the conditioning has
been met. In other words, the simulation will resimulate a branching
process model until an outbreak infects at least 10 people. In the case
of the maximum outbreak size, if the number of infected individuals
exceeds the maximum the simulation will end, even if there are still
infectious individuals capable of continuing transmission, the function
will return the data early with a warning that the number of infections
in the data has reached the maximum and stating how many cases and
contacts are in the data output.

When requiring a line list that represents a large outbreak, such as the
COVID-19 outbreak, setting the `outbreak_size` to a larger number
guarantees a line list of at least that size. Here we simulate a line
list requiring at least 250 cases (and fewer than 10,000 cases). The
maximum number of cases can also be increased when simulating outbreaks
such as global pandemics.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  outbreak_size = c(250, 1e4)
)
head(linelist)
#>   id            case_name case_type sex age date_onset date_reporting
#> 1  1          John Farley confirmed   m  61 2023-01-01     2023-01-01
#> 2  2      Jared Weixelman confirmed   m  29 2023-01-01     2023-01-01
#> 3  3         Kyla Collins confirmed   f  71 2023-01-01     2023-01-01
#> 4  4    Shianne Crawleigh  probable   f  23 2023-01-01     2023-01-01
#> 5  5 Kathryn Pfannenstiel confirmed   f   7 2023-01-01     2023-01-01
#> 6  6     Catherine Morris  probable   f  19 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-31        2023-01-09
#> 3     2023-01-04      died   2023-01-13         2022-12-28        2023-01-02
#> 4     2023-01-05 recovered         <NA>         2022-12-29        2023-01-04
#> 5           <NA> recovered         <NA>         2022-12-30        2023-01-08
#> 6     2023-01-04      died   2023-01-20         2022-12-29        2023-01-02
#>   ct_value
#> 1     22.7
#> 2     24.4
#> 3     24.2
#> 4       NA
#> 5     27.0
#> 6       NA
```

The amount of time the simulation takes can be determined by the mean of
the contact distribution (`contact_distribution`), the probability of
infection (`prob_infection`) and conditioning the outbreak size
(`outbreak_size`). If the minimum `outbreak_size` is large, for example
hundreds or thousands of cases, and the mean number of contacts and
probability of infection mean the reproduction number is below one, it
will take many branching process simulations until finding one that
produces a sufficiently large epidemic.

## Case type

During an infectious disease outbreak it may not be possible to confirm
every infection as a case. A confirmed case is typically defined via a
diagnostic test. There are several reasons why a case may not be
confirmed, including limited testing capacity and mild or non-specific
early symptoms, especially in fast growing epidemics. We therefore
include two other categories for cases: probable and suspected. For
example, probable cases may be those that show clinical evidence for the
disease but have not, or cannot, be confirmed by a diagnostic test.
Suspected cases are those that are possibly infected but do not show
clear clinical or epidemiological evidence, nor has a diagnostic test
been performed. Hence the distribution of suspected/probable/confirmed
will depend on the pathogen characteristics, outbreak-specific
definitions, and resources available.

The line list output from the {simulist} simulation contains a column
(`case_type`) with the type of case.

{simulist} can simulate varying probabilities of each case being
suspected, probable or confirmed. By default the
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
function uses probabilities of `suspected = 0.2`, `probable = 0.3` and
`confirmed = 0.5`.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id             case_name case_type sex age date_onset date_reporting
#> 1  1 Hannelore Butterworth  probable   f  41 2023-01-01     2023-01-01
#> 2  3      Daniel Schenally confirmed   m   9 2023-01-01     2023-01-01
#> 3  4     Margaret Vanovski confirmed   f  18 2023-01-01     2023-01-01
#> 4  5        Belle Castillo confirmed   f  53 2023-01-01     2023-01-01
#> 5  7           Julio Perez confirmed   m  58 2023-01-02     2023-01-02
#> 6  9       Victor Martinez suspected   m  69 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-28        2023-01-06
#> 3           <NA> recovered         <NA>         2022-12-29        2023-01-02
#> 4           <NA> recovered         <NA>         2022-12-31        2023-01-05
#> 5           <NA> recovered         <NA>         2022-12-30        2023-01-03
#> 6           <NA> recovered         <NA>         2022-12-31        2023-01-07
#>   ct_value
#> 1       NA
#> 2     24.6
#> 3     24.0
#> 4     26.3
#> 5     27.0
#> 6       NA
```

To alter these probabilities, supply a named vector to the
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
argument `case_type_probs`. The vector should contain three numbers,
with the names `suspected`, `probable` and `confirmed`, with the numbers
summing to one. Here we change the values to simulate an outbreak in
which the proportion of cases confirmed by laboratory testing is high.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  case_type_probs = c(suspected = 0.05, probable = 0.05, confirmed = 0.9)
)
head(linelist)
#>   id         case_name case_type sex age date_onset date_reporting
#> 1  1        Kyle Avery confirmed   m  63 2023-01-01     2023-01-01
#> 2  2  Alexandra Walson confirmed   f  43 2023-01-01     2023-01-01
#> 3  4  Elizabeth Costra confirmed   f  17 2023-01-01     2023-01-01
#> 4  7    Rachael Bulwan confirmed   f  81 2023-01-01     2023-01-01
#> 5  8      Cole Stanton confirmed   m  41 2023-01-01     2023-01-01
#> 6  9 Mukhtaar el-Salem confirmed   m   8 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1     2023-01-05      died   2023-02-18               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-27        2023-01-04
#> 3           <NA> recovered         <NA>         2022-12-26        2023-01-03
#> 4           <NA> recovered         <NA>         2022-12-28        2023-01-03
#> 5           <NA> recovered         <NA>         2022-12-28        2023-01-03
#> 6           <NA> recovered         <NA>         2022-12-26        2023-01-03
#>   ct_value
#> 1     28.8
#> 2     23.3
#> 3     21.6
#> 4     22.6
#> 5     25.2
#> 6     27.8
```

It is also possible to set one of these categories to `1`, in which case
every case will be of that type.

The way {simulist} assigns case types is by pasting case types onto
existing case data. Thus, it could be viewed that the true underlying
data is that all cases in the simulation are confirmed, but that there
is a lack of information in some cases. There are no cases in the output
line list that are incorrectly attributed as probable or suspected that
have not been infected. That is to say, all individuals in the line
list, whatever their case type, are infected during the outbreak.

## Anonymous line list

By default
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
provides the name of each individual in the line list. If an anonymised
line list is required the `anonymise` argument of
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
can be set to `TRUE`.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  anonymise = TRUE
)
head(linelist)
#>   id  case_name case_type sex age date_onset date_reporting date_admission
#> 1  1 NhP49FIptg  probable   m  51 2023-01-01     2023-01-01     2023-01-04
#> 2  4 OtN8E7YVtZ confirmed   m  34 2023-01-01     2023-01-01           <NA>
#> 3  6 YDp6rBKNAl confirmed   f   1 2023-01-01     2023-01-01           <NA>
#> 4  7 vn6Q9OL6nl  probable   m   1 2023-01-01     2023-01-01           <NA>
#> 5  9 GPzXGGMgWr  probable   m  51 2023-01-01     2023-01-01           <NA>
#> 6 11 me7bmYCvSj  probable   f  89 2023-01-02     2023-01-02           <NA>
#>     outcome date_outcome date_first_contact date_last_contact ct_value
#> 1      died   2023-01-22               <NA>              <NA>       NA
#> 2 recovered         <NA>         2022-12-31        2023-01-06     26.6
#> 3 recovered         <NA>         2022-12-31        2023-01-04     25.8
#> 4 recovered         <NA>         2022-12-27        2023-01-05       NA
#> 5 recovered         <NA>         2022-12-29        2023-01-01       NA
#> 6 recovered         <NA>         2022-12-29        2023-01-02       NA
```

The names used in the line list are produced at random by the
[{randomNames}](https://CRAN.R-project.org/package=randomNames) R
package. Therefore, even when `anonymise = FALSE` there is no personal
data of real individuals being produced or shared. The `anonymise`
argument only changes the `$case_name` column of the line list, as this
is deemed the only personally identifiable information (PII) in the line
list data.

## Population age

For an overview of how a line list can be simulated with a uniform or
structured population age distribution see the [vignette dedicated to
this
topic](https://epiverse-trace.github.io/simulist/dev/articles/age-struct-pop.md).

## Age-stratified hospitalisation and death risks

For an overview of how a line list can be simulated with age-stratified
(or age-dependent) hospitalisation and death risks see the [vignette
dedicated to this
topic](https://epiverse-trace.github.io/simulist/dev/articles/age-strat-risks.md).

## Simulate contacts table

To simulate a contacts table, the
[`sim_contacts()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_contacts.md)
function can be used. This requires the same arguments as
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md),
but does not require the onset-to-hospitalisation delay and
onset-to-death delays.

``` r
contacts <- sim_contacts(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5
)
head(contacts)
#>               from              to age sex date_first_contact date_last_contact
#> 1 Janelle Monarrez   Phillip Degen  51   m         2022-12-29        2023-01-05
#> 2 Janelle Monarrez   Taylor Curtis  17   f         2022-12-30        2023-01-03
#> 3 Janelle Monarrez   Nuzha al-Musa  68   f         2022-12-30        2023-01-02
#> 4    Phillip Degen  Tess Sorghardt  77   f         2022-12-28        2023-01-03
#> 5    Nuzha al-Musa Yutitham Tamura  15   m         2022-12-28        2023-01-06
#> 6    Nuzha al-Musa    Jose Lefever  44   m         2022-12-30        2023-01-03
#>   was_case         status
#> 1     TRUE           case
#> 2    FALSE under_followup
#> 3     TRUE           case
#> 4     TRUE           case
#> 5    FALSE under_followup
#> 6    FALSE under_followup
```

## Simulate both line list and contacts table

To produce both a line list and a contacts table for the same outbreak,
the
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
and
[`sim_contacts()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_contacts.md)
cannot be used separately due to the stochastic algorithm, meaning the
data in the line list will be discordant with the contacts table.

In order to simulate a line list and a contacts table of the same
outbreak the
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)
function is required. This will simulate a single outbreak and return a
line list and a contacts table. The inputs of
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)
are the same as the inputs required for
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md).

``` r
outbreak <- sim_outbreak(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(outbreak$linelist)
#>   id      case_name case_type sex age date_onset date_reporting date_admission
#> 1  1 Brenden Newman  probable   m   6 2023-01-01     2023-01-01           <NA>
#> 2  2  Mayra Montoya confirmed   f  46 2023-01-02     2023-01-02           <NA>
#> 3  4 April Hemphill  probable   f  67 2023-01-03     2023-01-03           <NA>
#> 4  6     Olivia Kim confirmed   f  90 2023-01-04     2023-01-04           <NA>
#> 5  7   Semaj Turner confirmed   m  47 2023-01-02     2023-01-02           <NA>
#> 6  9    Alex Yazzie confirmed   m  65 2023-01-03     2023-01-03           <NA>
#>     outcome date_outcome date_first_contact date_last_contact ct_value
#> 1 recovered         <NA>               <NA>              <NA>       NA
#> 2 recovered         <NA>         2022-12-29        2023-01-04     24.3
#> 3 recovered         <NA>         2022-12-28        2023-01-03       NA
#> 4 recovered         <NA>         2022-12-29        2023-01-04     26.4
#> 5 recovered         <NA>         2022-12-30        2023-01-03     27.6
#> 6 recovered         <NA>         2022-12-27        2023-01-06     25.0
head(outbreak$contacts)
#>             from              to age sex date_first_contact date_last_contact
#> 1 Brenden Newman   Mayra Montoya  46   f         2022-12-29        2023-01-04
#> 2 Brenden Newman Mikaela Gurreri  29   f         2022-12-28        2023-01-02
#> 3 Brenden Newman  April Hemphill  67   f         2022-12-28        2023-01-03
#> 4 Brenden Newman     Clint Rippy  55   m         2022-12-30        2023-01-04
#> 5 Brenden Newman      Olivia Kim  90   f         2022-12-29        2023-01-04
#> 6 Brenden Newman    Semaj Turner  47   m         2022-12-30        2023-01-03
#>   was_case         status
#> 1     TRUE           case
#> 2    FALSE under_followup
#> 3     TRUE           case
#> 4    FALSE under_followup
#> 5     TRUE           case
#> 6     TRUE           case
```

[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)
has the same features as
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
and
[`sim_contacts()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_contacts.md),
this includes simulating with age-stratified risks of hospitalisation
and death, the probability of case types or contact tracing status can
be modified.

*Advanced*

The `sim_*()` functions, by default, use an excess degree distribution
to account for a network effect when sampling the number of contacts in
the simulation model ($q(n) \sim (n + 1)p(n + 1)$ where $p(n)$ is the
probability density function of a distribution, e.g., Poisson or
Negative binomial, within the
[`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/dev/reference/dot-sim_network_bp.md)
internal function). This network effect can be turned off by using the
`config` argument in any `sim_*()` function and setting
`network = "unadjusted"` (`create_config(network = "unadjusted")`) which
will instead sample from a probability distribution $p(n)$.

## Using functions for distributions instead of `<epiparameter>`

The `contact_distribution`, `infectious_period`, `onset_to_hosp`,
`onset_to_death` and `onset_to_recovery` arguments can accept either an
`<epiparameter>` object (as shown above), or can accept a function. It
is possible to use a predefined function or an [anonymous
function](https://en.wikipedia.org/wiki/Anonymous_function). Here we’ll
demonstrate how to use both.

### Predefined functions

``` r
contact_distribution <- function(x) dpois(x = x, lambda = 2)
infectious_period <- function(n) rgamma(n = n, shape = 2, scale = 2)
onset_to_hosp <- function(n) rlnorm(n = n, meanlog = 1.5, sdlog = 0.5)
onset_to_death <- function(n) rweibull(n = n, shape = 1, scale = 5)

outbreak <- sim_outbreak(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(outbreak$linelist)
#>   id       case_name case_type sex age date_onset date_reporting date_admission
#> 1  1 Andrew Terrazas confirmed   m  16 2023-01-01     2023-01-01     2023-01-06
#> 2  2    Max Moraitis confirmed   m  81 2023-01-04     2023-01-04           <NA>
#> 3  3   Brandi Chavez  probable   f  49 2023-01-02     2023-01-02           <NA>
#> 4  5   Glenna Talley confirmed   f   5 2023-01-06     2023-01-06           <NA>
#> 5  8 Nikhil Manglona  probable   m  74 2023-01-07     2023-01-07     2023-01-13
#> 6 10   Alisiana Witt confirmed   f  34 2023-01-08     2023-01-08           <NA>
#>     outcome date_outcome date_first_contact date_last_contact ct_value
#> 1      died   2023-01-06               <NA>              <NA>     23.6
#> 2 recovered         <NA>         2023-01-01        2023-01-03     23.3
#> 3 recovered         <NA>         2022-12-29        2023-01-08       NA
#> 4 recovered         <NA>         2022-12-30        2023-01-07     24.5
#> 5 recovered         <NA>         2022-12-31        2023-01-09       NA
#> 6 recovered         <NA>         2023-01-04        2023-01-12     23.3
head(outbreak$contacts)
#>              from            to age sex date_first_contact date_last_contact
#> 1 Andrew Terrazas  Max Moraitis  81   m         2023-01-01        2023-01-03
#> 2 Andrew Terrazas Brandi Chavez  49   f         2022-12-29        2023-01-08
#> 3    Max Moraitis Kyana Proctor  31   f         2023-01-04        2023-01-06
#> 4    Max Moraitis Glenna Talley   5   f         2022-12-30        2023-01-07
#> 5   Brandi Chavez Devin Mueller  46   f         2022-12-30        2023-01-03
#> 6   Brandi Chavez    Matthew Le  89   m         2023-01-02        2023-01-04
#>   was_case         status
#> 1     TRUE           case
#> 2     TRUE           case
#> 3    FALSE under_followup
#> 4     TRUE           case
#> 5    FALSE under_followup
#> 6    FALSE under_followup
```

### Anonymous functions

``` r
outbreak <- sim_outbreak(
  contact_distribution = function(x) dpois(x = x, lambda = 2),
  infectious_period = function(n) rgamma(n = n, shape = 2, scale = 2),
  prob_infection = 0.5,
  onset_to_hosp = function(n) rlnorm(n = n, meanlog = 1.5, sdlog = 0.5),
  onset_to_death = function(n) rweibull(n = n, shape = 1, scale = 5)
)
head(outbreak$linelist)
#>   id             case_name case_type sex age date_onset date_reporting
#> 1  1          Alvina Thesz confirmed   f  24 2023-01-01     2023-01-01
#> 2  4         Marisa Sjoden confirmed   f  40 2023-01-01     2023-01-01
#> 3  8      Joseph Bandreddi confirmed   m  46 2023-01-02     2023-01-02
#> 4  9          Summer Godoy  probable   f  62 2023-01-06     2023-01-06
#> 5 12 Paola Mendez-Martinez confirmed   f  63 2023-01-06     2023-01-06
#> 6 13           Rian Miller  probable   m  83 2023-01-06     2023-01-06
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-26        2023-01-06
#> 3           <NA> recovered         <NA>         2022-12-27        2023-01-04
#> 4     2023-01-22      died   2023-01-25         2022-12-28        2023-01-04
#> 5     2023-01-09      died   2023-01-12         2023-01-04        2023-01-13
#> 6           <NA> recovered         <NA>         2023-01-05        2023-01-08
#>   ct_value
#> 1     25.4
#> 2     25.3
#> 3     25.3
#> 4       NA
#> 5     24.6
#> 6       NA
head(outbreak$contacts)
#>            from              to age sex date_first_contact date_last_contact
#> 1  Alvina Thesz     Taraya Webb   6   f         2022-12-31        2023-01-04
#> 2  Alvina Thesz  James Anderson  71   m         2022-12-27        2023-01-06
#> 3  Alvina Thesz   Marisa Sjoden  40   f         2022-12-26        2023-01-06
#> 4  Alvina Thesz Meghanne Matano  27   f         2022-12-28        2023-01-05
#> 5 Marisa Sjoden   Shelley Reese  27   m         2022-12-30        2023-01-01
#> 6 Marisa Sjoden Elizabeth Weger  45   f         2022-12-28        2023-01-06
#>   was_case           status
#> 1    FALSE   under_followup
#> 2    FALSE   under_followup
#> 3     TRUE             case
#> 4    FALSE   under_followup
#> 5    FALSE   under_followup
#> 6    FALSE lost_to_followup
```

The `contact_distribution` requires a density function instead of a
random number generation function
(i.e. [`dpois()`](https://rdrr.io/r/stats/Poisson.html) or
[`dnbinom()`](https://rdrr.io/r/stats/NegBinomial.html) instead of
[`rpois()`](https://rdrr.io/r/stats/Poisson.html) or
[`rnbinom()`](https://rdrr.io/r/stats/NegBinomial.html)). This is due to
the branching process simulation adjusting the sampling of contacts to
take into account the random network effect.

The same approach of using anonymous functions can be used in
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
and
[`sim_contacts()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_contacts.md).

## Simulating without hospitalisations and/or deaths

The onset-to-hospitalisation (`onset_to_hosp`) and onset-to-death
(`onset_to_death`) arguments can also be set to `NULL` in which case the
date of admission (`$date_admission`) and date of death (`$date_death`)
column in the line list will contains `NA`s.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = NULL,
  onset_to_death = NULL,
  hosp_risk = NULL,
  hosp_death_risk = NULL,
  non_hosp_death_risk = NULL
)
head(linelist)
#>   id         case_name case_type sex age date_onset date_reporting
#> 1  1   Christina Mally  probable   f   9 2023-01-01     2023-01-01
#> 2  2      Travis Reese confirmed   m  82 2023-01-03     2023-01-03
#> 3  4   Cheyanna Madrid confirmed   f  54 2023-01-06     2023-01-06
#> 4  5 Mukarram el-Fadel  probable   m  36 2023-01-03     2023-01-03
#> 5  7   Melani Cardenas confirmed   f  80 2023-01-05     2023-01-05
#> 6  8    Rachael Tharpe  probable   f  75 2023-01-08     2023-01-08
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-30        2023-01-02
#> 3           <NA> recovered         <NA>         2022-12-28        2023-01-06
#> 4           <NA> recovered         <NA>         2023-01-02        2023-01-06
#> 5           <NA> recovered         <NA>         2022-12-31        2023-01-04
#> 6           <NA> recovered         <NA>         2022-12-29        2023-01-05
#>   ct_value
#> 1       NA
#> 2     22.7
#> 3     24.7
#> 4       NA
#> 5     23.6
#> 6       NA
```

This same functionality also applies to
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md).
In the above example, `hosp_risk`, `hosp_death_risk` and
`non_hosp_death_risk` are set to `NULL`. If the risk (`*_risk`)
arguments are left as numeric inputs but the corresponding
onset-to-event distribution (i.e. `hosp_risk` for `onset_to_hosp` and
`hosp_death_risk` and `non_hosp_death_risk` for `onset_to_death`) are
set to `NULL` a warning will be produced. The example above simulates
with neither hospitalisation or deaths, but these do not need to be
*turned off* together, and one or the other can be set to `NULL` with
their corresponding risk arguments.
