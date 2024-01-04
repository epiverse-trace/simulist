
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
#>   id               case_name case_type gender age date_onset date_admission
#> 1  1            Brian Murphy confirmed      m  87 2023-01-01           <NA>
#> 2  2         Benjamin Brooks  probable      m  13 2023-01-01           <NA>
#> 3  3              Zoe Turner  probable      f   6 2023-01-01           <NA>
#> 4  4           Hannah Butler confirmed      f  32 2023-01-02           <NA>
#> 5  5 Daris Villalobos-Corral confirmed      m  50 2023-01-03           <NA>
#> 6  6           Zachary Lapre  probable      m  34 2023-01-01           <NA>
#>   date_death date_first_contact date_last_contact ct_value
#> 1       <NA>               <NA>              <NA>     27.9
#> 2       <NA>         2023-01-01        2023-01-05       NA
#> 3       <NA>         2022-12-31        2023-01-05       NA
#> 4       <NA>         2022-12-30        2023-01-03     27.9
#> 5       <NA>         2022-12-27        2023-01-03     27.9
#> 6       <NA>         2023-01-02        2023-01-05       NA
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
  hosp_rate = 0.01,
  outbreak_start_date = as.Date("2019-12-01")
)
head(linelist)
#>   id               case_name case_type gender age date_onset date_admission
#> 1  1               Luc James confirmed      m  43 2019-12-01           <NA>
#> 2  2      Ernestina Espinoza confirmed      f  24 2019-12-02           <NA>
#> 3  3   Nicholas Krishnaswamy confirmed      m  53 2019-12-01           <NA>
#> 4  4               Ian Lewis  probable      m  24 2019-12-02           <NA>
#> 5  5         Antonio Alvarez  probable      m  11 2019-12-02           <NA>
#> 6  6 Abdul Haleem al-Youssef suspected      m  45 2019-12-03           <NA>
#>   date_death date_first_contact date_last_contact ct_value
#> 1       <NA>               <NA>              <NA>     25.2
#> 2       <NA>         2019-12-04        2019-12-07     25.2
#> 3       <NA>         2019-12-02        2019-12-03     25.2
#> 4       <NA>         2019-12-04        2019-12-06       NA
#> 5       <NA>         2019-11-30        2019-12-02       NA
#> 6       <NA>         2019-12-01        2019-12-04       NA
```

To simulate a table of contacts of cases (i.e. to reflect a contact
tracing dataset) we can use the same serial interval defined for the
example above. We additionally need a contact distribution, which
represents the probability that each person in the population will be a
given number of contacts on a given day.

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
#>            from                   to cnt_age cnt_gender date_first_contact
#> 1 Jacob Camacho           Fiona Dall      55          f         2022-12-31
#> 2 Jacob Camacho         Chandan Vang      36          m         2022-12-30
#> 3 Jacob Camacho            Troy Choi      70          m         2023-01-01
#> 4 Jacob Camacho    Fateena al-Hamdan      74          f         2023-01-04
#> 5 Jacob Camacho Abdul Baasid el-Asad      48          m         2023-01-03
#> 6    Fiona Dall        Jeremy Moreno      83          m         2022-12-31
#>   date_last_contact was_case         status
#> 1        2023-01-06        Y           case
#> 2        2023-01-01        N under_followup
#> 3        2023-01-02        N under_followup
#> 4        2023-01-06        N under_followup
#> 5        2023-01-04        N under_followup
#> 6        2023-01-04        Y           case
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
#>   id          case_name case_type gender age date_onset date_admission
#> 1  1       Amanda Mills suspected      f  72 2023-01-01           <NA>
#> 2  2 Anthony San Miguel confirmed      m  32 2023-01-01           <NA>
#> 3  3      Calista Silva confirmed      f  57 2023-01-03           <NA>
#> 4  4       Alia Strover confirmed      f   1 2023-01-01     2023-01-03
#> 5  5  Justin Burchfield  probable      m  48 2023-01-03           <NA>
#> 6  6        Cody Nguyen confirmed      m   1 2023-01-06           <NA>
#>   date_death date_first_contact date_last_contact ct_value
#> 1       <NA>               <NA>              <NA>       NA
#> 2       <NA>         2023-01-01        2023-01-04     23.5
#> 3       <NA>         2023-01-01        2023-01-05     23.5
#> 4       <NA>         2022-12-31        2023-01-05     23.5
#> 5       <NA>         2023-01-03        2023-01-07       NA
#> 6       <NA>         2023-01-01        2023-01-04     23.5
head(outbreak$contacts)
#>                 from                 to cnt_age cnt_gender date_first_contact
#> 1       Amanda Mills Anthony San Miguel      32          m         2023-01-01
#> 2       Amanda Mills       Corey Dunlap      37          m         2023-01-01
#> 3       Amanda Mills     Fendi Saldanha      82          f         2023-01-01
#> 4 Anthony San Miguel      Calista Silva      57          f         2023-01-01
#> 5 Anthony San Miguel       Alia Strover       1          f         2022-12-31
#> 6 Anthony San Miguel  Justin Burchfield      48          m         2023-01-03
#>   date_last_contact was_case           status
#> 1        2023-01-04        Y             case
#> 2        2023-01-04        N lost_to_followup
#> 3        2023-01-03        N lost_to_followup
#> 4        2023-01-05        Y             case
#> 5        2023-01-05        Y             case
#> 6        2023-01-07        Y             case
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
#>   Lambert J, Tamayo C (2024). _simulist: Tools to Simulated Line list
#>   Data_. R package version 0.0.0.9000,
#>   https://epiverse-trace.github.io/simulist/,
#>   <https://github.com/epiverse-trace/simulist>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {simulist: Tools to Simulated Line list Data},
#>     author = {Joshua W. Lambert and Carmen Tamayo},
#>     year = {2024},
#>     note = {R package version 0.0.0.9000, 
#> https://epiverse-trace.github.io/simulist/},
#>     url = {https://github.com/epiverse-trace/simulist},
#>   }
```
