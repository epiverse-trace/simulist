# Age-stratified hospitalisation and death risks

If you are unfamiliar with the {simulist} package or the
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
function [Get Started
vignette](https://epiverse-trace.github.io/simulist/articles/simulist.md)
is a great place to start.

This vignette will describe how to simulate a line list with
age-stratified (or age-dependent) hospitalisation and death risks.

There are three risks in {simulist}, specifically in the
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
and
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
functions, that relate to hospitalisations and deaths:

1.  Hospitalisation risk (`hosp_risk`)
2.  Death risk in hospitals (`hosp_death_risk`)
3.  Death risk outside of hospitals (`non_hosp_death_risk`)

The default for
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
is a `0.2` (or 20%) hospitalisation risk for individuals infected, `0.5`
(or 50%) death risk for hospitalised individuals, and `0.05` (or 5%)
death risk for infected individuals outside of hospitals. These default
risks are applied to all age groups in the populations.

However, it may be unrealistic to assume that the probability an
infected person is admitted to hospital or dies is independent of their
age. For many diseases, young children or elderly individuals are at
higher risk of being hospitalised and having adverse outcomes.

The
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
function can accommodate age-stratified risks by accepting a
`<data.frame>` instead of a single risk for the entire population.

``` r
library(simulist)
library(epiparameter)
```

Here is an example that uses the default hospitalisation and death risks
(inside and outside of hospital). First we load the requested delay
distributions using the {epiparameter} package.

``` r
contact_distribution <- epiparameter(
  disease = "COVID-19",
  epi_name = "contact distribution",
  prob_distribution = create_prob_distribution(
    prob_distribution = "pois",
    prob_distribution_params = c(mean = 2)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

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

We set the seed to ensure we have the same output each time the vignette
is rendered. When using {simulist}, setting the seed is not required
unless you need to simulate the same line list multiple times.

``` r
set.seed(1)
```

## Population-wide risks

Simulate a line list with population-wide default risks:

- hospitalisation risk: `0.2`
- death risk in hospitals `0.5`
- death risk outside of hospitals `0.05`

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)

# first 6 rows of linelist
head(linelist)
#>   id              case_name case_type sex age date_onset date_reporting
#> 1  1           Kevin Pullen suspected   m   1 2023-01-01     2023-01-01
#> 2  2 Carisa Flores-Gonzalez confirmed   f  29 2023-01-01     2023-01-01
#> 3  3       Maazin el-Othman confirmed   m  78 2023-01-01     2023-01-01
#> 4  5       Faisal el-Vaziri suspected   m  70 2023-01-01     2023-01-01
#> 5  6           Lynsey Duron confirmed   f  28 2023-01-01     2023-01-01
#> 6  8         Lilibeth Black confirmed   f  61 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1     2023-01-03      died   2023-01-18               <NA>              <NA>
#> 2     2023-01-03      died   2023-02-09         2022-12-30        2023-01-08
#> 3           <NA> recovered         <NA>         2022-12-31        2023-01-05
#> 4     2023-01-04 recovered         <NA>         2022-12-31        2023-01-04
#> 5     2023-01-05 recovered         <NA>         2022-12-29        2023-01-02
#> 6           <NA> recovered         <NA>         2022-12-28        2023-01-05
#>   ct_value
#> 1       NA
#> 2     25.8
#> 3     24.9
#> 4       NA
#> 5     24.5
#> 6     26.4
```

We can run another simulation and change the hospitalisation and death
risks, inside and outside the hospital, still applied to the entire
population. In this scenario the probability of being hospitalised if
infected is higher, but the mortality risk for both hospitalised and
non-hospitalised groups is lower.

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = 0.4,
  hosp_death_risk = 0.2,
  non_hosp_death_risk = 0.01
)

head(linelist)
#>   id          case_name case_type sex age date_onset date_reporting
#> 1  1           Kacy Kim suspected   f  80 2023-01-01     2023-01-01
#> 2  2        Jina Warnes  probable   f  85 2023-01-01     2023-01-01
#> 3  4     Raadi el-Yasin  probable   m  76 2023-01-01     2023-01-01
#> 4  8   Joshua Castaneda confirmed   m  12 2023-01-01     2023-01-01
#> 5 11 Fat'hiyaa al-Zafar suspected   f  50 2023-01-01     2023-01-01
#> 6 14    Matthew Sheldon  probable   m  54 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1     2023-01-04 recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 3           <NA> recovered         <NA>         2022-12-30        2023-01-08
#> 4     2023-01-02      died   2023-01-18         2022-12-27        2023-01-05
#> 5           <NA> recovered         <NA>         2022-12-29        2023-01-01
#> 6     2023-01-03 recovered         <NA>         2022-12-26        2023-01-01
#>   ct_value
#> 1       NA
#> 2       NA
#> 3       NA
#> 4     23.7
#> 5       NA
#> 6       NA
```

## Age-stratified hospitalisation and death risks

To define age-stratified risks, we must create a table (`<data.frame>`)
which contains the lower limits of the age groups and their respective
risks.

In this example the hospitalisation risk will be:

- `0.2` (or 20%) for those aged 80 years or older
- `0.1` (or 10%) for those younger than 5 years
- `0.05` (or 5%) for the remaining age group

The oldest age group stops at the upper age range given in the
`population_age` argument. The default upper age range in 90, so in this
example the oldest age bracket will be 80-90 (inclusive). The minimum
age of each age group is inclusive, and the maximum age of each age
group is exclusive, except the oldest age group which is inclusive of
the minimum and maximum age. In this example the first age group is the
first element of each vector, so the minimum age is 1, maximum age is
four (as the next age group starts at five), and the hospitalisation
risk for that group is 0.1. Each age group forms a row in the table.

``` r
age_dep_hosp_risk <- data.frame(
  age_limit = c(1, 5, 80),
  risk = c(0.1, 0.05, 0.2)
)
age_dep_hosp_risk
#>   age_limit risk
#> 1         1 0.10
#> 2         5 0.05
#> 3        80 0.20
```

``` r
linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = age_dep_hosp_risk
)

head(linelist)
#>   id                   case_name case_type sex age date_onset date_reporting
#> 1  1           Muntaha al-Hallal  probable   f  90 2023-01-01     2023-01-01
#> 2  2                Sheldon Gant confirmed   f  55 2023-01-01     2023-01-01
#> 3  4             Zimiri Mcknight suspected   m  37 2023-01-01     2023-01-01
#> 4  5 Kekoaikaikaokalani Alderman  probable   m  88 2023-01-01     2023-01-01
#> 5  6             Kunita Guerette confirmed   f  56 2023-01-01     2023-01-01
#> 6  7      Alexander Valles Lopez confirmed   m  40 2023-01-02     2023-01-02
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-26        2023-01-03
#> 3           <NA> recovered         <NA>         2022-12-30        2023-01-06
#> 4           <NA> recovered         <NA>         2022-12-28        2023-01-05
#> 5           <NA> recovered         <NA>         2022-12-29        2023-01-02
#> 6           <NA> recovered         <NA>         2022-12-30        2023-01-03
#>   ct_value
#> 1       NA
#> 2     19.0
#> 3       NA
#> 4       NA
#> 5     23.1
#> 6     25.8
```

The minimum age of the youngest age group must match the age range
specified in the `population_age` argument of
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md),
and the largest age limit in the risk `<data.frame>` must not be older
than the upper age range. If these conditions are not met the function
will error.

If the age-stratified risk table does not match the default
(`c(1, 90)`), the `population_age` argument will need to be set to
match.

For example, the default age range of the population is 1 to 90
(inclusive). In our example above, the lowest age group started at 1 and
the oldest age group stopped at 90. This matches the default
`population_age = c(1, 90)`. However, see here that if the lower age
limit exceeds the age range the function will not run.

``` r
age_dep_hosp_risk <- data.frame(
  age_limit = c(1, 5, 95),
  risk = c(0.1, 0.05, 0.2)
)
age_dep_hosp_risk
#>   age_limit risk
#> 1         1 0.10
#> 2         5 0.05
#> 3        95 0.20

linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = age_dep_hosp_risk
)
#> Error in .check_df(hosp_risk, df_type = "risk", age_range = age_range): Lower bound of oldest age group must be lower than highest age range
```

In order to make this code run with the age-stratified hospitalisation
risk given, the `population_age` can be adjusted. Here the oldest age
bracket is now 95 to 100 (`[95, 100]`).

``` r
age_dep_hosp_risk <- data.frame(
  age_limit = c(1, 5, 95),
  risk = c(0.1, 0.05, 0.2)
)

linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = age_dep_hosp_risk,
  population_age = c(1, 100)
)

head(linelist)
#>   id          case_name case_type sex age date_onset date_reporting
#> 1  1      Laura Serrano confirmed   f  28 2023-01-01     2023-01-01
#> 2  2    Haeleigh Schulz confirmed   f  83 2023-01-01     2023-01-01
#> 3  3    Robert Anderson suspected   m  16 2023-01-01     2023-01-01
#> 4  4 Teeoncinea Carlock confirmed   f  36 2023-01-01     2023-01-01
#> 5  5     Mahdi al-Naqvi confirmed   m  94 2023-01-01     2023-01-01
#> 6  7         Lael Pinch confirmed   f  32 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-30        2023-01-04
#> 3           <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 4           <NA> recovered         <NA>         2022-12-29        2023-01-04
#> 5           <NA> recovered         <NA>         2022-12-25        2023-01-06
#> 6           <NA> recovered         <NA>         2022-12-30        2023-01-02
#>   ct_value
#> 1     28.0
#> 2     23.9
#> 3       NA
#> 4     22.6
#> 5     21.5
#> 6     26.3
```

Exactly the same method of age-stratified risks applies to death risks.
First create the `<data.frame>` with the age groups and their
respective, in this case, death risks, and then supply this to either
the `hosp_death_risk` or `non_hosp_death_risk` arguments, to define the
death risks in and outside the hospital, respectively, or both.

Here are a couple of examples:

``` r
age_dep_hosp_death_risk <- data.frame(
  age_limit = c(1, 5, 80),
  risk = c(0.3, 0.1, 0.6)
)
age_dep_hosp_death_risk
#>   age_limit risk
#> 1         1  0.3
#> 2         5  0.1
#> 3        80  0.6

linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_death_risk = age_dep_hosp_death_risk
)
```

``` r
age_dep_non_hosp_death_risk <- data.frame(
  age_limit = c(1, 5, 80),
  risk = c(0.1, 0.05, 0.1)
)
age_dep_non_hosp_death_risk
#>   age_limit risk
#> 1         1 0.10
#> 2         5 0.05
#> 3        80 0.10

linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  non_hosp_death_risk = age_dep_non_hosp_death_risk
)
```

Up until now these age-stratified tables have only been supplied to one
risk. However, these can be supplied in the same simulation. In this
case the hospitalisation risk, and death risks inside and outside of
hospital, are all specified.

``` r
age_dep_hosp_risk <- data.frame(
  age_limit = c(1, 5, 80),
  risk = c(0.1, 0.05, 0.2)
)
age_dep_hosp_death_risk <- data.frame(
  age_limit = c(1, 5, 80),
  risk = c(0.3, 0.1, 0.6)
)
age_dep_non_hosp_death_risk <- data.frame(
  age_limit = c(1, 5, 80),
  risk = c(0.1, 0.05, 0.1)
)

linelist <- sim_linelist(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death,
  hosp_risk = age_dep_hosp_risk,
  hosp_death_risk = age_dep_hosp_death_risk,
  non_hosp_death_risk = age_dep_non_hosp_death_risk
)

head(linelist)
#>   id        case_name case_type sex age date_onset date_reporting
#> 1  1 Mathew Sangalang  probable   m  37 2023-01-01     2023-01-01
#> 2  2         Brian He  probable   m   4 2023-01-01     2023-01-01
#> 3  4    Nyssa Salazar  probable   f  48 2023-01-01     2023-01-01
#> 4  6       Katryna Le suspected   f  69 2023-01-01     2023-01-01
#> 5  7    Jacob Sanford suspected   m  21 2023-01-01     2023-01-01
#> 6  8   Enrique Valdez  probable   m  83 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2           <NA> recovered         <NA>         2022-12-27        2023-01-02
#> 3           <NA> recovered         <NA>         2023-01-01        2023-01-05
#> 4           <NA>      died   2023-02-04         2022-12-29        2023-01-02
#> 5           <NA> recovered         <NA>         2022-12-30        2023-01-03
#> 6           <NA> recovered         <NA>         2022-12-30        2023-01-05
#>   ct_value
#> 1       NA
#> 2       NA
#> 3       NA
#> 4       NA
#> 5       NA
#> 6       NA
```
