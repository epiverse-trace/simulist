
<!-- README.md is generated from README.Rmd. Please edit that file. -->
<!-- The code to render this README is stored in .github/workflows/render-readme.yaml -->
<!-- Variables marked with double curly braces will be transformed beforehand: -->
<!-- `packagename` is extracted from the DESCRIPTION file -->
<!-- `gh_repo` is extracted via a special environment variable in GitHub Actions -->

# *simulist*: Simulate linelist data <img src="man/figures/logo.svg" align="right" width="120" />

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit/)
[![R-CMD-check](https://github.com/epiverse-trace/simulist/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/epiverse-trace/simulist/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/epiverse-trace/simulist/branch/main/graph/badge.svg)](https://app.codecov.io/gh/epiverse-trace/simulist?branch=main)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

`{simulist}` is an R package to simulate a linelist of an infectious
disease outbreak.

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

The linelist simulation requires a serial interval,
onset-to-hospitalisation delay, and onset-to-death delay. We can load
these load these from the library of epidemiological parameters in the
`{epiparameter}` R package, or if these are not available, such as the
serial interval for COVID-19 we can create them ourselves.

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
#> Using Linton NM, Kobayashi T, Yang Y, Hayashi K, Akhmetzhanov AR, Jung S,
#> Yuan B, Kinoshita R, Nishiura H (2020). "Incubation Period and Other
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
#> Using Linton NM, Kobayashi T, Yang Y, Hayashi K, Akhmetzhanov AR, Jung S,
#> Yuan B, Kinoshita R, Nishiura H (2020). "Incubation Period and Other
#> Epidemiological Characteristics of 2019 Novel Coronavirus Infections
#> with Right Truncation: A Statistical Analysis of Publicly Available
#> Case Data." _Journal of Clinical Medicine_. doi:10.3390/jcm9020538
#> <https://doi.org/10.3390/jcm9020538>.. 
#> To retrieve the short citation use the 'get_citation' function
```

To simulate a linelist for COVID-19 with an assumed reproduction number
(`R`) of 1.1 we use the `sim_linelist()` function.

``` r
linelist <- sim_linelist(
  R = 1.1,
  serial_interval = serial_interval,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id gender age onset_date hospitalisation_date date_first_contact
#> 1  1      m  66 2023-01-01                 <NA>               <NA>
#> 2  2      f  37 2023-01-01                 <NA>         2023-01-07
#> 3  3      m  81 2023-01-01                 <NA>         2023-01-01
#> 4  4      m  33 2023-01-02                 <NA>         2023-01-01
#> 5  5      f  81 2023-01-02           2023-01-03         2023-01-06
#> 6  6      m   1 2023-01-04           2023-01-08         2023-01-03
#>   date_last_contact
#> 1              <NA>
#> 2        2023-01-09
#> 3        2023-01-04
#> 4        2023-01-02
#> 5        2023-01-07
#> 6        2023-01-06
```

In this example, the linelist is simulated using the default values (see
`?sim_linelist`). The default hospitalisation rate is 0.2 (or 20% of
individual infected become hospitalised) and the start date of the
outbreak is 1st January 2023. To modify either of these to make them
more realistic we can specify them.

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
#>   id gender age onset_date hospitalisation_date date_first_contact
#> 1  1      f  60 2019-12-01                 <NA>               <NA>
#> 2  2      f  11 2019-12-01                 <NA>         2019-11-27
#> 3  3      m  24 2019-12-02                 <NA>         2019-11-29
#> 4  4      f  39 2019-12-02                 <NA>         2019-11-30
#> 5  5      f  64 2019-12-01                 <NA>         2019-11-30
#> 6  6      f  87 2019-12-02                 <NA>         2019-12-05
#>   date_last_contact
#> 1              <NA>
#> 2        2019-12-01
#> 3        2019-12-03
#> 4        2019-12-04
#> 5        2019-12-02
#> 6        2019-12-06
```

## Help

To report a bug please open an
[issue](https://github.com/epiverse-trace/simulist/issues/new/choose)

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
#>   Lambert J, Tamayo C (2023). _simulist: Tools to Simulated Linelist
#>   Data_. R package version 0.0.0.9000.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {simulist: Tools to Simulated Linelist Data},
#>     author = {Joshua W. Lambert and Carmen Tamayo},
#>     year = {2023},
#>     note = {R package version 0.0.0.9000},
#>   }
```
