
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
#> To retrieve the short citation use the 'get_citation' function

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
#> To retrieve the short citation use the 'get_citation' function
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
#>   id          case_name case_type sex age date_onset date_admission date_death
#> 1  1     Joshua Esparza confirmed   m  71 2023-01-01           <NA>       <NA>
#> 2  3     Alyshah Atkins confirmed   f  44 2023-01-02           <NA> 2023-01-24
#> 3  4     Rifat al-Mussa suspected   m  49 2023-01-02     2023-01-03       <NA>
#> 4  8 Zachery Miramontes  probable   m  50 2023-01-02           <NA>       <NA>
#> 5  9          Ryan Zahn  probable   m   7 2023-01-02           <NA>       <NA>
#> 6 11    Bruce Hishinuma confirmed   m  24 2023-01-02     2023-01-12       <NA>
#>   date_first_contact date_last_contact ct_value
#> 1               <NA>              <NA>     25.2
#> 2         2023-01-01        2023-01-02     25.2
#> 3         2023-01-02        2023-01-05       NA
#> 4         2023-01-02        2023-01-05       NA
#> 5         2023-01-03        2023-01-04       NA
#> 6         2023-01-02        2023-01-05     25.2
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
#>   id       case_name case_type sex age date_onset date_admission date_death
#> 1  1 Diozanae Ingram  probable   f   9 2019-12-01           <NA>       <NA>
#> 2  2    Alexander Ho confirmed   m  66 2019-12-01           <NA>       <NA>
#> 3  3    Olivia Valle suspected   f   9 2019-12-01           <NA>       <NA>
#> 4  4   Anita Roberts suspected   f  41 2019-12-01           <NA> 2019-12-16
#> 5  7   Aqil Stratton suspected   m  27 2019-12-02           <NA>       <NA>
#> 6 10    Irma Lefebre confirmed   f  87 2019-12-02           <NA>       <NA>
#>   date_first_contact date_last_contact ct_value
#> 1               <NA>              <NA>       NA
#> 2         2019-12-02        2019-12-06     25.2
#> 3         2019-11-26        2019-12-01       NA
#> 4         2019-12-04        2019-12-09       NA
#> 5         2019-11-29        2019-12-01       NA
#> 6         2019-12-07        2019-12-11     25.2
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
#>             from              to age sex date_first_contact date_last_contact
#> 1   Zabiollah Ly  Daniyal Fifita  54   m         2023-01-04        2023-01-09
#> 2   Zabiollah Ly  Tyler Mccreesh  45   m         2023-01-03        2023-01-04
#> 3   Zabiollah Ly  Nicholas Coors   9   m         2022-12-28        2023-01-01
#> 4 Daniyal Fifita  Julia Mcmillan  81   f         2023-01-05        2023-01-07
#> 5 Daniyal Fifita  Savannah Begay  35   f         2022-12-30        2023-01-03
#> 6 Daniyal Fifita Cleatus Sorrell  75   m         2022-12-31        2023-01-04
#>   was_case           status
#> 1        Y             case
#> 2        N   under_followup
#> 3        Y             case
#> 4        N lost_to_followup
#> 5        Y             case
#> 6        N   under_followup
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
#>   id       case_name case_type sex age date_onset date_admission date_death
#> 1  1   Joshua Claton suspected   m  88 2023-01-01     2023-01-06       <NA>
#> 2  2  Estiben Alonzo  probable   m  73 2023-01-01           <NA>       <NA>
#> 3  3 Tulaiha el-Basa suspected   f  75 2023-01-01           <NA>       <NA>
#> 4  4    Marie Faisol suspected   f  47 2023-01-01     2023-01-06       <NA>
#> 5  5      Jera Ortiz confirmed   f  43 2023-01-01           <NA>       <NA>
#> 6  7     Evan Sailor confirmed   m   5 2023-01-02     2023-01-03       <NA>
#>   date_first_contact date_last_contact ct_value
#> 1               <NA>              <NA>       NA
#> 2         2022-12-30        2023-01-03       NA
#> 3         2022-12-31        2023-01-02       NA
#> 4         2023-01-04        2023-01-07       NA
#> 5         2023-01-07        2023-01-07     23.9
#> 6         2023-01-01        2023-01-03     23.9
head(outbreak$contacts)
#>             from              to age sex date_first_contact date_last_contact
#> 1  Joshua Claton  Estiben Alonzo  73   m         2022-12-30        2023-01-03
#> 2  Joshua Claton Tulaiha el-Basa  75   f         2022-12-31        2023-01-02
#> 3  Joshua Claton    Marie Faisol  47   f         2023-01-04        2023-01-07
#> 4  Joshua Claton      Jera Ortiz  43   f         2023-01-07        2023-01-07
#> 5 Estiben Alonzo Kendall Jackson  49   m         2022-12-30        2023-01-02
#> 6 Estiben Alonzo     Evan Sailor   5   m         2023-01-01        2023-01-03
#>   was_case         status
#> 1        Y           case
#> 2        Y           case
#> 3        Y           case
#> 4        Y           case
#> 5        N under_followup
#> 6        Y           case
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
