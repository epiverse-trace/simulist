# Changelog

## simulist 0.7.1

- Minor fixes to *simulist* JOSS paper for publication.

## simulist 0.7.0

CRAN release: 2026-02-06

This minor version release contains a range of minor updates and
accompanies the *simulist* publication in the [Journal of Open Source
Software (JOSS)](https://joss.theoj.org/).

### New features

- The sampling of sex for line list and contacts data can now be
  weighted instead of assuming a uniform probability via `prob_male` in
  `config`
  ([\#255](https://github.com/epiverse-trace/simulist/issues/255)).

- The `reporting_delay` argument in
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  now supports `<epiparameter>` objects, matching the functionality of
  the other delay distribution arguments
  ([\#262](https://github.com/epiverse-trace/simulist/issues/262)).

- A new line list events plot has been added to the `vis-linelist.Rmd`
  vignette
  ([\#278](https://github.com/epiverse-trace/simulist/issues/278)).

### Breaking changes

- None

### Minor changes

- Added `dependabot`
  ([\#258](https://github.com/epiverse-trace/simulist/issues/258)).

- GitHub actions versions are updated (multiple PRs).

- `.lintr` is updated to include more linters
  ([\#279](https://github.com/epiverse-trace/simulist/issues/279)) and
  the `# nolint` flag syntax is fixed
  ([\#263](https://github.com/epiverse-trace/simulist/issues/263)).

### Bug fixes

- None

### Deprecated and defunct

- None

## simulist 0.6.0

CRAN release: 2025-08-28

In this minor version release we have continued to make a range of
improvements across the package. A new line list post-processing
function,
[`censor_linelist()`](https://epiverse-trace.github.io/simulist/reference/censor_linelist.md),
makes it easy to group dates into various intervals,
[`messy_linelist()`](https://epiverse-trace.github.io/simulist/reference/messy_linelist.md)
introduced in v0.5.0 is enhanced, and the package documentation is
expanded to cover under-reporting in outbreak data and censoring dates.
There are also a couple of minor bug fixes.

The development status of the package is updated to *stable* from
*experimental* to reflect the long term stability and low probability of
major changes.

### New features

- A new
  [`censor_linelist()`](https://epiverse-trace.github.io/simulist/reference/censor_linelist.md)
  function is added to the package. This is a new post-processing
  function for line list data to censor `<Date>` to daily, weekly and
  other user-defined time periods. The
  [`censor_linelist()`](https://epiverse-trace.github.io/simulist/reference/censor_linelist.md)
  also has a weekend-effect option to replicate the low reporting over
  weekends. This new feature also adds the {grates} package as a
  dependency
  ([\#240](https://github.com/epiverse-trace/simulist/issues/240)).

- [`messy_linelist()`](https://epiverse-trace.github.io/simulist/reference/messy_linelist.md)
  can now accept a vector with multiple `missing_value`s to allow
  different values to represent missing data
  ([\#241](https://github.com/epiverse-trace/simulist/issues/241)).

- A demonstration of how to replicate under-reporting of line list and
  contact tracing data is added to the `wrangling-linelist.Rmd`
  vignette. The demo contains examples for multiple types of
  under-reporting data found in real-world outbreaks
  ([\#244](https://github.com/epiverse-trace/simulist/issues/244)).

### Breaking changes

- The `$was_case` column in contact tracing data simulated by
  [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  now contains `logical` boolean values instead of `"Y"` and `"N"`
  `character` strings
  ([\#243](https://github.com/epiverse-trace/simulist/issues/243)).

- The minimum R version required by the package is incremented to v4.2.0
  due to a recursive dependency on {fastymd}
  ([\#235](https://github.com/epiverse-trace/simulist/issues/235)).

### Minor changes

- Documentation on censoring dates is added to `wrangling-linelist.Rmd`
  ([\#240](https://github.com/epiverse-trace/simulist/issues/240)).

- Documentation on interoperability between {simulist} and {incidence2}
  for double precision `<Date>`s and warning for not specifying
  `interval` in
  [`incidence2::incidence()`](https://rdrr.io/pkg/incidence2/man/incidence.html)
  is added to `vis-linelist.Rmd`
  ([\#232](https://github.com/epiverse-trace/simulist/issues/232)).

- The lifecycle of the package has been updated from *experimental* to
  *stable*
  ([\#229](https://github.com/epiverse-trace/simulist/issues/229)).

- `@return` function documentation for exported functions is improved
  ([\#235](https://github.com/epiverse-trace/simulist/issues/235)).

### Bug fixes

- [`truncate_linelist()`](https://epiverse-trace.github.io/simulist/reference/truncate_linelist.md)
  sets `$outcome` to `NA` if they are more recent than truncation time.
  This matches the way `$date_outcome` was handled in
  [`truncate_linelist()`](https://epiverse-trace.github.io/simulist/reference/truncate_linelist.md)
  in v0.5.0
  ([\#228](https://github.com/epiverse-trace/simulist/issues/228)).

- Alt-text in vignettes is fixed to render correctly on pkgdown website
  ([\#230](https://github.com/epiverse-trace/simulist/issues/230)).

### Deprecated and defunct

- None

## simulist 0.5.0

CRAN release: 2025-03-25

This minor version release expands the scope of *simulist* to include
two new post-processing functions:
[`truncate_linelist()`](https://epiverse-trace.github.io/simulist/reference/truncate_linelist.md)
and
[`messy_linelist()`](https://epiverse-trace.github.io/simulist/reference/messy_linelist.md).
Both of these functions modify a line list `<data.frame>` from
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
or
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md),
the line list now also includes a `$date_reporting` column.

This release has also focused on making the package interface more
consistent and contains bugs fixes.

### New features

#### External

- The
  [`messy_linelist()`](https://epiverse-trace.github.io/simulist/reference/messy_linelist.md)
  function is added. This takes a simulated line list and creates a
  *“messy”* line list with inconsistencies, irregularities and
  missingness found in empirical outbreak data
  ([\#187](https://github.com/epiverse-trace/simulist/issues/187) &
  [\#196](https://github.com/epiverse-trace/simulist/issues/196) &
  [\#199](https://github.com/epiverse-trace/simulist/issues/199))

- A reporting delay argument (`reporting_delay`) is now included in
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  to simulate reporting delays from the date of symptom onset
  (`$date_onset`) to date of reporting (`$date_reporting`)
  ([\#179](https://github.com/epiverse-trace/simulist/issues/179)).

- The
  [`truncate_linelist()`](https://epiverse-trace.github.io/simulist/reference/truncate_linelist.md)
  function is added. This takes a simulated line list and can create
  outbreak snapshots and right-truncation of real-time outbreak data
  ([\#179](https://github.com/epiverse-trace/simulist/issues/179) &
  [\#193](https://github.com/epiverse-trace/simulist/issues/193) &
  [\#201](https://github.com/epiverse-trace/simulist/issues/201) &
  [\#211](https://github.com/epiverse-trace/simulist/issues/211)).

- A new vignette, `reporting_delays-truncation.Rmd`, on reporting delays
  and right-truncation for line list data has been added
  ([\#179](https://github.com/epiverse-trace/simulist/issues/179) &
  [\#201](https://github.com/epiverse-trace/simulist/issues/201)).

- Alt text is added to all vignette figures
  ([\#214](https://github.com/epiverse-trace/simulist/issues/214)).

#### Internal

- `{english}` is added as a package dependency for
  [`messy_linelist()`](https://epiverse-trace.github.io/simulist/reference/messy_linelist.md)
  ([\#187](https://github.com/epiverse-trace/simulist/issues/187)).

- R CMD check CI is now run on R v4.1, the minimum required R version
  for the package
  ([\#180](https://github.com/epiverse-trace/simulist/issues/180)).

- [epiparameter](https://github.com/epiverse-trace/epiparameter/) is no
  longer used in testing
  ([\#177](https://github.com/epiverse-trace/simulist/issues/177)).

- [`.check_linelist()`](https://epiverse-trace.github.io/simulist/reference/dot-check_linelist.md)
  is added for input checking in post-processing functions
  ([\#179](https://github.com/epiverse-trace/simulist/issues/179)).

- `.check_age_df()` and `.check_risk_df()` have been merged into
  [`.check_df()`](https://epiverse-trace.github.io/simulist/reference/dot-check_df.md)
  thanks to the standardisation of the structure of `<data.frame>`
  objects required by `sim_*()` function arguments
  ([\#200](https://github.com/epiverse-trace/simulist/issues/200)).

### Breaking changes

- [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md)
  has been updated to accepted `function`s instead of a distribution
  name and a vector of parameters. This now matches the design of
  arguments that accept a `function` in `sim_*()` functions
  ([\#202](https://github.com/epiverse-trace/simulist/issues/202)).

- The structure of the age-structured population `<data.frame>` input
  into `sim_*()` functions has been standardised with the age-stratified
  risk `<data.frame>`s by using an `$age_limit` column instead of an
  `$age_range` `character` column
  ([\#200](https://github.com/epiverse-trace/simulist/issues/200)).

- The line list `<data.frame>` output by
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  now contains a `$date_reporting` column
  ([\#179](https://github.com/epiverse-trace/simulist/issues/179)).

- Outcome date (`$date_outcome`) is now conditioned to be after
  hospitalisation date (`$date_admission`) using the new internal
  [`.sample_outcome_time()`](https://epiverse-trace.github.io/simulist/reference/dot-sample_outcome_time.md)
  function. This is a breaking change as previously hospitalisation
  times could be before outcome times,
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  can now through an error if an outcome time cannot be sampled to be
  after the hospitalisation time
  ([\#178](https://github.com/epiverse-trace/simulist/issues/178)).

- The date of first contact is now sampled as the number of days before
  infection time (equal to symptom onset in the model) rather than days
  before date of last contact, as this could lead to the infection time
  before the first contact
  ([\#206](https://github.com/epiverse-trace/simulist/issues/206)).

- The minimum required R version for *simulist* is increased to v4.1.0
  from v3.6.0 due to package dependencies
  ([\#180](https://github.com/epiverse-trace/simulist/issues/180)).

- The minimum required version of
  [incidence2](https://www.reconverse.org/incidence2/) (suggested
  dependency) is now v2.3.0
  ([\#214](https://github.com/epiverse-trace/simulist/issues/214)).

### Minor changes

- Explicitly state function output breaking changes policy in
  `design-principles.Rmd` vignette
  ([\#208](https://github.com/epiverse-trace/simulist/issues/208)).

### Bug fixes

- Date of symptom onset can no longer occur before date of first contact
  ([\#206](https://github.com/epiverse-trace/simulist/issues/206)).

- Outcome date can no longer occur before hospitalisation date
  ([\#178](https://github.com/epiverse-trace/simulist/issues/178)).

### Deprecated and defunct

- None

## simulist 0.4.0

CRAN release: 2025-01-10

A minor version release of *simulist* containing various minor
improvements to the functions and documentation, as well as removing
some triggers for warning users. There are also a few bug fixes and
internal enhancements.

### New features

#### External

- Defaults have been added to all `sim_*()` arguments that previously
  did not have one. Allowing functions to be run without specifying any
  arguments (e.g. `linelist <- sim_linelist()`)
  ([\#149](https://github.com/epiverse-trace/simulist/issues/149)).
- Documentation for `sim_*()` function arguments that accept either a
  `function` or an `<epiparameter>` object has been improved
  ([\#149](https://github.com/epiverse-trace/simulist/issues/149)).
- `sim_*()` functions no longer warn if the user has not specified
  `*_risk` arguments and have set `onset_to_*` arguments to `NULL`
  ([\#149](https://github.com/epiverse-trace/simulist/issues/149)).
- All vignettes now use
  [`rmarkdown::html_vignette`](https://pkgs.rstudio.com/rmarkdown/reference/html_vignette.html)
  for to correctly render the website and for maximum compatibility with
  [pkgdown](https://pkgdown.r-lib.org/) \>= 2.1.0. This removes figure
  numbering and code folding
  ([\#153](https://github.com/epiverse-trace/simulist/issues/153)).

#### Internal

- [`.add_hospitalisation()`](https://epiverse-trace.github.io/simulist/reference/dot-add_cols.md)
  has been vectorised following
  [`.add_outcome()`](https://epiverse-trace.github.io/simulist/reference/dot-add_cols.md)
  in PR [\#101](https://github.com/epiverse-trace/simulist/issues/101)
  ([\#150](https://github.com/epiverse-trace/simulist/issues/150)).

### Breaking changes

- The function arguments `infect_period` and `prob_infect` have been
  renamed `infectious_period` and `prob_infection`
  ([\#143](https://github.com/epiverse-trace/simulist/issues/143)).
- `sim_*()` functions now use `NULL` instead of `NA` to turn off
  processes (e.g. `onset_to_death = NULL` for no deaths)
  ([\#148](https://github.com/epiverse-trace/simulist/issues/148)).

### Bug fixes

- A new function, `.sample_infect_period()` is added that errors if the
  infectious period function generates a negative number
  ([\#142](https://github.com/epiverse-trace/simulist/issues/142)).
- [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  no longer errors when `hosp_death_risk` is `NULL` and `onset_to_death`
  is parameterised as a delay distribution
  ([\#144](https://github.com/epiverse-trace/simulist/issues/144)).
- [`.add_ct()`](https://epiverse-trace.github.io/simulist/reference/dot-add_cols.md)
  generates the correct number of values and does not duplicate Ct
  values due to vector recycling
  ([\#158](https://github.com/epiverse-trace/simulist/issues/158)).
- Update [epiparameter](https://github.com/epiverse-trace/epiparameter/)
  usage
  ([\#159](https://github.com/epiverse-trace/simulist/issues/159)).

### Deprecated and defunct

- None

## simulist 0.3.0

The third release of the *simulist* R package contains a range of new
features, enhancements, documentation and unit tests.

The headline changes to the package are:

- The simulation is now parameterised with an infectious period rather
  than a contact interval.
- Line list data now has `date_outcome` and `outcome` columns which can
  be parameterised with `onset_to_death` and `onset_to_recovery`.
- Case fatality risk can vary through time with a customisable
  user-defined function.
- Two new vignettes on time-varying case fatality risk, and wrangling
  line list and contact tracing data.

### New features

#### External

- `onset_to_hosp` and `onset_to_death` arguments can now take `NA` as
  input and will return a column of `NA`s in the line list columns
  `date_admission` and `date_outcome`
  ([\#98](https://github.com/epiverse-trace/simulist/issues/98)).

- An `onset_to_recovery` argument has been added to the simulation
  functions,
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md),
  and so the recovery date can be explicitly given in the line list data
  ([\#99](https://github.com/epiverse-trace/simulist/issues/99)).

- The line list simulation can now use a time-varying case fatality
  risk. The
  [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md)
  function now returns a `$time_varying_death_risk` list element, which
  is `NULL` by default but can take an R function to enable the fatality
  risk of cases to change over the epidemic
  ([\#101](https://github.com/epiverse-trace/simulist/issues/101)).

- A new vignette, `time-varying-cfr.Rmd`, has been added to the package
  to describe how to use the time-varying case fatality risk
  functionality and describe a few different time-varying functions that
  can be used
  ([\#101](https://github.com/epiverse-trace/simulist/issues/101)).

- A new vignette, `wrangling-linelist.Rmd`, has been added to go over
  some of the common post-processing steps that might be required after
  simulating line list or contact tracing data. This vignette is short
  and currently only contains a single post-processing example, more
  examples will be added over time
  ([\#104](https://github.com/epiverse-trace/simulist/issues/104)).

- The `README` now has a section on related projects to provide an
  overview of packages that simulate line list data, or are related to
  *simulist*. This section contains a disclosure widget containing a
  feature table providing a high-level description of the features and
  development status of each related package
  ([\#110](https://github.com/epiverse-trace/simulist/issues/110)).

- A Key features section and Complimentary R packages section has been
  added to the `README`
  ([\#134](https://github.com/epiverse-trace/simulist/issues/134)).

- Updated package architecture diagram in the `design-principles.Rmd`
  vignette
  ([\#113](https://github.com/epiverse-trace/simulist/issues/113)).

#### Internal

- The `.add_deaths()` function has been replaced by the
  [`.add_outcome()`](https://epiverse-trace.github.io/simulist/reference/dot-add_cols.md)
  function which can simulate death and recovery times
  ([\#99](https://github.com/epiverse-trace/simulist/issues/99)).

- [`.cross_check_sim_input()`](https://epiverse-trace.github.io/simulist/reference/dot-cross_check_sim_input.md)
  function has been added to the package to ensure user input is
  coherent across arguments
  ([\#98](https://github.com/epiverse-trace/simulist/issues/98)).

- [`.anonymise()`](https://epiverse-trace.github.io/simulist/reference/dot-anonymise.md)
  function has been added to convert individual’s names into
  alphanumeric codes to anonymise individuals in line list and contact
  tracing data
  ([\#106](https://github.com/epiverse-trace/simulist/issues/106)).

### Breaking changes

- The simulation functions are now parameterised with an infectious
  period (`infect_period` argument) instead of a contact interval
  (`contact_interval` argument). This moves away from parameterising the
  simulation with the time delay between a person becoming infected and
  having contact with a susceptible individual, and instead uses an
  infectious period distribution within which contacts are uniformly
  distributed in time
  ([\#96](https://github.com/epiverse-trace/simulist/issues/96)).

- The simulation functions can now set a maximum as well as a minimum
  outbreak size. The `min_outbreak_size` argument in the exported
  `sim_*()` functions has been renamed `outbreak_size` and takes a
  `numeric` vector of two elements, the minimum and maximum outbreak
  size. The maximum outbreak size is a soft limit due to the stochastic
  nature of the branching process model, so epidemiological data
  returned can contain more cases and/or contacts that the maximum in
  `outbreak_size` but in these case a warning is returned explaining to
  the user how many cases/contacts are being returned
  ([\#93](https://github.com/epiverse-trace/simulist/issues/93)).

- The `add_ct` argument in
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  has been removed. The functionality is now equivalent to
  `add_ct = TRUE` in the previous *simulist* version. The `add_ct`
  argument was removed to move the package to always returning
  `<data.frame>`s with the same number of columns, for consistency and
  predictability
  ([\#104](https://github.com/epiverse-trace/simulist/issues/104)).

- The `add_names` argument in the simulation functions has been renamed
  to `anonymise`. The new argument controls whether names are given to
  each case (`anonymise = FALSE`, default behaviour) or whether fixed
  length hexadecimal codes are given to each case (`anonymise = TRUE`),
  this ensures the returned `<data.frame>` has the same number of
  columns
  ([\#106](https://github.com/epiverse-trace/simulist/issues/106)).

### Bug fixes

- [`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/reference/dot-sim_network_bp.md)
  now indexes the time vector correctly. Previously a vector indexing
  bug meant the epidemic would not progress through time
  ([\#95](https://github.com/epiverse-trace/simulist/issues/95)).

### Deprecated and defunct

- None

## simulist 0.2.0

Second release of *simulist*, updates the core simulation model and, as
a result, the arguments for `sim_*()` functions for simulating line list
data and/or contact table data exported from *simulist* are updated. The
internal package architecture is also refactored.

### New features

#### External

- [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md)
  now returns a new element in the list: `$network`. By default
  [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md)
  returns `network = "adjusted"`, which assumes the simulation is a
  random network and samples contacts with an excess degree distribution
  (see Details in `?create_config()`). The network effect can be changed
  to `"unadjusted"` to *switch off* the network effect. `$network` is
  checked internally (in
  [`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/reference/dot-sim_network_bp.md))
  and will error if not valid
  ([\#60](https://github.com/epiverse-trace/simulist/issues/60)).
- Package architecture diagram is added to `design-principles.Rmd`
  ([\#66](https://github.com/epiverse-trace/simulist/issues/66)).
- lintr GitHub action workflow (`lint-changed-files.yaml`) is added to
  the suite of continuous integration workflows
  ([\#68](https://github.com/epiverse-trace/simulist/issues/68)).
- Transmission chain visualisation is added to `vis-linelist.Rmd`
  ([\#70](https://github.com/epiverse-trace/simulist/issues/70)).

#### Internal

- [`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/reference/dot-sim_network_bp.md)
  is added as an internal function and replaces `bpmodels::chain_sim()`
  as the core simulation model producing contacted and infected
  individuals. `{bpmodels}` is removed as a dependency as a result
  ([\#60](https://github.com/epiverse-trace/simulist/issues/60)).
- [`.sample_names()`](https://epiverse-trace.github.io/simulist/reference/dot-sample_names.md)
  is added as an internal function to utilise
  [`randomNames::randomNames()`](https://rdrr.io/pkg/randomNames/man/randomNames.html)
  to produce more unique names than
  `randomNames(..., sample.with.replacement = FALSE)`.
- Refactor of internal simulation architecture replaced
  `.sim_bp_linelist()`, `.sim_clinical_linelist()` and
  `.sim_contacts_tbl()` with
  [`.sim_internal()`](https://epiverse-trace.github.io/simulist/reference/dot-sim_internal.md)
  ([\#66](https://github.com/epiverse-trace/simulist/issues/66)).
- The `sim_utils.R` file was renamed to `utils.R`
  ([\#66](https://github.com/epiverse-trace/simulist/issues/66)) and the
  empty `create_linelist.R` file was removed
  ([\#72](https://github.com/epiverse-trace/simulist/issues/72)).
- [`.add_date_contact()`](https://epiverse-trace.github.io/simulist/reference/dot-add_cols.md)
  argument `outbreak_start_date` is now `NULL` by default instead of
  missing
  ([\#82](https://github.com/epiverse-trace/simulist/issues/82)).
- Regression tests of `sim_*()` functions now use [snapshot
  testing](https://testthat.r-lib.org/articles/snapshotting.html) for
  more detailed data checking
  ([\#65](https://github.com/epiverse-trace/simulist/issues/65)).
- Internal testing data (`testdata`) files have been updated, as has the
  `testdata/README.md` with instructions
  ([\#64](https://github.com/epiverse-trace/simulist/issues/64)).

### Breaking changes

- `R` and `serial_interval` arguments have been removed from
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md),
  [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  functions and instead `contact_distribution`, `contact_interval` and
  `prob_infect` are used to parameterise the simulation. Documentation,
  both functions and vignettes, have been updated with these changes
  ([\#60](https://github.com/epiverse-trace/simulist/issues/60)).
- The `contact_distribution` argument in `sim_*()` functions requires a
  density function if supplied as an anonymous function. Information is
  added to `simulist.Rmd` to explain this.
- The line list output from
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  now uses column header `sex` instead of `gender`. The contacts table
  output from
  [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  now uses column headers `age` and `sex` instead of `cnt_age` and
  `cnt_gender`
  ([\#60](https://github.com/epiverse-trace/simulist/issues/60),
  [\#79](https://github.com/epiverse-trace/simulist/issues/79)).
- `contact_distribution` is redefined and redocumented as the
  distribution of contacts per individual, rather than the number of
  contacts that do not get infected as it was in v0.1.0.
- `row.names` for `<data.frame>`s output by
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md),
  [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  are now sequential from `1:nrows`
  ([\#63](https://github.com/epiverse-trace/simulist/issues/63)).

### Bug fixes

- [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  now correctly runs with an age-structured population. In the previous
  version (v0.1.0),
  [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  did not call `.check_age_df()` and as a result the function errored,
  this is fixed as of PR
  [\#81](https://github.com/epiverse-trace/simulist/issues/81).

### Deprecated and defunct

- None

## simulist 0.1.0

Initial release of *simulist*, an R package containing tools to simulate
epidemiological data such as line lists and contact tables.

### New features

- A set of simulation functions to simulate epidemiological data. These
  simulation functions contain arguments that allow for the simulation
  to be flexibly parameterised to be generated under specified
  epidemiological or demographic conditions.
  - [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md):
    simulate line list data
  - [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md):
    simulate contacts data
  - [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md):
    simulate both line list and contacts data
- Four general vignettes
  - Get Started vignette (`simulist.Rmd`)
  - Age-stratified hospitalisation and death risks vignette
    (`age-strat-risks.Rmd`)
  - Age-structured population vignette (`age-struct-pop.Rmd`)
  - Visualising simulated data (`vis-linelist.Rmd`)
- One developer focused vignette
  - Design Principles for *simulist* (`design-principles.Rmd`)
- Unit tests (100% code coverage) and documentation files.
- Continuous integration workflows for R package checks, rendering the
  README.md, calculating test coverage, deploying the pkgdown website,
  updating the citation file, and checking new package or system
  dependencies.

### Breaking changes

- None

### Bug fixes

- None

### Deprecated and defunct

- None
