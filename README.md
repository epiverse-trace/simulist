
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

The line list simulation requires that we define a contact interval,
onset-to-hospitalisation delay, and onset-to-death delay. We can load
these from the library of epidemiological parameters in the
`{epiparameter}` R package if available, or if these are not in the
database yet (such as the contact interval for COVID-19) we can define
them ourselves.

``` r
# create COVID-19 contact interval
contact_interval <- epiparameter::epidist(
  disease = "COVID-19",
  epi_dist = "contact interval",
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

To simulate a line list for COVID-19 with an assumed average number of
contacts of 2 and a probability of infection per contact of 0.5, we use
the `sim_linelist()` function. The mean number of contacts and
probability of infection determine the outbreak reproduction number, if
the resulting reproduction number is around one it means we will likely
get a reasonably sized outbreak (10 - 1000 cases, varying due to the
stochastic simulation). *Take care when setting the mean number of
contacts and the probability of infection, as this can lead to the
outbreak becoming extremely large*.

``` r
set.seed(1)
linelist <- sim_linelist(
  mean_contacts = 2,
  contact_interval = contact_interval,
  prob_infect = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id         case_name case_type gender age date_onset date_admission
#> 1  1 Sabeeha el-Hannan  probable      f  28 2023-01-01           <NA>
#> 2  2    Jaedyn Robbins confirmed      f  62 2023-01-02     2023-01-02
#> 5  5          Young Vu confirmed      m  42 2023-01-01           <NA>
#> 6  6      Alyssa Gloyd  probable      f  60 2023-01-01           <NA>
#> 8  8   Sebastian Boden  probable      m  28 2023-01-02     2023-01-03
#> 9  9  Sierra Hernandez suspected      f  78 2023-01-01           <NA>
#>   date_death date_first_contact date_last_contact ct_value
#> 1       <NA>               <NA>              <NA>       NA
#> 2       <NA>         2023-01-02        2023-01-05     25.1
#> 5       <NA>         2023-01-03        2023-01-04     25.1
#> 6       <NA>         2023-01-02        2023-01-04       NA
#> 8       <NA>         2023-01-01        2023-01-03       NA
#> 9       <NA>         2022-12-29        2023-01-04       NA
```

In this example, the line list is simulated using the default values
(see `?sim_linelist`). The default hospitalisation risk is assumed to be
0.2 (i.e. there is a 20% probability an infected individual becomes
hospitalised) and the start date of the outbreak is 1st January 2023. To
modify either of these, we can specify them in the function.

``` r
linelist <- sim_linelist(
  mean_contacts = 2,
  contact_interval = contact_interval,
  prob_infect = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = 0.01,
  outbreak_start_date = as.Date("2019-12-01")
)
head(linelist)
#>   id              case_name case_type gender age date_onset date_admission
#> 1  1 Aaren-Matthew Deguzman  probable      m  65 2019-12-01           <NA>
#> 2  2      Thaamira el-Yusuf confirmed      f  61 2019-12-01           <NA>
#> 3  3         Hector Hickman suspected      m  56 2019-12-01           <NA>
#> 4  4     Zuhriyaa al-Saleem  probable      f  36 2019-12-01           <NA>
#> 5  5            Chisa Xiong confirmed      f  20 2019-12-01           <NA>
#> 6  6     Tre-Shawn Williams confirmed      m  85 2019-12-02     2019-12-06
#>   date_death date_first_contact date_last_contact ct_value
#> 1       <NA>               <NA>              <NA>       NA
#> 2       <NA>         2019-11-26        2019-12-06     25.3
#> 3       <NA>         2019-11-28        2019-12-03       NA
#> 4       <NA>         2019-11-28        2019-12-02       NA
#> 5       <NA>         2019-11-28        2019-12-02     25.3
#> 6       <NA>         2019-12-01        2019-12-04     25.3
```

To simulate a table of contacts of cases (i.e. to reflect a contact
tracing dataset) we can use the same parameters defined for the example
above.

``` r
contacts <- sim_contacts(
  mean_contacts = 2, 
  contact_interval = contact_interval, 
  prob_infect = 0.5
)
head(contacts)
#>             from               to age gender date_first_contact
#> 2  James Padilla   Miranda Blanco  69      f         2022-12-31
#> 3  James Padilla      Allan Bunge  83      m         2023-01-05
#> 4    Allan Bunge   Nicholas Rabia  18      m         2023-01-02
#> 5    Allan Bunge Unais al-Shabazz  85      m         2023-01-04
#> 6 Nicholas Rabia    Apiluck Chong  84      m         2022-12-30
#> 7 Nicholas Rabia     Rachel Tyler  90      f         2023-01-02
#>   date_last_contact was_case         status
#> 2        2023-01-03        N        unknown
#> 3        2023-01-05        Y           case
#> 4        2023-01-05        Y           case
#> 5        2023-01-06        Y           case
#> 6        2023-01-02        N under_followup
#> 7        2023-01-04        Y           case
```

If both the line list and contacts table are required, they can be
jointly simulated using the `sim_outbreak()` function. This uses the
same inputs as `sim_linelist()` and `sim_contacts()` to produce a line
list and contacts table of the same outbreak (the arguments also have
the same default settings as the other functions).

``` r
outbreak <- sim_outbreak(
  mean_contacts = 2,
  contact_interval = contact_interval,
  prob_infect = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(outbreak$linelist)
#>    id           case_name case_type gender age date_onset date_admission
#> 1   1   Katherin Trancoso confirmed      f   2 2023-01-01           <NA>
#> 4   4        E-Shaw Allen confirmed      f  47 2023-01-01           <NA>
#> 5   5     Madison Moltrer suspected      f   8 2023-01-01           <NA>
#> 8   8 Christopher Richter confirmed      m  18 2023-01-02     2023-01-08
#> 11 11      Elias Mckenzie confirmed      m   4 2023-01-01           <NA>
#> 12 12       Elaine Nguyen confirmed      f  60 2023-01-02           <NA>
#>    date_death date_first_contact date_last_contact ct_value
#> 1        <NA>               <NA>              <NA>     24.5
#> 4        <NA>         2023-01-02        2023-01-06     24.5
#> 5        <NA>         2022-12-31        2023-01-03       NA
#> 8        <NA>         2023-01-02        2023-01-03     24.5
#> 11       <NA>         2023-01-04        2023-01-06     24.5
#> 12       <NA>         2023-01-07        2023-01-09     24.5
head(outbreak$contacts)
#>                from                to age gender date_first_contact
#> 2 Katherin Trancoso      David Mcafee  46      m         2023-01-02
#> 3 Katherin Trancoso Firdaus al-Hamidi  68      f         2022-12-30
#> 4 Katherin Trancoso      E-Shaw Allen  47      f         2023-01-02
#> 5 Katherin Trancoso   Madison Moltrer   8      f         2022-12-31
#> 6      E-Shaw Allen       Tyko Pahang  24      m         2023-01-05
#> 7   Madison Moltrer   Bryan Rodriguez  67      m         2022-12-31
#>   date_last_contact was_case           status
#> 2        2023-01-02        N lost_to_followup
#> 3        2023-01-02        N   under_followup
#> 4        2023-01-06        Y             case
#> 5        2023-01-03        Y             case
#> 6        2023-01-05        N lost_to_followup
#> 7        2023-01-02        N   under_followup
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
