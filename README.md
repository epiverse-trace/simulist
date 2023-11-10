
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

`{simulist}` is an R package to simulate infectious disease outbreak
data, including line lists and contacts.

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

The line list simulation requires a serial interval,
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

To simulate a line list for COVID-19 with an assumed reproduction number
(`R`) of 1.1 we use the `sim_linelist()` function.

``` r
linelist <- sim_linelist(
  R = 1.1,
  serial_interval = serial_interval,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id               case_name case_type gender age date_onset date_admission
#> 1  1            Aliyah Bunck suspected      f  84 2023-01-01     2023-01-03
#> 2  2             Rayel Roman confirmed      f  62 2023-01-01           <NA>
#> 3  3            Alex Fuentes suspected      m  53 2023-01-01     2023-01-02
#> 4  4        Nusaiba al-Wahab confirmed      f   6 2023-01-02           <NA>
#> 5  5 Monica Alvarez Valentin  probable      f  86 2023-01-02           <NA>
#> 6  6         Adelaide Weible confirmed      f  39 2023-01-02           <NA>
#>   date_death date_first_contact date_last_contact
#> 1       <NA>               <NA>              <NA>
#> 2       <NA>         2022-12-30        2023-01-04
#> 3 2023-01-26         2023-01-01        2023-01-04
#> 4       <NA>         2023-01-01        2023-01-05
#> 5 2023-01-19         2023-01-03        2023-01-04
#> 6       <NA>         2023-01-05        2023-01-07
```

In this example, the line list is simulated using the default values
(see `?sim_linelist`). The default hospitalisation rate is 0.2 (or 20%
of individual infected become hospitalised) and the start date of the
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
#>   id        case_name case_type gender age date_onset date_admission date_death
#> 1  1  Melissa Moralez confirmed      f  41 2019-12-01           <NA>       <NA>
#> 2  2      Lorna Gries suspected      f  72 2019-12-01           <NA>       <NA>
#> 3  3   Saood el-Salik suspected      m  39 2019-12-01           <NA>       <NA>
#> 4  4 Antonio Trujillo  probable      m  61 2019-12-02           <NA>       <NA>
#> 5  5     Aaron Kimble confirmed      m   3 2019-12-01           <NA>       <NA>
#> 6  6      Gage Declaw confirmed      m   6 2019-12-02           <NA> 2019-12-14
#>   date_first_contact date_last_contact
#> 1               <NA>              <NA>
#> 2         2019-11-28        2019-12-03
#> 3         2019-11-28        2019-12-01
#> 4         2019-12-03        2019-12-06
#> 5         2019-12-02        2019-12-03
#> 6         2019-11-30        2019-12-04
```

To simulate a table of contacts we can reuse the serial interval from
the example above, and we additionally need a contact distribution. This
distribution represents the variability in number of contacts that each
person in the population has.

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
#>         from               to cnt_age cnt_gender date_first_contact
#> 1 Ryan Xiong     Fawz el-Noor      89          m         2023-01-03
#> 2 Ryan Xiong      Oleta Knapp       2          f         2023-01-02
#> 3 Ryan Xiong Yohana Bontrager      24          f         2022-12-31
#> 4 Ryan Xiong Danyelle Dowdell       3          f         2023-01-03
#> 5 Ryan Xiong Lorena Dominguez      66          f         2023-01-02
#> 6 Ryan Xiong Jonathan Kercher      89          m         2023-01-03
#>   date_last_contact was_case           status
#> 1        2023-01-04        Y             case
#> 2        2023-01-03        Y             case
#> 3        2023-01-04        N   under_followup
#> 4        2023-01-06        N lost_to_followup
#> 5        2023-01-05        N lost_to_followup
#> 6        2023-01-06        N   under_followup
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
#>   id         case_name case_type gender age date_onset date_admission
#> 1  1      Albert Brown suspected      m  78 2023-01-01           <NA>
#> 2  2    Martin Menning  probable      m  32 2023-01-01           <NA>
#> 3  3     Drayas Fenton  probable      m  85 2023-01-01           <NA>
#> 4  4 Michael Wilkerson suspected      m  60 2023-01-02     2023-01-07
#> 5  5    Essence Fadler  probable      f  86 2023-01-01           <NA>
#> 6  6    Erika Trujillo confirmed      f  15 2023-01-02           <NA>
#>   date_death date_first_contact date_last_contact
#> 1 2023-01-23               <NA>              <NA>
#> 2 2023-01-11         2022-12-31        2023-01-03
#> 3       <NA>         2023-01-02        2023-01-07
#> 4 2023-01-18         2022-12-28        2023-01-02
#> 5 2023-01-12         2023-01-05        2023-01-05
#> 6       <NA>         2023-01-02        2023-01-06
head(outbreak$contacts)
#>             from                to cnt_age cnt_gender date_first_contact
#> 1   Albert Brown    Martin Menning      32          m         2022-12-31
#> 2   Albert Brown     Drayas Fenton      85          m         2023-01-02
#> 3   Albert Brown       Areli Vigil       6          f         2022-12-30
#> 4   Albert Brown       Long Farley      25          m         2023-01-01
#> 5   Albert Brown     Abigail Zagal      17          f         2023-01-03
#> 6 Martin Menning Michael Wilkerson      60          m         2022-12-28
#>   date_last_contact was_case         status
#> 1        2023-01-03        Y           case
#> 2        2023-01-07        Y           case
#> 3        2023-01-03        N under_followup
#> 4        2023-01-04        N under_followup
#> 5        2023-01-05        N under_followup
#> 6        2023-01-02        Y           case
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
#>   Lambert J, Tamayo C (2023). _simulist: Tools to Simulated Line list
#>   Data_. R package version 0.0.0.9000,
#>   https://epiverse-trace.github.io/simulist/,
#>   <https://github.com/epiverse-trace/simulist>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {simulist: Tools to Simulated Line list Data},
#>     author = {Joshua W. Lambert and Carmen Tamayo},
#>     year = {2023},
#>     note = {R package version 0.0.0.9000, 
#> https://epiverse-trace.github.io/simulist/},
#>     url = {https://github.com/epiverse-trace/simulist},
#>   }
```
