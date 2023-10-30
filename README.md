
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
#>   id          case_name case_type gender age onset_date hospitalisation_date
#> 1  1     Danielle Allen confirmed      f  31 2023-01-01                 <NA>
#> 2  2        Justina Lum  probable      f  14 2023-01-02                 <NA>
#> 3  3     Elijah Holland confirmed      m  40 2023-01-01                 <NA>
#> 4  4     Deanna Machado  probable      f  55 2023-01-02                 <NA>
#> 5  5 James Christiansen suspected      m   2 2023-01-02                 <NA>
#> 6  6     Jeremy Randall confirmed      m  85 2023-01-04                 <NA>
#>   date_first_contact date_last_contact
#> 1               <NA>              <NA>
#> 2         2022-12-28        2023-01-01
#> 3         2022-12-30        2023-01-03
#> 4         2022-12-27        2023-01-02
#> 5         2022-12-28        2023-01-02
#> 6         2023-01-03        2023-01-05
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
#>   id              case_name case_type gender age onset_date
#> 1  1     Ashley Evangelista suspected      f  84 2019-12-01
#> 2  2  Jaleesa-Lynn Moreland confirmed      f  64 2019-12-02
#> 3  3                Ian Bol  probable      m  50 2019-12-01
#> 4  4    Fernando Perez-Rios confirmed      m  51 2019-12-03
#> 5  5            Sean Overly  probable      m  21 2019-12-04
#> 6  6 Frederico L'Hirondelle confirmed      m  25 2019-12-05
#>   hospitalisation_date date_first_contact date_last_contact
#> 1                 <NA>               <NA>              <NA>
#> 2                 <NA>         2019-12-02        2019-12-04
#> 3                 <NA>         2019-12-02        2019-12-04
#> 4                 <NA>         2019-12-02        2019-12-06
#> 5                 <NA>         2019-12-02        2019-12-04
#> 6                 <NA>         2019-12-01        2019-12-06
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
#>       part_name    contact_name cnt_age cnt_gender date_first_contact
#> 1 Alexah Badsky Fikri al-Rashid      48          m         2023-01-02
#> 2 Alexah Badsky Jessica Jasinto      69          f         2022-12-31
#> 3 Alexah Badsky   Shyanne Anson      42          f         2023-01-02
#> 4 Alexah Badsky   German Medina      25          m         2023-01-03
#> 5 Alexah Badsky Destiny Simpson      60          f         2023-01-02
#> 6 Alexah Badsky  Kimberly Adams      61          f         2023-01-04
#>   date_last_contact was_case           status
#> 1        2023-01-04        Y             case
#> 2        2023-01-05        N   under_followup
#> 3        2023-01-03        N lost_to_followup
#> 4        2023-01-04        N lost_to_followup
#> 5        2023-01-05        N lost_to_followup
#> 6        2023-01-09        N   under_followup
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
#>   id       case_name case_type gender age onset_date hospitalisation_date
#> 1  1    Karen Galvan confirmed      f  82 2023-01-01                 <NA>
#> 2  2    Farha al-Eid confirmed      f  40 2023-01-01                 <NA>
#> 3  3    Jana Skinner confirmed      f   1 2023-01-01           2023-01-02
#> 4  4  Dakota Vincent confirmed      m  64 2023-01-02                 <NA>
#> 5  5  Dekota Naranjo  probable      m  15 2023-01-01                 <NA>
#> 6  6 Gaston Pagaduan  probable      m  34 2023-01-02                 <NA>
#>   date_first_contact date_last_contact
#> 1               <NA>              <NA>
#> 2         2022-12-31        2023-01-04
#> 3         2023-01-06        2023-01-08
#> 4         2022-12-29        2023-01-02
#> 5         2022-12-31        2023-01-02
#> 6         2023-01-03        2023-01-05
head(outbreak$contacts)
#>      part_name       contact_name cnt_age cnt_gender date_first_contact
#> 1 Karen Galvan       Farha al-Eid      40          f         2022-12-31
#> 2 Karen Galvan   Shauntel Kennedy      41          f         2022-12-30
#> 3 Karen Galvan    Mariana Heidorn      17          f         2022-12-30
#> 4 Karen Galvan     Roberto Lovato      68          m         2022-12-28
#> 5 Karen Galvan   Davianna Judkins      67          f         2023-01-01
#> 6 Karen Galvan Rasheeqa al-Khalaf      88          f         2023-01-03
#>   date_last_contact was_case           status
#> 1        2023-01-04        Y             case
#> 2        2023-01-01        N lost_to_followup
#> 3        2023-01-04        N          unknown
#> 4        2023-01-02        N lost_to_followup
#> 5        2023-01-01        N   under_followup
#> 6        2023-01-04        N   under_followup
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
#>   Data_. https://github.com/epiverse-trace/simulist,
#>   https://epiverse-trace.github.io/simulist/.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {simulist: Tools to Simulated Line list Data},
#>     author = {Joshua W. Lambert and Carmen Tamayo},
#>     year = {2023},
#>     note = {https://github.com/epiverse-trace/simulist,
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

If there is another package with this functionality missing from the
list that should be added, or if a package included in this list has
been updated and the table should reflect this please contribute by
making an [issue](https://github.com/epiverse-trace/simulist/issues) or
a [pull request](https://github.com/epiverse-trace/simulist/pulls).

- [`{LLsim}`](https://github.com/jrcpulliam/LLsim) has the same
  objective as `{simulist}`, to simualte realistic line list data.
- [`{simulacr}`](https://github.com/reconhub/simulacr)
- [`{epidict}`](https://github.com/R4EPI/epidict) is a package for data
  dictionaries and generating epi data. Its `gen_data()` function can
  simulate line list data.
- [`{EpiNow}`](https://github.com/epiforecasts/EpiNow) is a now
  deprecated R package that includes the `simulate_cases()` and
  `generate_pseudo_linelist()` functions.

|                                      | {simulist}    | {LLsim}     | {simulacr}     | {epidict}    | {EpiNow}       |
|--------------------------------------|---------------|-------------|----------------|--------------|----------------|
| Simulates line list                  | ✅            | ✅          | ✅             | ✅           | ✅             |
| Simulates contacts                   | Lorem ipsum   | Sed do      | Ut enim        | Duis aute    | Cillum dolore  |
| Parameterised with epi distributions | Lorem ipsum   | Sed do      | Ut enim        | Duis aute    | Cillum dolore  |
| Actively maintained\*                | ✅            | Anim id     | ❌             | ❌           | ❌             |
| Unit testing                         | ✅            | Duis aute   | ❌             | ✅           | ❌             |
| Lorem ipsum                          | Cillum dolore | Ut enim     | Laboris nisi   | Duis aute    | Excepteur sint |
| Interoperable with {epicontacts}     | ❌            | Ut enim     | Laboris nisi   | Duis aute    | Excepteur sint |
| Explicit population size             | ❌            | Sed do      | Ut enim        | Duis aute    | Cillum dolore  |
| On CRAN                              | ❌            | Lorem ipsum | Excepteur sint | Laboris nisi | Ut enim        |

\* We define actively maintained as the respository having a commit to
the main branch within the last 12 months
