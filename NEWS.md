# simulist (development version)

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
* The `sim_utils.R` file was renamed to `utils.R` (#66).
* Regression tests of `sim_*()` functions now use [snapshot testing](https://testthat.r-lib.org/articles/snapshotting.html) for more detailed data checking (#65).
* Internal testing data (`testdata`) files have been updated, as has the `testdata/README.md` with instructions (#64).

## Breaking changes

* `R` and `serial_interval` arguments have been removed from `sim_linelist()`, `sim_contacts()` and `sim_outbreak()` functions and instead `contact_distribution`, `contact_interval` and `prob_infect` are used to parameterise the simulation. Documentation, both functions and vignettes, have been updated with these changes (#60).
* The `contact_distribution` argument in `sim_*()` functions requires a density function if supplied as an anonymous function. Information is added to `simulist.Rmd` to explain this.
* The line list output from `sim_linelist()` now uses column header `sex` instead of `gender`. The contacts table output from `sim_contacts()` and `sim_outbreak()` now uses column headers `age` and `sex` instead of `cnt_age` and `cnt_gender`.
* `contact_distribution` is redefined and redocumented as the distribution of contacts per individual, rather than the number of contacts that do not get infected as it was in v0.1.0.
* `row.names` for `<data.frame>`s output by `sim_linelist()`, `sim_contacts()` and `sim_outbreak()` are now sequential from `1:nrows` (#63).

## Bug fixes

* None

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
