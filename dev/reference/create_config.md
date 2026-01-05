# Create a list of configuration settings for some details of [`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)

Create a list of configuration settings for some details of
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)

## Usage

``` r
create_config(...)
```

## Arguments

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Named elements to replace default settings. Only if names match
  exactly are elements replaced, otherwise the function errors.

  Accepted arguments and their defaults are:

  `last_contact_distribution`

  :   A `function` to generate the time for last contact. Default
      parameterisation is a Poisson distribution with a \\\lambda\\ of
      3.

  `first_contact_distribution`

  :   A `function` to generate the time for the first contact. Default
      parameterisation is a Poisson distribution with a \\\lambda\\ of
      3.

  `ct_distribution`

  :   A `function` to generate Ct values for each confirmed case.
      Default parameterisation is a Normal distribution with a mean
      (\\\mu\\) of 25 and a standard deviation (\\\sigma\\) of 2.

  `network`

  :   A `character` string, either `"adjusted"` (default) or
      `"unadjusted"`.

  `time_varying_death_risk`

  :   By default is `NULL`, but can also accept a `function` with two
      arguments, `risk` and `time`, to apply a time varying death risk
      of hospitalised and non-hospitalised cases in the outbreak
      simulation. See
      [`vignette("time-varying-cfr", package = "simulist")`](https://epiverse-trace.github.io/simulist/dev/articles/time-varying-cfr.md).

## Value

A list of settings for
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md).

## Details

The `config` argument in
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
controls the small details around time windows around infections (time
of first contact and last contact with infector), and the distribution
of the Cycle threshold (Ct) value from a Real-time PCR or quantitative
PCR (qPCR) for confirmed cases, the network effect in the simulation,
and if there is a time-varying death risk.

These parameters do not warrant their own arguments in
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
as they rarely need to be changed from their default setting. Therefore
it is not worth increasing the number of
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
arguments to accommodate these and the `config` argument keeps the
function signature simpler and more readable.

The `last_contact_distribution` and `first_contact_distribution` can
accept any function that generates positive integers (e.g. discrete
probability distribution,
[`rpois()`](https://rdrr.io/r/stats/Poisson.html) or
[`rgeom()`](https://rdrr.io/r/stats/Geometric.html)). The
`ct_distribution` can accept any function that generates real numbers
(e.g. continuous or discrete probability distribution,
[`rnorm()`](https://rdrr.io/r/stats/Normal.html),
[`rlnorm()`](https://rdrr.io/r/stats/Lognormal.html)).

The `network` option controls whether to sample contacts from a adjusted
or unadjusted contact distribution. Adjusted (default) sampling uses
\\q(n) \sim (n + 1)p(n + 1)\\ where \\p(n)\\ is the probability density
function of a distribution, e.g., Poisson or Negative binomial.
Unadjusted (`network = "unadjusted"`) instead samples contacts directly
from a probability distribution \\p(n)\\.

## Examples

``` r
# example with default configuration
create_config()
#> $last_contact_distribution
#> function (n) 
#> stats::rpois(n = n, lambda = 3)
#> <bytecode: 0x55d711a0c1e0>
#> <environment: 0x55d7112d7ee8>
#> 
#> $first_contact_distribution
#> function (n) 
#> stats::rpois(n = n, lambda = 3)
#> <bytecode: 0x55d711a0c1e0>
#> <environment: 0x55d7112d7ee8>
#> 
#> $ct_distribution
#> function (n) 
#> stats::rnorm(n = n, mean = 25, sd = 2)
#> <bytecode: 0x55d711a0bf78>
#> <environment: 0x55d7112d7ee8>
#> 
#> $network
#> [1] "adjusted"
#> 
#> $time_varying_death_risk
#> NULL
#> 

# example with customised Ct distribution
create_config(
  ct_distribution = function(n) rlnorm(n = n, meanlog = 2, sdlog = 1)
)
#> $last_contact_distribution
#> function (n) 
#> stats::rpois(n = n, lambda = 3)
#> <bytecode: 0x55d711a0c1e0>
#> <environment: 0x55d710bcbd68>
#> 
#> $first_contact_distribution
#> function (n) 
#> stats::rpois(n = n, lambda = 3)
#> <bytecode: 0x55d711a0c1e0>
#> <environment: 0x55d710bcbd68>
#> 
#> $ct_distribution
#> function (n) 
#> rlnorm(n = n, meanlog = 2, sdlog = 1)
#> <environment: 0x55d7117675b8>
#> 
#> $network
#> [1] "adjusted"
#> 
#> $time_varying_death_risk
#> NULL
#> 
```
