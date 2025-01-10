# simulist (development version)

# simulist 0.4.0

A minor version release of _simulist_ containing various minor improvements to the functions and documentation, as well as removing some triggers for warning users. There are also a few bug fixes and internal enhancements.

## New features

### External

* Defaults have been added to all `sim_*()` arguments that previously did not have one. Allowing functions to be run without specifying any arguments (e.g. `linelist <- sim_linelist()`) (#149).
* Documentation for `sim_*()` function arguments that accept either a `function` or an `<epiparameter>` object has been improved (#149).
* `sim_*()` functions no longer warn if the user has not specified `*_risk` arguments and have set `onset_to_*` arguments to `NULL` (#149).
* All vignettes now use `rmarkdown::html_vignette` for to correctly render the website and for maximum compatibility with {pkgdown} >= 2.1.0. This removes figure numbering and code folding (#153).

### Internal

* `.add_hospitalisation()` has been vectorised following `.add_outcome()` in PR #101 (#150). 

## Breaking changes

* The function arguments `infect_period` and `prob_infect` have been renamed `infectious_period` and `prob_infection` (#143).
* `sim_*()` functions now use `NULL` instead of `NA` to turn off processes (e.g. `onset_to_death = NULL` for no deaths) (#148).

## Bug fixes

* A new function, `.sample_infect_period()` is added that errors if the infectious period function generates a negative number (#142).
* `sim_linelist()` no longer errors when `hosp_death_risk` is `NULL` and `onset_to_death` is parameterised as a delay distribution (#144). 
* `.add_ct()` generates the correct number of values and does not duplicate Ct values due to vector recycling (#158). 
* Update {epiparameter} usage (#159).

## Deprecated and defunct

* None

# simulist 0.3.0

The third release of the _simulist_ R package contains a range of new features, enhancements, documentation and unit tests. 

The headline changes to the package are:

* The simulation is now parameterised with an infectious period rather than a contact interval.
* Line list data now has `date_outcome` and `outcome` columns which can be parameterised with `onset_to_death` and `onset_to_recovery`.
* Case fatality risk can vary through time with a customisable user-defined function.
* Two new vignettes on time-varying case fatality risk, and wrangling line list and contact tracing data.

## New features

### External

* `onset_to_hosp` and `onset_to_death` arguments can now take `NA` as input and will return a column of `NA`s in the line list columns `date_admission` and `date_outcome` (#98).

* An `onset_to_recovery` argument has been added to the simulation functions, `sim_linelist()` and `sim_outbreak()`, and so the recovery date can be explicitly given in the line list data (#99).

* The line list simulation can now use a time-varying case fatality risk. The `create_config()` function now returns a `$time_varying_death_risk` list element, which is `NULL` by default but can take an R function to enable the fatality risk of cases to change over the epidemic (#101).

* A new vignette, `time-varying-cfr.Rmd`, has been added to the package to describe how to use the time-varying case fatality risk functionality and describe a few different time-varying functions that can be used (#101).

* A new vignette, `wrangling-linelist.Rmd`, has been added to go over some of the common post-processing steps that might be required after simulating line list or contact tracing data. This vignette is short and currently only contains a single post-processing example, more examples will be added over time (#104).

* The `README` now has a section on related projects to provide an overview of packages that simulate line list data, or are related to _simulist_. This section contains a disclosure widget containing a feature table providing a high-level description of the features and development status of each related package (#110).

* A Key features section and Complimentary R packages section has been added to the `README` (#134).

* Updated package architecture diagram in the `design-principles.Rmd` vignette (#113).

### Internal

* The `.add_deaths()` function has been replaced by the `.add_outcome()` function which can simulate death and recovery times (#99).

* `.cross_check_sim_input()` function has been added to the package to ensure user input is coherent across arguments (#98).

* `.anonymise()` function has been added to convert individual's names into alphanumeric codes to anonymise individuals in line list and contact tracing data (#106).

## Breaking changes

* The simulation functions are now parameterised with an infectious period (`infect_period` argument) instead of a contact interval (`contact_interval` argument). This moves away from parameterising the simulation with the time delay between a person becoming infected and having contact with a susceptible individual, and instead uses an infectious period distribution within which contacts are uniformly distributed in time (#96). 

* The simulation functions can now set a maximum as well as a minimum outbreak size. The `min_outbreak_size` argument in the exported `sim_*()` functions has been renamed `outbreak_size` and takes a `numeric` vector of two elements, the minimum and maximum outbreak size. The maximum outbreak size is a soft limit due to the stochastic nature of the branching process model, so epidemiological data returned can contain more cases and/or contacts that the maximum in `outbreak_size` but in these case a warning is returned explaining to the user how many cases/contacts are being returned (#93).

* The `add_ct` argument in `sim_linelist()` and `sim_outbreak()` has been removed. The functionality is now equivalent to `add_ct = TRUE` in the previous _simulist_ version. The `add_ct` argument was removed to move the package to always returning `<data.frame>`s with the same number of columns, for consistency and predictability (#104).

* The `add_names` argument in the simulation functions has been renamed to `anonymise`. The new argument controls whether names are given to each case (`anonymise = FALSE`, default behaviour) or whether fixed length hexadecimal codes are given to each case (`anonymise = TRUE`), this ensures the returned `<data.frame>` has the same number of columns (#106). 

## Bug fixes

* `.sim_network_bp()` now indexes the time vector correctly. Previously a vector indexing bug meant the epidemic would not progress through time (#95).

## Deprecated and defunct

* None

# simulist 0.2.0

Second release of _simulist_, updates the core simulation model and, as a result, the arguments for `sim_*()` functions for simulating line list data and/or contact table data exported from _simulist_ are updated. The internal package architecture is also refactored.

## New features

### External

* `create_config()` now returns a new element in the list: `$network`. By default `create_config()` returns `network = "adjusted"`, which assumes the simulation is a random network and samples contacts with an excess degree distribution (see Details in `?create_config()`). The network effect can be changed to `"unadjusted"` to _switch off_ the network effect. `$network` is checked internally (in `.sim_network_bp()`) and will error if not valid (#60).
* Package architecture diagram is added to `design-principles.Rmd` (#66).
* lintr GitHub action workflow (`lint-changed-files.yaml`) is added to the suite of continuous integration workflows (#68).
* Transmission chain visualisation is added to `vis-linelist.Rmd` (#70).

### Internal

* `.sim_network_bp()` is added as an internal function and replaces `bpmodels::chain_sim()` as the core simulation model producing contacted and infected individuals. `{bpmodels}` is removed as a dependency as a result (#60).
* `.sample_names()` is added as an internal function to utilise `randomNames::randomNames()` to produce more unique names than `randomNames(..., sample.with.replacement = FALSE)`.
* Refactor of internal simulation architecture replaced `.sim_bp_linelist()`, `.sim_clinical_linelist()` and `.sim_contacts_tbl()` with `.sim_internal()` (#66).
* The `sim_utils.R` file was renamed to `utils.R` (#66) and the empty `create_linelist.R` file was removed (#72).
* `.add_date_contact()` argument `outbreak_start_date` is now `NULL` by default instead of missing (#82).
* Regression tests of `sim_*()` functions now use [snapshot testing](https://testthat.r-lib.org/articles/snapshotting.html) for more detailed data checking (#65).
* Internal testing data (`testdata`) files have been updated, as has the `testdata/README.md` with instructions (#64).

## Breaking changes

* `R` and `serial_interval` arguments have been removed from `sim_linelist()`, `sim_contacts()` and `sim_outbreak()` functions and instead `contact_distribution`, `contact_interval` and `prob_infect` are used to parameterise the simulation. Documentation, both functions and vignettes, have been updated with these changes (#60).
* The `contact_distribution` argument in `sim_*()` functions requires a density function if supplied as an anonymous function. Information is added to `simulist.Rmd` to explain this.
* The line list output from `sim_linelist()` now uses column header `sex` instead of `gender`. The contacts table output from `sim_contacts()` and `sim_outbreak()` now uses column headers `age` and `sex` instead of `cnt_age` and `cnt_gender` (#60, #79).
* `contact_distribution` is redefined and redocumented as the distribution of contacts per individual, rather than the number of contacts that do not get infected as it was in v0.1.0.
* `row.names` for `<data.frame>`s output by `sim_linelist()`, `sim_contacts()` and `sim_outbreak()` are now sequential from `1:nrows` (#63).

## Bug fixes

* `sim_contacts()` now correctly runs with an age-structured population. In the previous version (v0.1.0), `sim_contacts()` did not call `.check_age_df()` and as a result the function errored, this is fixed as of PR #81.

## Deprecated and defunct

* None

# simulist 0.1.0

Initial release of _simulist_, an R package containing tools to simulate epidemiological data such as line lists and contact tables.

## New features

* A set of simulation functions to simulate epidemiological data. These simulation functions contain arguments that allow for the simulation to be flexibly parameterised to be generated under specified epidemiological or demographic conditions.
  - `sim_linelist()`: simulate line list data
  - `sim_contacts()`: simulate contacts data
  - `sim_outbreak()`: simulate both line list and contacts data
* Four general vignettes
  - Get Started vignette (`simulist.Rmd`)
  - Age-stratified hospitalisation and death risks vignette (`age-strat-risks.Rmd`)
  - Age structured population vignette (`age-struct-pop.Rmd`)
  - Visualising simulated data (`vis-linelist.Rmd`)

* One developer focused vignette
  - Design Principles for {simulist} (`design-principles.Rmd`)

* Unit tests (100% code coverage) and documentation files.
* Continuous integration workflows for R package checks, rendering the README.md, calculating test coverage, deploying the pkgdown website, updating the citation file, and checking new package or system dependencies.

## Breaking changes

* None

## Bug fixes

* None

## Deprecated and defunct

* None
