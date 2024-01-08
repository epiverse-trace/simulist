# simulist (development version)

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
