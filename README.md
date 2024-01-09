
<!-- README.md is generated from README.Rmd. Please edit that file. -->
<!-- The code to render this README is stored in .github/workflows/render-readme.yaml -->
<!-- Variables marked with double curly braces will be transformed beforehand: -->
<!-- `packagename` is extracted from the DESCRIPTION file -->
<!-- `gh_repo` is extracted via a special environment variable in GitHub Actions -->

# *simulist*: Simulate line list data <img src="man/figures/logo.svg" align="right" width="120" />

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit/)
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

The line list simulation requires that we define a serial interval,
onset-to-hospitalisation delay, and onset-to-death delay. We can load
these from the library of epidemiological parameters in the
`{epiparameter}` R package if available, or if these are not in the
database yet (such as the serial interval for COVID-19) we can define
them ourselves.

``` r
# create COVID-19 serial interval
serial_interval <- epiparameter::epidist(
  disease = "COVID-19",
  epi_dist = "serial interval",
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

To simulate a line list for COVID-19 with an assumed reproduction number
(`R`) of 1.1 we use the `sim_linelist()` function. Using a reproduction
number greater than one means we will likely get a reasonably sized
outbreak (10 - 1000 cases, varying due to the stochastic simulation).
*Do not set the reproduction number too high (e.g. \>5) as the outbreak
can become extremely large*.

``` r
linelist <- sim_linelist(
  R = 1.1,
  serial_interval = serial_interval,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id              case_name case_type gender age date_onset date_admission
#> 1  1            Sable Mills  probable      f  25 2023-01-01           <NA>
#> 2  2        Dallin Boulware  probable      m   6 2023-01-04           <NA>
#> 3  3            Luke Lovato  probable      m  69 2023-01-04           <NA>
#> 4  4              Andrew Ho confirmed      m  72 2023-01-05           <NA>
#> 5  5         Deanna Wallace suspected      f   7 2023-01-05           <NA>
#> 6  6 Abdur Rasheed el-Aboud suspected      m  18 2023-01-05           <NA>
#>   date_death date_first_contact date_last_contact ct_value
#> 1       <NA>               <NA>              <NA>       NA
#> 2       <NA>         2023-01-04        2023-01-04       NA
#> 3       <NA>         2023-01-03        2023-01-04       NA
#> 4       <NA>         2023-01-01        2023-01-05     22.7
#> 5       <NA>         2023-01-09        2023-01-12       NA
#> 6       <NA>         2023-01-06        2023-01-07       NA
```

In this example, the line list is simulated using the default values
(see `?sim_linelist`). The default hospitalisation risk is assumed to be
0.2 (i.e. there is a 20% probability an infected individual becomes
hospitalised) and the start date of the outbreak is 1st January 2023. To
modify either of these, we can specify them in the function.

``` r
linelist <- sim_linelist(
  R = 1.1,
  serial_interval = serial_interval,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = 0.01,
  outbreak_start_date = as.Date("2019-12-01")
)
head(linelist)
#>   id            case_name case_type gender age date_onset date_admission
#> 1  1 Christopher Martinez confirmed      m  67 2019-12-01           <NA>
#> 2  2        Yesenia Coker suspected      f  59 2019-12-02           <NA>
#> 3  3     Brianna Johnston  probable      f  62 2019-12-04           <NA>
#> 4  4         Autumn Laner confirmed      f  69 2019-12-03           <NA>
#> 5  5         Katie Holeso suspected      f  86 2019-12-04           <NA>
#> 6  6      Margarita Hedin suspected      f  83 2019-12-05           <NA>
#>   date_death date_first_contact date_last_contact ct_value
#> 1       <NA>               <NA>              <NA>     25.3
#> 2       <NA>         2019-11-28        2019-12-01       NA
#> 3       <NA>         2019-11-30        2019-12-02       NA
#> 4       <NA>         2019-11-29        2019-12-07     25.3
#> 5       <NA>         2019-12-01        2019-12-05       NA
#> 6       <NA>         2019-12-01        2019-12-05       NA
```

To simulate a table of contacts of cases (i.e. to reflect a contact
tracing dataset) we can use the same serial interval defined for the
example above. We additionally need a contact distribution, which
represents the probability that each person that infected an individual,
also had a given number of contacts that did not become infected.

``` r
contact_distribution <- epiparameter::epidist(
  disease = "COVID-19",
  epi_dist = "contact_distribution",
  prob_distribution = "pois",
  prob_distribution_params = c(l = 5)
)
#> Citation cannot be created as author, year, journal or title is missing

contacts <- sim_contacts(
  R = 1.1,
  serial_interval = serial_interval,
  contact_distribution = contact_distribution
)
head(contacts)
#>             from                 to cnt_age cnt_gender date_first_contact
#> 1 Amanda Carlson       Emilio Lopez      22          m         2022-12-29
#> 2 Amanda Carlson    Melissa Vasquez      66          f         2022-12-28
#> 3 Amanda Carlson    Jasper Crummett      88          m         2023-01-05
#> 4 Amanda Carlson Michael Candelarie      11          m         2022-12-31
#> 5   Emilio Lopez     Sheniqua Wyatt      19          f         2023-01-05
#> 6   Emilio Lopez        Nalei Myers      46          f         2023-01-04
#>   date_last_contact was_case         status
#> 1        2023-01-01        Y           case
#> 2        2023-01-02        Y           case
#> 3        2023-01-09        N under_followup
#> 4        2023-01-02        N under_followup
#> 5        2023-01-08        Y           case
#> 6        2023-01-05        N under_followup
```

If both the line list and contacts table are required, they can be
jointly simulated using the `sim_outbreak()` function. This uses the
same inputs as `sim_linelist()` and `sim_contacts()` to produce a line
list and contacts table of the same outbreak (the arguments also have
the same default settings as the other functions).

``` r
outbreak <- sim_outbreak(
  R = 1.1,
  serial_interval = serial_interval,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  contact_distribution = contact_distribution
)
head(outbreak$linelist)
#>   id        case_name case_type gender age date_onset date_admission date_death
#> 1  1   Calvin Anicete  probable      m   9 2023-01-01     2023-01-01       <NA>
#> 2  2    Karla Salcido suspected      f  26 2023-01-01           <NA>       <NA>
#> 3  3 Mitchell Jackson  probable      m  48 2023-01-01           <NA>       <NA>
#> 4  4 Steffano Moseley confirmed      m  51 2023-01-01           <NA>       <NA>
#> 5  5          Mai Kim  probable      f  35 2023-01-01           <NA>       <NA>
#> 6  6    Devante Mayes  probable      m  39 2023-01-01           <NA>       <NA>
#>   date_first_contact date_last_contact ct_value
#> 1               <NA>              <NA>       NA
#> 2         2023-01-02        2023-01-03       NA
#> 3         2023-01-02        2023-01-04       NA
#> 4         2023-01-03        2023-01-04     24.7
#> 5         2023-01-05        2023-01-05       NA
#> 6         2023-01-01        2023-01-02       NA
head(outbreak$contacts)
#>             from                   to cnt_age cnt_gender date_first_contact
#> 1 Calvin Anicete        Karla Salcido      26          f         2023-01-02
#> 2 Calvin Anicete     Mitchell Jackson      48          m         2023-01-02
#> 3 Calvin Anicete     Steffano Moseley      51          m         2023-01-03
#> 4 Calvin Anicete              Mai Kim      35          f         2023-01-05
#> 5 Calvin Anicete Elizabeth Blackwater      89          f         2023-01-05
#> 6 Calvin Anicete     Nathaniel Wagner      37          m         2023-01-07
#>   date_last_contact was_case         status
#> 1        2023-01-03        Y           case
#> 2        2023-01-04        Y           case
#> 3        2023-01-04        Y           case
#> 4        2023-01-05        Y           case
#> 5        2023-01-08        N under_followup
#> 6        2023-01-08        N under_followup
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
#>   Lambert J, Tamayo C (NULL). _simulist: Tools to Simulate Line List
#>   and Contacts Data_. doi:10.5281/zenodo.10471458
#>   <https://doi.org/10.5281/zenodo.10471458>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {simulist: Tools to Simulate Line List and Contacts Data},
#>     author = {Joshua W. Lambert and Carmen Tamayo},
#>     year = {NULL},
#>     doi = {10.5281/zenodo.10471458},
#>   }
```
