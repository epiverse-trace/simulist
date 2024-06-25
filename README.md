
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

## Key features

`{simulist}` allows you to simulate realistic line list and contact
tracing data, with:

:hourglass_flowing_sand: Parameterised epidemiological delay
distributions <br> :hospital: Population-wide or age-stratified
hospitalisation and death risks <br> :bar_chart: Uniform or
age-structured populations <br> :chart_with_upwards_trend: Constant or
time-varying case fatality risk <br> :clipboard: Customisable
probability of case types and contact tracing follow-up <br>

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
```

A line list can be simulated by calling `sim_linelist()`. The function
provides sensible defaults to quickly generate a epidemiologically valid
data set.

``` r
set.seed(1)
linelist <- sim_linelist()
head(linelist)
#>   id        case_name case_type sex age date_onset date_admission   outcome
#> 1  1   Dylan Quintana confirmed   m  59 2023-01-01           <NA> recovered
#> 2  2     Briana Owens confirmed   f  90 2023-01-01     2023-01-06      died
#> 3  3  Elaine Phillips  probable   f   4 2023-01-02     2023-01-08      died
#> 4  5    Justin Farley  probable   m  29 2023-01-04           <NA> recovered
#> 5  6 Sadeeda el-Obeid suspected   f  14 2023-01-05           <NA> recovered
#> 6  7   Mouneek Israel  probable   f  85 2023-01-06           <NA>      died
#>   date_outcome date_first_contact date_last_contact ct_value
#> 1         <NA>               <NA>              <NA>     26.3
#> 2   2023-01-19         2022-12-31        2023-01-05     26.3
#> 3   2023-01-08         2022-12-30        2023-01-01       NA
#> 4         <NA>         2023-01-05        2023-01-05       NA
#> 5         <NA>         2023-01-07        2023-01-08       NA
#> 6   2023-01-15         2023-01-03        2023-01-06       NA
```

However, to simulate a more realistic line list using epidemiological
parameters estimated for a infectious disease we can use previously
estimated epidemiological parameters. These can be from the
`{epiparameter}` R package if available, or if these are not in the
`{epiparameter}` database yet (such as the contact distribution for
COVID-19) we can define them ourselves. Here we define a contact
distribution, period of infectiousness, onset-to-hospitalisation delay,
and onset-to-death delay.

``` r
library(epiparameter)
```

``` r
# create COVID-19 contact distribution
contact_distribution <- epiparameter::epidist(
  disease = "COVID-19", 
  epi_dist = "contact distribution", 
  prob_distribution = "pois", 
  prob_distribution_params = c(mean = 2)
)
#> Citation cannot be created as author, year, journal or title is missing
```

``` r

# create COVID-19 infectious period
infectious_period <- epiparameter::epidist(
  disease = "COVID-19",
  epi_dist = "infectious period",
  prob_distribution = "gamma",
  prob_distribution_params = c(shape = 1, scale = 1)
)
#> Citation cannot be created as author, year, journal or title is missing
```

``` r

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
```

``` r

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
infection (`prob_infection`); the number of infections is a binomial
sample of the number of contacts for each case with the probability of
infection (i.e. being sampled) given by `prob_infection`. If the average
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
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(linelist)
#>   id         case_name case_type sex age date_onset date_admission   outcome
#> 1  1   Rushdi al-Ishak  probable   m  35 2023-01-01           <NA> recovered
#> 2  2        Jeffrey Le confirmed   m  43 2023-01-01           <NA> recovered
#> 3  3 Dominic Barringer suspected   m   1 2023-01-01           <NA> recovered
#> 4  5      Tyler Kelley  probable   m  78 2023-01-01           <NA> recovered
#> 5  6     Carolyn Moore confirmed   f  22 2023-01-01           <NA> recovered
#> 6  8 Cheyenne Sayavong confirmed   f  28 2023-01-01     2023-01-04      died
#>   date_outcome date_first_contact date_last_contact ct_value
#> 1         <NA>               <NA>              <NA>       NA
#> 2         <NA>         2022-12-30        2023-01-05       24
#> 3         <NA>         2022-12-30        2023-01-02       NA
#> 4         <NA>         2022-12-29        2023-01-02       NA
#> 5         <NA>         2023-01-01        2023-01-03       24
#> 6   2023-01-16         2023-01-03        2023-01-04       24
```

In this example, the line list is simulated using the default values
(see `?sim_linelist`). The default hospitalisation risk is assumed to be
0.2 (i.e. there is a 20% probability an infected individual becomes
hospitalised) and the start date of the outbreak is 1st January 2023. To
modify either of these, we can specify them in the function.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = 0.01,
  outbreak_start_date = as.Date("2019-12-01")
)
head(linelist)
#>   id         case_name case_type sex age date_onset date_admission   outcome
#> 1  1 Kiersten Matthews confirmed   f  72 2019-12-01           <NA> recovered
#> 2  2         Omar Cruz confirmed   m  85 2019-12-01           <NA> recovered
#> 3  3   Emilio Alvarado suspected   m  24 2019-12-01           <NA> recovered
#> 4  4    Sonya Santiago confirmed   f  67 2019-12-01     2019-12-03 recovered
#> 5  5   Michelle Brooks  probable   f  37 2019-12-02           <NA> recovered
#> 6  6  Anastasia Hamlin confirmed   f  14 2019-12-02           <NA> recovered
#>   date_outcome date_first_contact date_last_contact ct_value
#> 1         <NA>               <NA>              <NA>     23.5
#> 2         <NA>         2019-11-30        2019-12-06     23.5
#> 3         <NA>         2019-11-30        2019-12-01       NA
#> 4         <NA>         2019-12-07        2019-12-09     23.5
#> 5         <NA>         2019-12-01        2019-12-04       NA
#> 6         <NA>         2019-12-01        2019-12-04     23.5
```

To simulate a table of contacts of cases (i.e. to reflect a contact
tracing dataset) we can use the same parameters defined for the example
above.

``` r
contacts <- sim_contacts(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period, 
  prob_infection = 0.5
)
#> Warning: Number of cases exceeds maximum outbreak size. 
#> Returning data early with 10176 cases and 20217 total contacts (including cases).
```

``` r
head(contacts)
#>             from               to age sex date_first_contact date_last_contact
#> 1 Brandon Byrnes Mustaba el-Wahba  14   m         2023-01-01        2023-01-03
#> 2 Brandon Byrnes  Lonnie Williams  33   m         2022-12-31        2023-01-05
#> 3 Brandon Byrnes     Robert Brown  34   m         2022-12-28        2023-01-02
#> 4 Brandon Byrnes    Desiree Mabry  76   f         2023-01-03        2023-01-06
#> 5 Brandon Byrnes Salvador Trevino  73   m         2023-01-05        2023-01-07
#> 6  Desiree Mabry          Gina Yu  90   f         2023-01-05        2023-01-06
#>   was_case           status
#> 1        N   under_followup
#> 2        N lost_to_followup
#> 3        N   under_followup
#> 4        Y             case
#> 5        N   under_followup
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
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
head(outbreak$linelist)
#>   id        case_name case_type sex age date_onset date_admission   outcome
#> 1  1 Annnees al-Nazir  probable   m  24 2023-01-01           <NA> recovered
#> 2  2  Muammar al-Miah  probable   m  46 2023-01-02           <NA> recovered
#> 3  4     Melina Tarin  probable   f  71 2023-01-02           <NA> recovered
#> 4  6    Alysh Lovejoy suspected   f  13 2023-01-03           <NA> recovered
#> 5  9    Dylan Scanlon confirmed   m  28 2023-01-03           <NA> recovered
#> 6 11  Nikolay Mcinnis suspected   m  15 2023-01-03           <NA> recovered
#>   date_outcome date_first_contact date_last_contact ct_value
#> 1         <NA>               <NA>              <NA>       NA
#> 2         <NA>         2023-01-04        2023-01-07       NA
#> 3         <NA>         2023-01-03        2023-01-05       NA
#> 4         <NA>         2023-01-04        2023-01-06       NA
#> 5         <NA>         2023-01-04        2023-01-07     25.6
#> 6         <NA>         2023-01-05        2023-01-06       NA
```

``` r
head(outbreak$contacts)
#>               from              to age sex date_first_contact date_last_contact
#> 1 Annnees al-Nazir Muammar al-Miah  46   m         2023-01-04        2023-01-07
#> 2 Annnees al-Nazir    Siena Quimby  76   f         2022-12-27        2023-01-02
#> 3  Muammar al-Miah    Melina Tarin  71   f         2023-01-03        2023-01-05
#> 4  Muammar al-Miah  Destinee Embry  49   f         2023-01-01        2023-01-04
#> 5     Melina Tarin   Alysh Lovejoy  13   f         2023-01-04        2023-01-06
#> 6    Alysh Lovejoy    Andrew Knott  55   m         2023-01-03        2023-01-05
#>   was_case           status
#> 1        Y             case
#> 2        N lost_to_followup
#> 3        Y             case
#> 4        N   under_followup
#> 5        Y             case
#> 6        N   under_followup
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
#>   Lambert J, Tamayo C (2024). _simulist: Simulate Disease Outbreak Line
#>   List and Contacts Data_. doi:10.5281/zenodo.10471458
#>   <https://doi.org/10.5281/zenodo.10471458>,
#>   <https://epiverse-trace.github.io/simulist/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {simulist: Simulate Disease Outbreak Line List and Contacts Data},
#>     author = {Joshua W. Lambert and Carmen Tamayo},
#>     year = {2024},
#>     doi = {10.5281/zenodo.10471458},
#>     url = {https://epiverse-trace.github.io/simulist/},
#>   }
```

## Complimentary R packages

:package: :left_right_arrow: :package:
[{epiparameter}](https://epiverse-trace.github.io/epiparameter/) <br>
:package: :left_right_arrow: :package:
[{epicontacts}](https://www.repidemicsconsortium.org/epicontacts/) <br>
:package: :left_right_arrow: :package:
[{incidence2}](https://www.reconverse.org/incidence2/) <br>

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
  observation and reporting delays. Line list data is generated in two
  steps, 1) the SIR model simulates the outbreak (`simpleSim()`), 2) the
  outbreak data is converted into a line list (`createLineList()`).
- [`{simulacr}`](https://github.com/reconhub/simulacr) uses a branching
  process model to simulate cases and contacts for an outbreak. It
  simulates transmission of infections using other epidemiological R
  packages (`{epicontacts}` and `{distcrete}`) to parameterise and plot
  simulated data.
- [`{epidict}`](https://github.com/R4EPI/epidict) is a package that can
  be used to simulate outbreak data, including line lists, in a DHIS2
  format, and survey data that mimics the format by Kobo, using the
  function `gen_data()`. In addition, MSF outbreak data are available in
  this package as data dictionaries for Acute Jaundice Syndrome,
  Cholera, Measles and Meningitis, accessible through the function
  `msf_dict()`.
- [`{EpiNow}`](https://github.com/epiforecasts/EpiNow) - a now
  deprecated R package - includes the `simulate_cases()` and
  `generate_pseudo_linelist()` functions for generating line list data.
- [generative-nowcasting](https://github.com/adrian-lison/generative-nowcasting)
  is a set of R scripts and functions to perform epidemiological
  nowcasting. There are [functions to simulate line list
  data](https://github.com/adrian-lison/generative-nowcasting/blob/bf48e027e82ce9d42de468d0b708d010253b7475/code/utils/utils_simulate.R)
  within the repository, but the repository is not (and does not
  contain) an R package. Functions can be sourced. Cases are simulated
  with a renewal process and the simulation can incorporate
  epidemiological delays and ascertainment.

<details>
<summary>
Table of line list simulator features
</summary>

|                                          | {simulist}         | {LLsim}            | {simulacr}         | {epidict}          | {EpiNow}           | generative-nowcasting |
|------------------------------------------|--------------------|--------------------|--------------------|--------------------|--------------------|-----------------------|
| Simulates line list                      | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark:    |
| Simulates contacts                       | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :x:                | :x:                   |
| Parameterised with epi distributions[^1] | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :white_check_mark: | :white_check_mark:    |
| Interoperable with {epicontacts}         | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :x:                | :x:                   |
| Explicit population size[^2]             | :x:                | :white_check_mark: | :white_check_mark: | :x:                | :x:                | :x:                   |
| R package                                | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                   |
| Actively maintained[^3]                  | :white_check_mark: | :x:                | :x:                | :x:                | :x:                | :white_check_mark:    |
| On CRAN                                  | :x:                | :x:                | :x:                | :x:                | :x:                | NA                    |
| Unit testing[^4]                         | :white_check_mark: | :white_check_mark: | :x:                | :white_check_mark: | :x:                | NA                    |

</details>

If there is another package with this functionality missing from the
list that should be added, or if a package included in this list has
been updated and the table should reflect this please contribute by
making an [issue](https://github.com/epiverse-trace/simulist/issues) or
a [pull request](https://github.com/epiverse-trace/simulist/pulls).

Some packages are related to {simulist} but do not simulate line list
data. These include:

- [`{outbreaks}`](https://CRAN.R-project.org/package=outbreaks) an R
  package containing a library of outbreak data sets, including line
  list data, for a variety of past and simulated outbreaks, e.g. Ebola
  and MERS.
- [`{ringbp}`](https://github.com/epiforecasts/ringbp) an R package to
  simulate cases using an individual-level transmission model with
  contact tracing.
- [`{epichains}`](https://github.com/epiverse-trace/epichains) an R
  package with functionality to simulate transmission chains using a
  branching process model.

The {outbreaks} package is useful if data from a past outbreak data or
generic line list data is required. The {ringbp} and {epichains}
packages can be used to generate case data over time which can then be
converted into a line list with some manual post-processing.

[^1]: In this context *Parameterised with epi distributions* means that
    the simulation uses epidemiological distributions (e.g. serial
    interval, infectious period) to parameterise the model and the
    parameters of these epi distributions can be modified by the user.

[^2]: *Explicit population size* refers to the simulation using a finite
    population size which is controlled by the user for the depletion of
    susceptible individuals in the model.

[^3]: We define *Actively maintained* as the repository having a commit
    to the main branch within the last 12 months.

[^4]: *Unit testing* is ticked if the package contains any form of
    testing, this can use any testing framework, for example
    [{testthat}](https://CRAN.R-project.org/package=testthat) or
    [{tinytest}](https://CRAN.R-project.org/package=tinytest).
