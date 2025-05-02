#' Create a list of configuration settings for some details of [sim_linelist()]
#'
#' @details The `config` argument in [sim_linelist()] controls the small details
#' around time windows around infections (time of first contact and last
#' contact with infector), and the distribution of the Cycle threshold (Ct)
#' value from a Real-time PCR or quantitative PCR (qPCR) for confirmed
#' cases, the network effect in the simulation, and if there is a time-varying
#' death risk.
#'
#' These parameters do not warrant their own arguments in
#' [sim_linelist()] as they rarely need to be changed from their default
#' setting. Therefore it is not worth increasing the number of [sim_linelist()]
#' arguments to accommodate these and the `config` argument keeps the function
#' signature simpler and more readable.
#'
#' The `last_contact_distribution` and `first_contact_distribution` can accept
#' any function that generates positive integers (e.g. discrete probability
#' distribution, [rpois()] or [rgeom()]). The `ct_distribution` can accept
#' any function that generates real numbers (e.g. continuous or discrete
#' probability distribution, [rnorm()], [rlnorm()]).
#'
#' The `network` option controls whether to sample contacts from a adjusted or
#' unadjusted contact distribution. Adjusted (default) sampling uses
#' \eqn{q(n) \sim (n + 1)p(n + 1)} where \eqn{p(n)} is the probability
#' density function of a distribution, e.g., Poisson or Negative binomial.
#' Unadjusted (`network = "unadjusted"`) instead samples contacts directly from
#' a probability distribution \eqn{p(n)}.
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> Named elements to replace
#' default settings. Only if names match exactly are elements replaced,
#' otherwise the function errors.
#'
#' Accepted arguments and their defaults are:
#'
#' \describe{
#'   \item{`last_contact_distribution`}{A `function` to generate the
#'   time for last contact. Default parameterisation is a Poisson
#'   distribution with a \eqn{\lambda} of 3.}
#'   \item{`first_contact_distribution`}{A `function` to generate the time
#'   for the first contact. Default parameterisation is a Poisson
#'   distribution with a \eqn{\lambda} of 3.}
#'   \item{`ct_distribution`}{A `function` to generate Ct values for each
#'   confirmed case. Default parameterisation is a Normal distribution with
#'   a mean (\eqn{\mu}) of 25 and a standard deviation (\eqn{\sigma}) of 2.}
#'   \item{`network`}{A `character` string, either `"adjusted"` (default) or
#'   `"unadjusted"`.}
#'   \item{`time_varying_death_risk`}{By default is `NULL`, but can also accept
#'   a `function` with two arguments, `risk` and `time`, to apply a
#'   time varying death risk of hospitalised and non-hospitalised cases in
#'   the outbreak simulation. See
#'   `vignette("time-varying-cfr", package = "simulist")`.}
#' }
#'
#' @return A list of settings for [sim_linelist()].
#' @export
#'
#' @examples
#' # example with default configuration
#' create_config()
#'
#' # example with customised Ct distribution
#' create_config(
#'   ct_distribution = function(x) rlnorm(n = x, meanlog = 2, sdlog = 1)
#' )
create_config <- function(...) {
  .args <- list(
    last_contact_distribution = function(x) stats::rpois(n = x, lambda = 3),
    first_contact_distribution = function(x) stats::rpois(n = x, lambda = 3),
    ct_distribution = function(x) stats::rnorm(n = x, mean = 25, sd = 2),
    network = "adjusted",
    time_varying_death_risk = NULL
  )

  # capture dynamic dots
  dots <- rlang::dots_list(..., .ignore_empty = "none", .homonyms = "error")
  dots_names <- names(dots)

  # check arguments in dots match arg list
  stopifnot(
    "Incorrect argument names supplied to create_config" =
      dots_names %in% names(.args)
  )

  # replace default args if in dots
  .args <- utils::modifyList(.args, dots)

  # return args list
  .args
}
