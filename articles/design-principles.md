# Design Principles for {simulist}

This vignette outlines the design decisions that have been taken during
the development of the {simulist} R package, and provides some of the
reasoning, and possible pros and cons of each decision.

This document is primarily intended to be read by those interested in
understanding the code within the package and for potential package
contributors.

## Scope

The {simulist} package aims to simulate data on infectious disease
outbreaks, primarily line list data, but also contacts data. Each of
these output types have an associated exported function:
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
and
[`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md).
There is also a function to simulate and output both of these data
types,
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md).
This latter function is useful for interoperability with the
[{epicontacts} R
package](https://CRAN.R-project.org/package=epicontacts) (see
[visualisation
vignette](https://epiverse-trace.github.io/simulist/articles/vis-linelist.md)),
and provides linked line list and contacts datasets, which are common in
outbreaks, such as the MERS dataset within the [{outbreaks} R
package](https://CRAN.R-project.org/package=outbreaks).

## Output

The simulation functions either return a `<data.frame>` or a `list` of
`<data.frame>`s. This consistency across functions of a well-known data
structure makes it easy to understand for users.

Before the first stable release (v1.0.0) of {simulist} we cannot
guarantee that two versions of the package will produce identical output
when using the same function with the same seed (i.e. *output breaking
change* as opposed to *API breaking change*). Given the many random
number generation calls in the simulation code, it is too constraining
to ensure reproducibility of function output between versions. We aim to
ensure consistent and reproducible output from `sim_*()` functions
between minor version releases after v1.0.0.

## Package architecture

![Package architecture diagram for the simulist R package for exported
and internal functions, showing the call stack of all exported
functions](../reference/figures/simulist_archi.svg)  

## Design decisions

- The age-stratified risks of hospitalisation and deaths via `*_risk`
  function arguments, and age-structured population via `population_age`
  function argument both accept `<data.frame>`s to specify the age
  groups. The age groups are specified by an `$age_limit` column in the
  `<data.frame>`. This design follows
  [{socialmixr}](https://github.com/epiforecasts/socialmixr/blob/main/R/contact_matrix.R)
  for defining age bounds was implemented in [pull request
  \#14](https://github.com/epiverse-trace/simulist/pull/14) for the
  `*_risk` arguments and in [pull request
  \#200](https://github.com/epiverse-trace/simulist/pull/200) for the
  `population_age` argument. The previous implementation used a
  `<data.frame>` structure that had two columns, one for a lower age
  limit and one for an upper age limit. Using age limits is judged to be
  preferred as it prevents input errors by the user when the age bounds
  are overlapping or non-contiguous (i.e. missing age groups). Since
  {simulist} v0.5.0, both approaches have a consistent structure with an
  age limits column and either a risk or proportion column. The
  specification of age groups using limits comes with some trade-offs
  which are documented here:

  1.  There is a small difference in the requirements of the
      `$age_limit` column when passing a `<data.frame>` to to either a
      `*_risk` argument or `population_age`. The default
      `population_age` is a two element `numeric` vector specifying the
      age range of the population. When supplying an age-structure
      `<data.frame>` to `population_age`, the `$age_limit` column
      contains the lower bound of each age group, but the upper range of
      the population is still required, so the last element in the
      `$age_limit` column is taken as the upper population age. This
      differs from the `$age_limit` column in the `<data.frame>`
      required for age-stratified risk, where each element is the lower
      age limit, and the upper range of the population age is taken from
      the `population_age` argument. This interaction of arguments is
      documented in the next point.

  2.  When using age-stratified risks of hospitalisation and deaths (see
      [Age-stratified hospitalisation and death risks
      vignette](https://epiverse-trace.github.io/simulist/articles/age-strat-risks.md)
      for details) there is an interaction between function arguments.
      The `<data.frame>` that defines the age-stratification in
      `hosp_risk`, `hosp_death_risk` and `non_hosp_death_risk` arguments
      gives the lower bound of the age groups. The upper bound of the
      age groups is derived from the next lower bound, but the upper
      bound oldest age group is defined by the upper age given to the
      `population_age` argument. This interaction of arguments is not
      ideal, as it can be more difficult to understand for users (as
      outlined in [The Tidy Design
      book](https://design.tidyverse.org/independent-meaning.html#whats-the-problem)),
      however, the interaction does not change the interpretation of
      each argument which would be more convoluted.

- The column names of the contact relationships (edges of the network)
  are called `from` and `to`. Names of the contacts table match
  {epicontacts} `<epicontacts>` objects. If the column names of the two
  contacts provided to
  [`epicontacts::make_epicontacts()`](https://www.repidemicsconsortium.org/epicontacts/reference/make_epicontacts.html)
  arguments `from` and `to` are not `from` and `to` they will be
  silently renamed in the resulting `<epicontacts>` object. By making
  these column names `from` and `to` when output from
  [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  or
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  it prevents any confusion when used with {epicontacts}. This naming is
  also preferred as they are usefully descriptive.

- Exported functions that simulate data use the naming convention
  `sim_*()` (where `*` is the placeholder). Internal functions that
  simulate have a dot (`.`) prefix
  (e.g. [`.sim_internal()`](https://epiverse-trace.github.io/simulist/reference/dot-sim_internal.md)).
  Functions that create fixed data structures (i.e. data factory
  functions) have the naming convention (`create_*()` or `.create_*()`).

- Exported post-processing functions, i.e. those that are applied to the
  output of
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md),
  use the naming convention `*_linelist()`. Where the `*` placeholder is
  a verb or adjective,
  e.g. [`messy_linelist()`](https://epiverse-trace.github.io/simulist/reference/messy_linelist.md)
  or
  [`truncate_linelist()`](https://epiverse-trace.github.io/simulist/reference/truncate_linelist.md).
  This naming convention makes it clear that the functions operate on a
  line list `<data.frame>` and tries to minimise namespace conflicts
  e.g. `messy()` function from the
  [{messy}](https://cran.r-project.org/package=messy) package.

- The use of a `config` argument in the simulation function is to reduce
  the number of arguments in the exported functions and provide as
  simple a user-interface as possible. The choice of what gets an
  argument in the function body and what is confined to `config` list is
  based on preconceived frequency of use, importance and technical
  detail. That is to say, settings that are unlikely to be changed by
  the user or if they are changed require an advanced understanding of
  the simulation model are placed within the `config`, and given default
  values with
  [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md).

- Input checking of the `config` list takes place within the call stack
  of exported `sim_*()` functions when certain elements of the `config`
  list are used, and not in the
  [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md)
  function. Therefore, it is possible to create an invalid `config` list
  with
  [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md).
  An example of throwing an error from an internal function of the
  simulation is if `config$network` is not `"adjusted"` or
  `"unadjusted"`, or is `NULL` it will error in
  [`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/reference/dot-sim_network_bp.md).

- The column names of the line list data produced by
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  matches the tag names used in the [{linelist} R
  package](https://CRAN.R-project.org/package=linelist) (an
  [Epiverse-TRACE R package](https://github.com/epiverse-trace)). This
  is for continuity of design more than any functional reason. The line
  list data from {simulist} functions is not tagged *sensu* [{linelist}
  tagging](https://epiverse-trace.github.io/linelist/articles/linelist.html).
  There is an inconsistent use of *hospitalisation* and *admission*; in
  the simulated line list it is `date_admission`, but internally the
  package uses hospitalisation
  (e.g. [`.add_hospitalisation()`](https://epiverse-trace.github.io/simulist/reference/dot-add_cols.md)).
  This is because I think *hospitalisation* is more descriptive but
  `date_admission` is used by {linelist}.

- {simulist} implements its own branching process model
  ([`.sim_network_bp()`](https://epiverse-trace.github.io/simulist/reference/dot-sim_network_bp.md))
  which tracks contacts of infectious individuals. This is a simple
  random network model, but for future versions of {simulist} we will
  make the code modular in order to accept other simulations models.
  This will remove the burden on {simulist} to simulate from a range of
  model types.

- The
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md),
  [`sim_contacts()`](https://epiverse-trace.github.io/simulist/reference/sim_contacts.md)
  and
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  do not have arguments that change the dimensions of the `<data.frame>`
  returned by the functions (or in the case of
  [`sim_outbreak()`](https://epiverse-trace.github.io/simulist/reference/sim_outbreak.md)
  a list of two `<data.frame>`s). Instead, we recommend modifying the
  line list or contact tracing data after the simulation, and provide a
  vignette to guide users on common data wrangling tasks in
  `wrangling-linelist.Rmd`. Not including arguments that can remove or
  add columns to the output `<data.frame>`s reduces the complexity of
  the functions; and by limiting the simulation function arguments to
  only parameterise, and not change the dimensionality of, the simulated
  data, the package is more robust to being used in pipelines or other
  automated approaches, where the data needs to be predictably
  formatted.

- Several parts of the {simulist} codebase use indices for determining
  which individual are infected, allocation to vectors, and other uses.
  R’s subsetting (`[`) can use logical vectors or numeric vectors, but
  in {simulist} these are differentiated by the names `*_idx` for
  variables holding a `numeric` vector of indices, and `*_lgl_idx` for a
  `logical` vector of indices. This makes it safer and more readable to
  call functions like [`sum()`](https://rdrr.io/r/base/sum.html) or
  [`which()`](https://rdrr.io/r/base/which.html) on index vectors.

## Dependencies

The aim is to restrict the number of dependencies to a minimal required
set for ease of maintenance. The current hard dependencies are:

- {stats}
- [{checkmate}](https://CRAN.R-project.org/package=checkmate)
- [{english}](https://CRAN.R-project.org/package=english)
- [{epiparameter}](https://github.com/epiverse-trace/epiparameter)
- [{randomNames}](https://CRAN.R-project.org/package=randomNames)

{stats} is distributed with the R language so is viewed as a lightweight
dependency, that should already be installed on a user’s machine if they
have R. {checkmate} is an input checking package widely used across
Epiverse-TRACE packages. {english} is a lightweight, (hard) dependency
free package which used to converted integers to words. {epiparameter}
is used to easily access epidemiological parameters from the package’s
library, the package is currently unstable and actively developed,
however, by using it in another package it can inform the development
path of {epiparameter}. {randomNames} provides a utility function for
generating random names for case and contact data. The functionality
could be replicated in {simulist}, however the {randomNames} package is
maintained and contains a range of name generation settings which
warrants its use as a dependency.

The soft dependencies (and their minimum version requirements) are:

- [{incidence2}](https://CRAN.R-project.org/package=incidence2) (\>=
  2.6.2)
- [{epicontacts}](https://CRAN.R-project.org/package=epicontacts) (\>=
  1.1.3)
- [{knitr}](https://CRAN.R-project.org/package=knitr)
- [{ggplot2}](https://CRAN.R-project.org/package=ggplot2)
- [{rmarkdown}](https://CRAN.R-project.org/package=rmarkdown)
- [{spelling}](https://CRAN.R-project.org/package=spelling)
- [{testthat}](https://CRAN.R-project.org/package=testthat) (\>= 3.0.0)

{knitr}, {rmarkdown}, are all used for generating documentation.
{spelling} and {testthat} are used for testing the code base. {ggplot2}
is used for plotting within the vignettes. {incidence2} and
{epicontacts} are used in vignettes to demonstrate interoperability with
downstream packages, with a focus on data visualisation.

## Contribute

There are no special requirements to contributing to {simulist}, please
follow the [package contributing
guide](https://github.com/epiverse-trace/.github/blob/main/CONTRIBUTING.md).
