#' Create a list of configuration settings for some details of [sim_linelist()]
#'
#' @details The `config` argument in [sim_linelist()] controls the small details
#' around time windows around infections (time of first contact and last
#' contact with infector), and the distribution of the Ct value for confirmed
#' cases.
#'
#' Accepted arguments and their defaults are:
#' * `last_contact_distribution = "pois"`
#' * `last_contact_distribution_params = c(lambda = 3)`
#' * `first_contact_distribution = "pois"`
#' * `first_contact_distribution_params = c(lambda = 3)`
#' * `ct_distribution = "norm"`
#' * `ct_distribution_params = c(mean = 25, sd = 2)`
#'
#' These parameters do not warrant their own arguments in
#' [sim_linelist()] as they rarely need to be changed from their default
#' setting. Therefore it is not worth increasing the number of [sim_linelist()]
#' arguments to accommodate these and the `config` argument keeps the function
#' signature simpler and more readable.
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> Named elements to replace
#' default settings. Only if names match exactly are elements replaced,
#' otherwise the function errors.
#'
#' @return A list of settings for [sim_linelist()]
#' @export
#'
#' @examples
#' # example with default configuration
#' create_config()
#'
#' # example with customised Ct distribution
#' create_config(
#'   ct_distribution = "lnorm",
#'   ct_distribution_params = c(meanlog = 2, sdlog = 1)
#' )
create_config <- function(...) {
  args <- list(
    last_contact_distribution = "pois",
    last_contact_distribution_params = c(lambda = 3),
    first_contact_distribution = "pois",
    first_contact_distribution_params = c(lambda = 3),
    ct_distribution = "norm",
    ct_distribution_params = c(mean = 25, sd = 2)
  )

  # capture dynamic dots
  dots <- rlang::dots_list(..., .ignore_empty = "none", .homonyms = "error")
  dots_names <- names(dots)

  # check arguments in dots match arg list
  stopifnot(
    "Incorrect argument names supplied to create_config" =
    all(dots_names %in% names(args))
  )

  # replace default args if in dots
  args <- utils::modifyList(args, dots)

  # return args list
  args
}
