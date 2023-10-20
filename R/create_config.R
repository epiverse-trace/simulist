#' Create a list of configuration settings for some details of [sim_linelist()]
#'
#' @details The `config` argument in [sim_linelist()] controls the small details
#' around time windows around infections (time of first contact and last
#' contact with infector), and the distribution of the Ct value for confirmed
#' cases.
#'
#' Accepted arguments and their defaults are:
#' * `last_contact_distribution = "pois"`
#' * `last_contact_distribution_params = c(rate = 3)`
#' * `first_contact_distribution = "pois"`
#' * `first_contact_distribution_params = c(rate = 3)`
#' * `ct_distribution = "norm"`
#' * `ct_distribution_params = c(mean = 25, sd = 2)`
#'
#' These parameters do not warrant their own arguments in
#' [sim_linelist()] as they rarely need to be changed from their default
#' setting. Therefore it is not worth increasing the number of [sim_linelist()]
#' arguments to accommodate these and the `config` argument keeps the function
#' signature simpler and more readable.
#'
#'
#' @param ... [dots] Named elements to replace default settings. Only if names
#' match exactly are elements replaced.
#'
#' @return A list of settings for [sim_linelist()]
#' @export
create_config <- function(...) {
  args <- list(
    last_contact_distribution = "pois",
    last_contact_distribution_params = c(rate = 3),
    first_contact_distribution = "pois",
    first_contact_distribution_params = c(rate = 3),
    ct_distribution = "norm",
    ct_distribution_params = c(mean = 25, sd = 2)
  )

  # replace default args if in dots (remove args not for sim_linelist)
  args <- utils::modifyList(args, list(...)[...names() %in% names(args)])

  # return args list
  args
}
