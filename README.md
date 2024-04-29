
<!-- README.md is generated from README.Rmd. Please edit that file. -->
<!-- The code to render this README is stored in .github/workflows/render-readme.yaml -->
<!-- Variables marked with double curly braces will be transformed beforehand: -->
<!-- `packagename` is extracted from the DESCRIPTION file -->
<!-- `gh_repo` is extracted via a special environment variable in GitHub Actions -->

# *simulist*: Simulate line list data <img src="man/figures/logo.svg" align="right" width="120" />

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit)
[![R-CMD-check](https://github.com/epiverse-trace/simulist/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/epiverse-trace/simulist/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/epiverse-trace/simulist/branch/main/graph/badge.svg)](https://app.codecov.io/gh/epiverse-trace/simulist?branch=main)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10471459.svg)](https://doi.org/10.5281/zenodo.10471459)
<!-- badges: end -->

`{simulist}` is an R package to simulate individual-level infectious
disease outbreak data, including line lists and contact tracing data. It
can often be useful to have synthetic datasets like these available when
demonstrating outbreak analytics techniques or testing new analysis
methods.

`{simulist}` is developed at the [Centre for the Mathematical Modelling
of Infectious
Diseases](https://www.lshtm.ac.uk/research/centres/centre-mathematical-modelling-infectious-diseases)
at the [London School of Hygiene and Tropical
Medicine](https://www.lshtm.ac.uk/) as part of
[Epiverse-TRACE](https://data.org/initiatives/epiverse/).

## Installation

You can install the development version of `{simulist}` from
[GitHub](https://github.com/) with:

``` r
# check whether {pak} is installed
if(!require("pak")) install.packages("pak")
pak::pak("epiverse-trace/simulist")
```

## Quick start

``` r
library(simulist)
library(epiparameter)
```

The line list simulation requires that we define a contact distribution,
period of infectiousness, onset-to-hospitalisation delay, and
onset-to-death delay. We can load these from the library of
epidemiological parameters in the `{epiparameter}` R package if
available, or if these are not in the database yet (such as the contact
distribution for COVID-19) we can define them ourselves.

``` r
# create COVID-19 contact distribution
contact_distribution <- epiparameter::epidist(
  disease = "COVID-19", 
  epi_dist = "contact distribution", 
  prob_distribution = "pois", 
  prob_distribution_params = c(mean = 2)
)
#> Citation cannot be created as author, year, journal or title is missing

# create COVID-19 infectious period
infect_period <- epiparameter::epidist(
  disease = "COVID-19",
  epi_dist = "infectious period",
  prob_distribution = "gamma",
  prob_distribution_params = c(shape = 1, scale = 1)
)
#> Citation cannot be created as author, year, journal or title is missing

# get onset to hospital admission from {epiparameter} database
onset_to_hosp <- epiparameter::epidist_db(
  disease = "COVID-19",
  epi_dist = "onset to hospitalisation",
  single_epidist = TRUE
)
#> Using Linton N, Kobayashi T, Yang Y, Hayashi K, Akhmetzhanov A, Jung S, Yuan
#> B, Kinoshita R, Nishiura H (2020). "Incubation Period and Other
#> Epidemiological Characteristics of 2019 Novel Coronavirus Infections
#> with Right Truncation: A Statistical Analysis of Publicly Available
#> Case Data." _Journal of Clinical Medicine_. doi:10.3390/jcm9020538
#> <https://doi.org/10.3390/jcm9020538>.. 
#> To retrieve the citation use the 'get_citation' function

# get onset to death from {epiparameter} database
onset_to_death <- epiparameter::epidist_db(
  disease = "COVID-19",
  epi_dist = "onset to death",
  single_epidist = TRUE
)
#> Using Linton N, Kobayashi T, Yang Y, Hayashi K, Akhmetzhanov A, Jung S, Yuan
#> B, Kinoshita R, Nishiura H (2020). "Incubation Period and Other
#> Epidemiological Characteristics of 2019 Novel Coronavirus Infections
#> with Right Truncation: A Statistical Analysis of Publicly Available
#> Case Data." _Journal of Clinical Medicine_. doi:10.3390/jcm9020538
#> <https://doi.org/10.3390/jcm9020538>.. 
#> To retrieve the citation use the 'get_citation' function
```

To simulate a line list for COVID-19 with an Poisson contact
distribution with a mean number of contacts of 2 and a probability of
infection per contact of 0.5, we use the `sim_linelist()` function. The
mean number of contacts and probability of infection determine the
outbreak reproduction number, if the resulting reproduction number is
around one it means we will likely get a reasonably sized outbreak (10 -
1,000 cases, varying due to the stochastic simulation).

***Warning***: the reproduction number of the simulation results from
the contact distribution (`contact_distribution`) and the probability of
infection (`prob_infect`); the number of infections is a binomial sample
of the number of contacts for each case with the probability of
infection (i.e. being sampled) given by `prob_infect`. If the average
number of secondary infections from each primary case is greater than 1
then this can lead to the outbreak becoming extremely large. There is
currently no depletion of susceptible individuals in the simulation
model, so the maximum outbreak size (second element of the vector
supplied to the `outbreak_size` argument) can be used to return a line
list early without producing an excessively large data set.

``` r
set.seed(1)
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infect_period = infect_period,
  prob_infect = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id          case_name case_type sex age date_onset date_admission   outcome
#> 1  1    Dominic Sundara  probable   m  35 2023-01-01           <NA> recovered
#> 2  2 Preston Montgomery suspected   m  43 2023-01-01           <NA> recovered
#> 3  3      Reece Chittum  probable   m   1 2023-01-01           <NA> recovered
#> 4  5      Michael Cheek confirmed   m  78 2023-01-01           <NA> recovered
#> 5  6     Jennifer Smith confirmed   f  22 2023-01-01           <NA> recovered
#> 6  8     Erika Quintero confirmed   f  28 2023-01-01           <NA> recovered
#>   date_outcome date_first_contact date_last_contact ct_value
#> 1         <NA>               <NA>              <NA>       NA
#> 2         <NA>         2022-12-30        2023-01-05       NA
#> 3         <NA>         2022-12-30        2023-01-02       NA
#> 4         <NA>         2022-12-29        2023-01-02     23.1
#> 5         <NA>         2023-01-01        2023-01-03     23.1
#> 6         <NA>         2023-01-03        2023-01-04     23.1
```

In this example, the line list is simulated using the default values
(see `?sim_linelist`). The default hospitalisation risk is assumed to be
0.2 (i.e. there is a 20% probability an infected individual becomes
hospitalised) and the start date of the outbreak is 1st January 2023. To
modify either of these, we can specify them in the function.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infect_period = infect_period,
  prob_infect = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = 0.01,
  outbreak_start_date = as.Date("2019-12-01")
)
head(linelist)
#>   id          case_name case_type sex age date_onset date_admission   outcome
#> 1  1  Ya'qoob el-Firman  probable   m  80 2019-12-01           <NA> recovered
#> 2  2 Cassandra Martinez confirmed   f  85 2019-12-01     2019-12-03      died
#> 3  4    Andrea Richards confirmed   f  76 2019-12-01           <NA> recovered
#> 4  8  Dalany Whitesides confirmed   f  12 2019-12-01           <NA> recovered
#> 5 11        Amanda Cali confirmed   f  50 2019-12-01           <NA> recovered
#> 6 14        Linh Farmer  probable   f  54 2019-12-01           <NA> recovered
#>   date_outcome date_first_contact date_last_contact ct_value
#> 1         <NA>               <NA>              <NA>       NA
#> 2   2019-12-05         2019-12-04        2019-12-06     23.6
#> 3         <NA>         2019-11-29        2019-12-03     23.6
#> 4         <NA>         2019-12-05        2019-12-05     23.6
#> 5         <NA>         2019-12-03        2019-12-05     23.6
#> 6         <NA>         2019-11-30        2019-12-02       NA
```

To simulate a table of contacts of cases (i.e. to reflect a contact
tracing dataset) we can use the same parameters defined for the example
above.

``` r
contacts <- sim_contacts(
  contact_distribution = contact_distribution,
  infect_period = infect_period, 
  prob_infect = 0.5
)
head(contacts)
#>            from                 to age sex date_first_contact date_last_contact
#> 1  Jada Cardona      Tyray Jackson  50   m         2023-01-03        2023-01-04
#> 2 Tyray Jackson        Karol Alcon   4   f         2023-01-02        2023-01-03
#> 3 Tyray Jackson Hishaam al-Khawaja  82   m         2022-12-31        2023-01-03
#> 4 Tyray Jackson Jessica Cunningham  64   f         2023-01-04        2023-01-05
#> 5 Tyray Jackson      Danyell Ricks  12   f         2023-01-03        2023-01-05
#> 6   Karol Alcon    Thalia Williams  22   f         2023-01-05        2023-01-07
#>   was_case         status
#> 1        Y           case
#> 2        Y           case
#> 3        Y           case
#> 4        N under_followup
#> 5        Y           case
#> 6        Y           case
```

If both the line list and contacts table are required, they can be
jointly simulated using the `sim_outbreak()` function. This uses the
same inputs as `sim_linelist()` and `sim_contacts()` to produce a line
list and contacts table of the same outbreak (the arguments also have
the same default settings as the other functions).

``` r
outbreak <- sim_outbreak(
  contact_distribution = contact_distribution,
  infect_period = infect_period,
  prob_infect = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(outbreak$linelist)
#>   id         case_name case_type sex age date_onset date_admission   outcome
#> 1  1  Elshadaii Rivers confirmed   f  46 2023-01-01     2023-01-01 recovered
#> 2  2 Gerardo Hernandez  probable   m  63 2023-01-01           <NA> recovered
#> 3  3     Evan Whitmore confirmed   m  22 2023-01-01           <NA> recovered
#> 4  5     Louis Heredia  probable   m  75 2023-01-01           <NA> recovered
#> 5  7      Steven Byers confirmed   m  84 2023-01-02           <NA> recovered
#> 6  8    Derrick Mackey confirmed   m  56 2023-01-02           <NA> recovered
#>   date_outcome date_first_contact date_last_contact ct_value
#> 1         <NA>               <NA>              <NA>     25.8
#> 2         <NA>         2022-12-28        2023-01-02       NA
#> 3         <NA>         2023-01-04        2023-01-06     25.8
#> 4         <NA>         2023-01-01        2023-01-03       NA
#> 5         <NA>         2023-01-02        2023-01-05     25.8
#> 6         <NA>         2023-01-03        2023-01-06     25.8
head(outbreak$contacts)
#>                from                to age sex date_first_contact
#> 1  Elshadaii Rivers Gerardo Hernandez  63   m         2022-12-28
#> 2  Elshadaii Rivers     Evan Whitmore  22   m         2023-01-04
#> 3  Elshadaii Rivers      Hunter Wells  77   m         2023-01-01
#> 4 Gerardo Hernandez     Louis Heredia  75   m         2023-01-01
#> 5 Gerardo Hernandez  Ronald Phanekham  23   m         2023-01-02
#> 6 Gerardo Hernandez      Steven Byers  84   m         2023-01-02
#>   date_last_contact was_case         status
#> 1        2023-01-02        Y           case
#> 2        2023-01-06        Y           case
#> 3        2023-01-05        N under_followup
#> 4        2023-01-03        Y           case
#> 5        2023-01-04        N under_followup
#> 6        2023-01-05        Y           case
```

## Help

To report a bug please open an
[issue](https://github.com/epiverse-trace/simulist/issues/new/choose).

## Contribute

Contributions to `{simulist}` are welcomed. Please follow the [package
contributing
guide](https://github.com/epiverse-trace/.github/blob/main/CONTRIBUTING.md).

## Code of Conduct

Please note that the `{simulist}` project is released with a
[Contributor Code of
Conduct](https://github.com/epiverse-trace/.github/blob/main/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.

## Citing this package

``` r
citation("simulist")
#> To cite package 'simulist' in publications use:
#> 
#>   Lambert J, Tamayo C (2024). _simulist: Tools to Simulate Line List
#>   and Contacts Data_. doi:10.5281/zenodo.10471458
#>   <https://doi.org/10.5281/zenodo.10471458>,
#>   <https://github.com/epiverse-trace/simulist,https://epiverse-trace.github.io/simulist/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {simulist: Tools to Simulate Line List and Contacts Data},
#>     author = {Joshua W. Lambert and Carmen Tamayo},
#>     year = {2024},
#>     doi = {10.5281/zenodo.10471458},
#>     url = {https://github.com/epiverse-trace/simulist,
#> https://epiverse-trace.github.io/simulist/},
#>   }
```

## Related projects

This project has some overlap with other R packages. Here we list these
packages and provide a table of features and attributes that are present
for each package to help decide which package is appropriate for each
use-case.

In some cases the packages are dedicated to simulating line list and
other epidemiological data (e.g. {simulist}), in others the line list
simulation is one part of a wider R package (e.g. {EpiNow}).

- [`{LLsim}`](https://github.com/jrcpulliam/LLsim) simulates line list
  data using a stochastic SIR model with a fixed population with
  observation and reporting delays.
- [`{simulacr}`](https://github.com/reconhub/simulacr) uses a branching
  process model to simulate cases and contacts for an outbreak. It
  simulates transmission of infections using other epidemiological R
  packages (`{epicontacts}` and `{distcrete}`) to parameterise and plot
  simulated data.
- [`{epidict}`](https://github.com/R4EPI/epidict) is a package for data
  dictionaries for outbreaks and surveys. It can generate line list data
  using an outbreak data dictionary (`gen_data()`). Currently MSF
  outbreak data dictionaries for Acute Jaundice Syndrome, Cholera,
  Measles and Meningitis are available.
- [`{EpiNow}`](https://github.com/epiforecasts/EpiNow) - a now
  deprecated R package - includes the `simulate_cases()` and
  `generate_pseudo_linelist()` functions for generating line list data.

<details>
<summary>
Table of line list simulator features
</summary>

|                                      | {simulist}         | {LLsim}            | {simulacr}         | {epidict}          | {EpiNow}           |
|--------------------------------------|--------------------|--------------------|--------------------|--------------------|--------------------|
| Simulates line list                  | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| Simulates contacts                   | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :x:                |
| Parameterised with epi distributions | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :white_check_mark: |
| Interoperable with {epicontacts}     | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :x:                |
| Explicit population size             | :x:                | :white_check_mark: | :white_check_mark: | :x:                | :x:                |
| R package                            | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| Actively maintained\*                | :white_check_mark: | :x:                | :x:                | :x:                | :x:                |
| On CRAN                              | :x:                | :x:                | :x:                | :x:                | :x:                |
| Unit testing                         | :white_check_mark: | :white_check_mark: | :x:                | :white_check_mark: | :x:                |

\* We define actively maintained as the repository having a commit to
the main branch within the last 12 months

</details>

If there is another package with this functionality missing from the
list that should be added, or if a package included in this list has
been updated and the table should reflect this please contribute by
making an [issue](https://github.com/epiverse-trace/simulist/issues) or
a [pull request](https://github.com/epiverse-trace/simulist/pulls).
