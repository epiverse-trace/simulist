# Wrangling simulated outbreak data

The {simulist} R package can generate line list data
([`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)),
contact tracing data
([`sim_contacts()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_contacts.md)),
or both
([`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)).
By default the line list produced by
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
and
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)
contains 12 columns. Some amount of post-simulation data wrangling may
be needed to use the simulated epidemiological case data to certain
applications. This vignette demonstrates some common data wrangling
tasks that may be performed on simulated line list or contact tracing
data.

``` r
library(simulist)
library(epiparameter)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(epicontacts)
```

This vignette provides data wrangling examples using both functions
available in the R language (commonly called “base R”) as well as using
[tidyverse R packages](https://www.tidyverse.org/), which are commonly
applied to data science tasks in R. The tidyverse examples are shown by
default, but select the “Base R” tab to see the equivalent functionality
using base R. There are many other tools for wrangling data in R which
are not covered by this vignette
(e.g. [{data.table}](https://rdatatable.gitlab.io/data.table/)).

See these great resources for more information on general data wrangling
in R:

- [R for Data Science by Hadley Wickham, Mine Çetinkaya-Rundel, and
  Garrett Grolemund](https://r4ds.hadley.nz/)
- [{dplyr} R package](https://dplyr.tidyverse.org/)
- [{tidyr} R package](https://github.com/tidyverse/tidyr)
- [Wrangling data frames chapter in An Introduction to R by Alex
  Douglas, Deon Roos, Francesca Mancini, Ana Couto & David
  Lusseau](https://intro2r.com/wrangling-data-frames.html)

## Simulate an outbreak

To simulate an outbreak we will use the
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)
function from the {simulist} R package.

If you are unfamiliar with the {simulist} package or the
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)
function [Get Started
vignette](https://epiverse-trace.github.io/simulist/dev/articles/simulist.md)
is a great place to start.

First we load in some data that is required for the outbreak simulation.
Data on epidemiological parameters and distributions are read from the
{epiparameter} R package.

``` r
# create contact distribution (not available from {epiparameter} database)
contact_distribution <- epiparameter(
  disease = "COVID-19",
  epi_name = "contact distribution",
  prob_distribution = create_prob_distribution(
    prob_distribution = "pois",
    prob_distribution_params = c(mean = 2)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

# create infectious period (not available from {epiparameter} database)
infectious_period <- epiparameter(
  disease = "COVID-19",
  epi_name = "infectious period",
  prob_distribution = create_prob_distribution(
    prob_distribution = "gamma",
    prob_distribution_params = c(shape = 1, scale = 1)
  )
)
#> Citation cannot be created as author, year, journal or title is missing

# get onset to hospital admission from {epiparameter} database
onset_to_hosp <- epiparameter_db(
  disease = "COVID-19",
  epi_name = "onset to hospitalisation",
  single_epiparameter = TRUE
)
#> Using Linton N, Kobayashi T, Yang Y, Hayashi K, Akhmetzhanov A, Jung S, Yuan
#> B, Kinoshita R, Nishiura H (2020). "Incubation Period and Other
#> Epidemiological Characteristics of 2019 Novel Coronavirus Infections
#> with Right Truncation: A Statistical Analysis of Publicly Available
#> Case Data." _Journal of Clinical Medicine_. doi:10.3390/jcm9020538
#> <https://doi.org/10.3390/jcm9020538>.. 
#> To retrieve the citation use the 'get_citation' function

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

The seed is set to ensure the output of the vignette is consistent. When
using {simulist}, setting the seed is not required unless you need to
simulate the same line list multiple times.

``` r
set.seed(123)
```

``` r
outbreak <- sim_outbreak(
  contact_distribution = contact_distribution,
  infectious_period = infectious_period,
  prob_infection = 0.5,
  onset_to_hosp = onset_to_hosp,
  onset_to_death = onset_to_death
)
linelist <- outbreak$linelist
contacts <- outbreak$contacts
```

## Censoring dates

The date event columns in simulated line lists are stored to double
point precision, meaning they are the exact event times. It is unusual
to not store `<Date>` objects as integers, as explained in
[`?Dates`](https://rdrr.io/r/base/Dates.html), and the
[`print()`](https://rdrr.io/r/base/print.html) function for `<Date>`s
does not show that they may be part way through a day.

Here we show this by printing the date of symptom onset for the
simulated data, and then unclass it to show how it is stored internally.

``` r
linelist$date_onset
#>  [1] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-02"
#>  [6] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01"
#> [11] "2023-01-02" "2023-01-02" "2023-01-02"
unclass(linelist$date_onset)
#>  [1] 19358.00 19358.24 19358.04 19358.38 19359.16 19358.85 19358.14 19358.70
#>  [9] 19358.41 19358.97 19359.40 19359.47 19359.51
```

The
[`censor_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/censor_linelist.md)
function can be used after
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
to censor the event dates to a given precision. Here we show censoring
the dates to daily and weekly intervals. The daily censoring dates will
look that same as before, but the dates will have any value after the
decimal point set to zero. The weekly censored dates will be printed
differently.

``` r
daily_cens_linelist <- censor_linelist(linelist, interval = "daily")
head(daily_cens_linelist)
#>   id                case_name case_type sex age date_onset date_reporting
#> 1  1            Joseph Lovato suspected   m  90 2023-01-01     2023-01-01
#> 2  3         Rayyaan al-Basha  probable   m  71 2023-01-01     2023-01-01
#> 3  4                Tara Yang  probable   f  48 2023-01-01     2023-01-01
#> 4  5           Brianna Madden confirmed   f  77 2023-01-01     2023-01-01
#> 5  6 Miguel Cabral-Hollowhorn suspected   m  83 2023-01-02     2023-01-02
#> 6  7           Matthew Samadh confirmed   m  56 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2     2023-01-08      died   2023-01-10         2022-12-26        2023-01-06
#> 3           <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 4           <NA> recovered         <NA>         2022-12-31        2023-01-08
#> 5           <NA> recovered         <NA>         2022-12-26        2023-01-04
#> 6           <NA> recovered         <NA>         2022-12-28        2023-01-03
#>   ct_value
#> 1       NA
#> 2       NA
#> 3       NA
#> 4     24.1
#> 5       NA
#> 6     26.7

weekly_cens_linelist <- censor_linelist(linelist, interval = "weekly")
head(weekly_cens_linelist)
#>   id                case_name case_type sex age date_onset date_reporting
#> 1  1            Joseph Lovato suspected   m  90   2022-W52       2022-W52
#> 2  3         Rayyaan al-Basha  probable   m  71   2022-W52       2022-W52
#> 3  4                Tara Yang  probable   f  48   2022-W52       2022-W52
#> 4  5           Brianna Madden confirmed   f  77   2022-W52       2022-W52
#> 5  6 Miguel Cabral-Hollowhorn suspected   m  83   2023-W01       2023-W01
#> 6  7           Matthew Samadh confirmed   m  56   2022-W52       2022-W52
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1           <NA> recovered         <NA>               <NA>              <NA>
#> 2       2023-W01      died     2023-W02           2022-W52          2023-W01
#> 3           <NA> recovered         <NA>           2022-W52          2023-W01
#> 4           <NA> recovered         <NA>           2022-W52          2023-W01
#> 5           <NA> recovered         <NA>           2022-W52          2023-W01
#> 6           <NA> recovered         <NA>           2022-W52          2023-W01
#>   ct_value
#> 1       NA
#> 2       NA
#> 3       NA
#> 4     24.1
#> 5       NA
#> 6     26.7
```

See `?censor_linelist()` for more information on how to use this
function.

By using
[`censor_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/censor_linelist.md)
it avoids common mistakes when working with `<Date>` objects. For
example, rounding a date that is over half way through a day will
mistakenly result in the next day. Using
[`censor_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/censor_linelist.md)
avoids this and other common mistakes.

``` r
linelist$date_onset
#>  [1] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-02"
#>  [6] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01"
#> [11] "2023-01-02" "2023-01-02" "2023-01-02"
round(linelist$date_onset)
#>  [1] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-02"
#>  [6] "2023-01-02" "2023-01-01" "2023-01-02" "2023-01-01" "2023-01-02"
#> [11] "2023-01-02" "2023-01-02" "2023-01-03"
daily_cens_linelist$date_onset
#>  [1] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-02"
#>  [6] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01"
#> [11] "2023-01-02" "2023-01-02" "2023-01-02"
```

The censored line list dates can be used with methods that account for
censoring when fitting delay distributions such as
[{primarycensored}](https://primarycensored.epinowcast.org/).

## Under-reporting of cases and contacts

In this section we’ll show how case line lists and contact tracing data
sets can be subset to represent under-reporting, a common feature of
real-world outbreak data, especially in resource-limited settings.

In the line list each case in unlinked (i.e. information on each row is
independent of information on every other row). This means we can remove
rows in the line list without having to augment any remaining rows. We
assume for this example that the probability of being reported, and thus
included in the line list, is independent on case type, sex, age and the
phase of the outbreak.

For this example we’ll assume the case reporting probability in the line
list is 50%.

- Tidyverse
- Base R

``` r
linelist %>%
  filter(as.logical(rbinom(n(), size = 1, prob = 0.5)))
#>   id      case_name case_type sex age date_onset date_reporting date_admission
#> 1  4      Tara Yang  probable   f  48 2023-01-01     2023-01-01           <NA>
#> 2  5 Brianna Madden confirmed   f  77 2023-01-01     2023-01-01           <NA>
#> 3  7 Matthew Samadh confirmed   m  56 2023-01-01     2023-01-01           <NA>
#> 4 10  Brissa Huerta  probable   f   1 2023-01-01     2023-01-01           <NA>
#> 5 14  Jonathan Mace confirmed   m  16 2023-01-01     2023-01-01     2023-01-02
#> 6 16    Hunter Curl suspected   m  54 2023-01-02     2023-01-02     2023-01-05
#> 7 24       Emily Lo confirmed   f  49 2023-01-02     2023-01-02           <NA>
#>     outcome date_outcome date_first_contact date_last_contact ct_value
#> 1 recovered         <NA>         2022-12-30        2023-01-05       NA
#> 2 recovered         <NA>         2022-12-31        2023-01-08     24.1
#> 3 recovered         <NA>         2022-12-28        2023-01-03     26.7
#> 4 recovered         <NA>         2022-12-26        2023-01-02       NA
#> 5 recovered         <NA>         2022-12-30        2023-01-02     24.4
#> 6 recovered         <NA>         2022-12-30        2023-01-05       NA
#> 7 recovered         <NA>         2022-12-28        2023-01-04     29.9
```

``` r
idx <- as.logical(rbinom(n = nrow(linelist), size = 1, prob = 0.5))
linelist[idx, ]
#>    id                case_name case_type sex age date_onset date_reporting
#> 1   1            Joseph Lovato suspected   m  90 2023-01-01     2023-01-01
#> 2   3         Rayyaan al-Basha  probable   m  71 2023-01-01     2023-01-01
#> 5   6 Miguel Cabral-Hollowhorn suspected   m  83 2023-01-02     2023-01-02
#> 6   7           Matthew Samadh confirmed   m  56 2023-01-01     2023-01-01
#> 9  10            Brissa Huerta  probable   f   1 2023-01-01     2023-01-01
#> 10 14            Jonathan Mace confirmed   m  16 2023-01-01     2023-01-01
#> 11 16              Hunter Curl suspected   m  54 2023-01-02     2023-01-02
#> 13 24                 Emily Lo confirmed   f  49 2023-01-02     2023-01-02
#>    date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1            <NA> recovered         <NA>               <NA>              <NA>
#> 2      2023-01-08      died   2023-01-10         2022-12-26        2023-01-06
#> 5            <NA> recovered         <NA>         2022-12-26        2023-01-04
#> 6            <NA> recovered         <NA>         2022-12-28        2023-01-03
#> 9            <NA> recovered         <NA>         2022-12-26        2023-01-02
#> 10     2023-01-02 recovered         <NA>         2022-12-30        2023-01-02
#> 11     2023-01-05 recovered         <NA>         2022-12-30        2023-01-05
#> 13           <NA> recovered         <NA>         2022-12-28        2023-01-04
#>    ct_value
#> 1        NA
#> 2        NA
#> 5        NA
#> 6      26.7
#> 9        NA
#> 10     24.4
#> 11       NA
#> 13     29.9
```

## 

The above example randomly sample rows in the line list using the
reporting probability resulting in different number of cases being kept
each time the code is run. To subset the line list data and get the same
number rows (i.e. cases) returned
[`slice_sample()`](https://dplyr.tidyverse.org/reference/slice.html) can
be used instead.

``` r
linelist %>%
  dplyr::slice_sample(prop = 0.5) %>%
  dplyr::arrange(id)
#>   id        case_name case_type sex age date_onset date_reporting
#> 1  3 Rayyaan al-Basha  probable   m  71 2023-01-01     2023-01-01
#> 2  4        Tara Yang  probable   f  48 2023-01-01     2023-01-01
#> 3  5   Brianna Madden confirmed   f  77 2023-01-01     2023-01-01
#> 4  8       Sara Salas confirmed   f  39 2023-01-01     2023-01-01
#> 5 10    Brissa Huerta  probable   f   1 2023-01-01     2023-01-01
#> 6 14    Jonathan Mace confirmed   m  16 2023-01-01     2023-01-01
#>   date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1     2023-01-08      died   2023-01-10         2022-12-26        2023-01-06
#> 2           <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 3           <NA> recovered         <NA>         2022-12-31        2023-01-08
#> 4           <NA> recovered         <NA>         2022-12-31        2023-01-03
#> 5           <NA> recovered         <NA>         2022-12-26        2023-01-02
#> 6     2023-01-02 recovered         <NA>         2022-12-30        2023-01-02
#>   ct_value
#> 1       NA
#> 2       NA
#> 3     24.1
#> 4     26.9
#> 5       NA
#> 6     24.4
```

[`slice_sample()`](https://dplyr.tidyverse.org/reference/slice.html) can
reorder rows so we order by ID to keep the cases in order of symptom
onset date.

On to under-reporting in contact tracing data. Unlike line list data,
contact tracing data is linked. The direction of contact and possibly
transmission is recorded in the `$from` and `$to` columns.

For this example we will assume that the contact tracing under-reporting
is applicable to infections and contacts that were not infected.
However, the same method could be applied for under-reporting of the
transmission chain by first subsetting to infections only (see
`vis-linelist.Rmd` vignette for example).

We plot the full contact network so it can be compared to the contact
networks with under-reporting plotted below.

``` r
epicontacts <- make_epicontacts(
  linelist = linelist,
  contacts = contacts,
  id = "case_name",
  from = "from",
  to = "to",
  directed = TRUE
)
plot(epicontacts)
```

First we randomly sample who is not reported in the outbreak data. For
this example we assume the pool of people that can be unreported is
everyone in the contact network (infections and contacts), and assume a
50% reporting probability.

``` r
all_contacts <- unique(c(contacts$from, contacts$to))
not_reported <- sample(x = all_contacts, size = 0.5 * length(all_contacts))
not_reported
#>  [1] "Mitchell Noriega" "Krista Walborn"   "Sara Salas"       "Emily Lo"        
#>  [5] "Brianna Madden"   "Trent Herrera"    "Alexandra Martin" "Rayyaan al-Basha"
#>  [9] "Cameron Conahan"  "Cody Johnson III" "Matthew Verano"   "Joseph Lovato"   
#> [13] "Brittany Witcher"
```

Next we subset the contact tracing data by removing infectees if that
are not reported. Because the contact tracing data is linked across
rows, we also need to set any unreported infectees to `NA` for any
secondary infections they cause.

``` r
# make copy of contact tracing data for under-reporting
contacts_ur <- contacts
for (person in not_reported) {
  contacts_ur <- contacts_ur[contacts_ur$to != person, ]
  contacts_ur[contacts_ur$from %in% person, "from"] <- NA
}
head(contacts_ur)
#>                        from                       to age sex date_first_contact
#> 1                      <NA>           Carly Gallegos   9   f         2022-12-31
#> 3                      <NA>                Tara Yang  48   f         2022-12-30
#> 5                      <NA> Miguel Cabral-Hollowhorn  83   m         2022-12-26
#> 6                      <NA>           Matthew Samadh  56   m         2022-12-28
#> 9                      <NA>            Brissa Huerta   1   f         2022-12-26
#> 10 Miguel Cabral-Hollowhorn           Manuel Hartman  40   m         2022-12-30
#>    date_last_contact was_case           status
#> 1         2023-01-05    FALSE lost_to_followup
#> 3         2023-01-05     TRUE             case
#> 5         2023-01-04     TRUE             case
#> 6         2023-01-03     TRUE             case
#> 9         2023-01-02     TRUE             case
#> 10        2023-01-07    FALSE lost_to_followup
```

We can plot this new contact network with {epicontacts}. We’ll need to
subset the line list to have the same unreported cases.

``` r
linelist_ur <- linelist[!linelist$case_name %in% not_reported, ]
epicontacts <- make_epicontacts(
  linelist = linelist_ur,
  contacts = contacts_ur,
  id = "case_name",
  from = "from",
  to = "to",
  directed = TRUE
)
plot(epicontacts)
```

The above example can be thought of as resulting from incomplete
recording or recall of contacts. A second method for under-reporting of
contact tracing data is to assume that if a case is unreported then all
of the cases and contacts stemming from the unreported case are lost.

For this example we’ll sample a single individual not to report and then
prune all cases and contacts from that individual in the network.

``` r
all_contacts <- unique(c(contacts$from, contacts$to))
not_reported <- sample(x = all_contacts, size = 1)
not_reported
#> [1] "Matthew Verano"
```

Then we can recursively pruned all cases and contacts that are the
result from this individual (this can be zero if the person had no
secondary cases or contacts).

``` r
# make copy of contact tracing data for under-reporting
contacts_ur <- contacts
while (length(not_reported) > 0) {
  contacts_ur <- contacts_ur[!contacts_ur$to %in% not_reported, ]
  not_reported_ <- contacts_ur$to[contacts_ur$from %in% not_reported]
  contacts_ur <- contacts_ur[!contacts_ur$from %in% not_reported, ]
  not_reported <- not_reported_
}
head(contacts_ur)
#>               from                       to age sex date_first_contact
#> 1    Joseph Lovato           Carly Gallegos   9   f         2022-12-31
#> 2    Joseph Lovato         Rayyaan al-Basha  71   m         2022-12-26
#> 3    Joseph Lovato                Tara Yang  48   f         2022-12-30
#> 4    Joseph Lovato           Brianna Madden  77   f         2022-12-31
#> 5 Rayyaan al-Basha Miguel Cabral-Hollowhorn  83   m         2022-12-26
#> 6 Rayyaan al-Basha           Matthew Samadh  56   m         2022-12-28
#>   date_last_contact was_case           status
#> 1        2023-01-05    FALSE lost_to_followup
#> 2        2023-01-06     TRUE             case
#> 3        2023-01-05     TRUE             case
#> 4        2023-01-08     TRUE             case
#> 5        2023-01-04     TRUE             case
#> 6        2023-01-03     TRUE             case
```

Just as above we can plot the new contact network using {epicontacts}.

``` r
# subset line list to match under-reporting in contact tracing data
linelist_ur <- linelist[linelist$case_name %in% unique(contacts$from), ]

epicontacts <- make_epicontacts(
  linelist = linelist_ur,
  contacts = contacts_ur,
  id = "case_name",
  from = "from",
  to = "to",
  directed = TRUE
)
plot(epicontacts)
```

There are more complex under-reporting depending on covariates in the
line list and contact tracing data such as `$case_type` in the line
list, with suspected cases most likely to go unreported, or `$status` in
the contact tracing data, with `unknown` or `lost_to_followup` more
likely to be under-reported.

## Removing a line list column

Not every column in the simulated line list may be required for the use
case at hand. In this example we will remove the `$ct_value` column. For
instance, if we wanted to simulate an outbreak for which no laboratory
testing (e.g Polymerase chain reaction, PCR, testing) was available and
thus a Cycle threshold (Ct) value would not be known for confirmed
cases.

- Tidyverse
- Base R

``` r
# remove column by name
linelist %>%
  select(!ct_value)
#>    id                case_name case_type sex age date_onset date_reporting
#> 1   1            Joseph Lovato suspected   m  90 2023-01-01     2023-01-01
#> 2   3         Rayyaan al-Basha  probable   m  71 2023-01-01     2023-01-01
#> 3   4                Tara Yang  probable   f  48 2023-01-01     2023-01-01
#> 4   5           Brianna Madden confirmed   f  77 2023-01-01     2023-01-01
#> 5   6 Miguel Cabral-Hollowhorn suspected   m  83 2023-01-02     2023-01-02
#> 6   7           Matthew Samadh confirmed   m  56 2023-01-01     2023-01-01
#> 7   8               Sara Salas confirmed   f  39 2023-01-01     2023-01-01
#> 8   9           Krista Walborn suspected   f  68 2023-01-01     2023-01-01
#> 9  10            Brissa Huerta  probable   f   1 2023-01-01     2023-01-01
#> 10 14            Jonathan Mace confirmed   m  16 2023-01-01     2023-01-01
#> 11 16              Hunter Curl suspected   m  54 2023-01-02     2023-01-02
#> 12 21         Cody Johnson III confirmed   m  36 2023-01-02     2023-01-02
#> 13 24                 Emily Lo confirmed   f  49 2023-01-02     2023-01-02
#>    date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1            <NA> recovered         <NA>               <NA>              <NA>
#> 2      2023-01-08      died   2023-01-10         2022-12-26        2023-01-06
#> 3            <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 4            <NA> recovered         <NA>         2022-12-31        2023-01-08
#> 5            <NA> recovered         <NA>         2022-12-26        2023-01-04
#> 6            <NA> recovered         <NA>         2022-12-28        2023-01-03
#> 7            <NA> recovered         <NA>         2022-12-31        2023-01-03
#> 8            <NA> recovered         <NA>         2022-12-29        2023-01-01
#> 9            <NA> recovered         <NA>         2022-12-26        2023-01-02
#> 10     2023-01-02 recovered         <NA>         2022-12-30        2023-01-02
#> 11     2023-01-05 recovered         <NA>         2022-12-30        2023-01-05
#> 12           <NA> recovered         <NA>         2023-01-01        2023-01-03
#> 13           <NA> recovered         <NA>         2022-12-28        2023-01-04
```

``` r
# remove column by numeric column indexing
# ct_value is column 12 (the last column)
linelist[, -12]
#>    id                case_name case_type sex age date_onset date_reporting
#> 1   1            Joseph Lovato suspected   m  90 2023-01-01     2023-01-01
#> 2   3         Rayyaan al-Basha  probable   m  71 2023-01-01     2023-01-01
#> 3   4                Tara Yang  probable   f  48 2023-01-01     2023-01-01
#> 4   5           Brianna Madden confirmed   f  77 2023-01-01     2023-01-01
#> 5   6 Miguel Cabral-Hollowhorn suspected   m  83 2023-01-02     2023-01-02
#> 6   7           Matthew Samadh confirmed   m  56 2023-01-01     2023-01-01
#> 7   8               Sara Salas confirmed   f  39 2023-01-01     2023-01-01
#> 8   9           Krista Walborn suspected   f  68 2023-01-01     2023-01-01
#> 9  10            Brissa Huerta  probable   f   1 2023-01-01     2023-01-01
#> 10 14            Jonathan Mace confirmed   m  16 2023-01-01     2023-01-01
#> 11 16              Hunter Curl suspected   m  54 2023-01-02     2023-01-02
#> 12 21         Cody Johnson III confirmed   m  36 2023-01-02     2023-01-02
#> 13 24                 Emily Lo confirmed   f  49 2023-01-02     2023-01-02
#>    date_admission   outcome date_outcome date_first_contact ct_value
#> 1            <NA> recovered         <NA>               <NA>       NA
#> 2      2023-01-08      died   2023-01-10         2022-12-26       NA
#> 3            <NA> recovered         <NA>         2022-12-30       NA
#> 4            <NA> recovered         <NA>         2022-12-31     24.1
#> 5            <NA> recovered         <NA>         2022-12-26       NA
#> 6            <NA> recovered         <NA>         2022-12-28     26.7
#> 7            <NA> recovered         <NA>         2022-12-31     26.9
#> 8            <NA> recovered         <NA>         2022-12-29       NA
#> 9            <NA> recovered         <NA>         2022-12-26       NA
#> 10     2023-01-02 recovered         <NA>         2022-12-30     24.4
#> 11     2023-01-05 recovered         <NA>         2022-12-30       NA
#> 12           <NA> recovered         <NA>         2023-01-01     22.4
#> 13           <NA> recovered         <NA>         2022-12-28     29.9

# remove column by column name
linelist[, colnames(linelist) != "ct_value"]
#>    id                case_name case_type sex age date_onset date_reporting
#> 1   1            Joseph Lovato suspected   m  90 2023-01-01     2023-01-01
#> 2   3         Rayyaan al-Basha  probable   m  71 2023-01-01     2023-01-01
#> 3   4                Tara Yang  probable   f  48 2023-01-01     2023-01-01
#> 4   5           Brianna Madden confirmed   f  77 2023-01-01     2023-01-01
#> 5   6 Miguel Cabral-Hollowhorn suspected   m  83 2023-01-02     2023-01-02
#> 6   7           Matthew Samadh confirmed   m  56 2023-01-01     2023-01-01
#> 7   8               Sara Salas confirmed   f  39 2023-01-01     2023-01-01
#> 8   9           Krista Walborn suspected   f  68 2023-01-01     2023-01-01
#> 9  10            Brissa Huerta  probable   f   1 2023-01-01     2023-01-01
#> 10 14            Jonathan Mace confirmed   m  16 2023-01-01     2023-01-01
#> 11 16              Hunter Curl suspected   m  54 2023-01-02     2023-01-02
#> 12 21         Cody Johnson III confirmed   m  36 2023-01-02     2023-01-02
#> 13 24                 Emily Lo confirmed   f  49 2023-01-02     2023-01-02
#>    date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1            <NA> recovered         <NA>               <NA>              <NA>
#> 2      2023-01-08      died   2023-01-10         2022-12-26        2023-01-06
#> 3            <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 4            <NA> recovered         <NA>         2022-12-31        2023-01-08
#> 5            <NA> recovered         <NA>         2022-12-26        2023-01-04
#> 6            <NA> recovered         <NA>         2022-12-28        2023-01-03
#> 7            <NA> recovered         <NA>         2022-12-31        2023-01-03
#> 8            <NA> recovered         <NA>         2022-12-29        2023-01-01
#> 9            <NA> recovered         <NA>         2022-12-26        2023-01-02
#> 10     2023-01-02 recovered         <NA>         2022-12-30        2023-01-02
#> 11     2023-01-05 recovered         <NA>         2022-12-30        2023-01-05
#> 12           <NA> recovered         <NA>         2023-01-01        2023-01-03
#> 13           <NA> recovered         <NA>         2022-12-28        2023-01-04

# remove column by assigning it to NULL
linelist$ct_value <- NULL
linelist
#>    id                case_name case_type sex age date_onset date_reporting
#> 1   1            Joseph Lovato suspected   m  90 2023-01-01     2023-01-01
#> 2   3         Rayyaan al-Basha  probable   m  71 2023-01-01     2023-01-01
#> 3   4                Tara Yang  probable   f  48 2023-01-01     2023-01-01
#> 4   5           Brianna Madden confirmed   f  77 2023-01-01     2023-01-01
#> 5   6 Miguel Cabral-Hollowhorn suspected   m  83 2023-01-02     2023-01-02
#> 6   7           Matthew Samadh confirmed   m  56 2023-01-01     2023-01-01
#> 7   8               Sara Salas confirmed   f  39 2023-01-01     2023-01-01
#> 8   9           Krista Walborn suspected   f  68 2023-01-01     2023-01-01
#> 9  10            Brissa Huerta  probable   f   1 2023-01-01     2023-01-01
#> 10 14            Jonathan Mace confirmed   m  16 2023-01-01     2023-01-01
#> 11 16              Hunter Curl suspected   m  54 2023-01-02     2023-01-02
#> 12 21         Cody Johnson III confirmed   m  36 2023-01-02     2023-01-02
#> 13 24                 Emily Lo confirmed   f  49 2023-01-02     2023-01-02
#>    date_admission   outcome date_outcome date_first_contact date_last_contact
#> 1            <NA> recovered         <NA>               <NA>              <NA>
#> 2      2023-01-08      died   2023-01-10         2022-12-26        2023-01-06
#> 3            <NA> recovered         <NA>         2022-12-30        2023-01-05
#> 4            <NA> recovered         <NA>         2022-12-31        2023-01-08
#> 5            <NA> recovered         <NA>         2022-12-26        2023-01-04
#> 6            <NA> recovered         <NA>         2022-12-28        2023-01-03
#> 7            <NA> recovered         <NA>         2022-12-31        2023-01-03
#> 8            <NA> recovered         <NA>         2022-12-29        2023-01-01
#> 9            <NA> recovered         <NA>         2022-12-26        2023-01-02
#> 10     2023-01-02 recovered         <NA>         2022-12-30        2023-01-02
#> 11     2023-01-05 recovered         <NA>         2022-12-30        2023-01-05
#> 12           <NA> recovered         <NA>         2023-01-01        2023-01-03
#> 13           <NA> recovered         <NA>         2022-12-28        2023-01-04
```

## 
