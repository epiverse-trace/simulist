#' Simulate contacts for an infectious disease outbreak
#'
#' @inheritParams sim_linelist
#' @param contact_tracing_status_probs A named `numeric` vector with the
#' probability of each contact tracing status. The names of the vector must
#' be `"under_followup"`, `"lost_to_followup"`, `"unknown"`. Values of each
#' contact tracing status must sum to one.
#'
#' @return A contacts `<data.frame>`.
#'
#' The structure of the output is:
#'
#' \describe{
#'   \item{`from`}{`character` column with name of case.}
#'   \item{`to`}{`character` column with name of contacts of case.}
#'   \item{`age`}{`integer` with age of infectee.}
#'   \item{`sex`}{`character` column with either `"m"` or `"f"` for the sex
#'   of the contact.}
#'   \item{`date_first_contact`}{`<Date>` column for the first contact between
#'   case and contacts.}
#'   \item{`date_last_contact`}{`<Date>` column for the last contact between
#'   case and contacts.}
#'   \item{`was_case`}{`character` column with either `"Y"` or `"N"` for if
#'   the contact becomes a case.}
#'   \item{`status`}{`character` column with the status of each contact. By
#'   default it is either `"case"`, `"under_followup"` `"lost_to_followup"`, or
#'   `"unknown"`.}
#' }
#' @export
#'
#' @author Joshua W. Lambert, Carmen Tamayo
#'
#' @examples
#' # quickly simulate contact tracing data using the function defaults
#' contacts <- sim_contacts()
#' head(contacts)
#'
#' # to simulate more realistic contact tracing data load epiparameters from
#' # {epiparameter}
#' library(epiparameter)
#' contact_distribution <- epiparameter(
#'   disease = "COVID-19",
#'   epi_name = "contact distribution",
#'   prob_distribution = create_prob_distribution(
#'     prob_distribution = "pois",
#'     prob_distribution_params = c(mean = 2)
#'   )
#' )
#'
#' infectious_period <- epiparameter(
#'   disease = "COVID-19",
#'   epi_name = "infectious period",
#'   prob_distribution = create_prob_distribution(
#'     prob_distribution = "gamma",
#'     prob_distribution_params = c(shape = 1, scale = 1)
#'   )
#' )
#'
#' contacts <- sim_contacts(
#'   contact_distribution = contact_distribution,
#'   infectious_period = infectious_period,
#'   prob_infection = 0.5
#' )
sim_contacts <- function(contact_distribution = function(x) stats::dpois(x = x, lambda = 2), # nolint line_length_linter.
                         infectious_period = function(x) stats::rlnorm(n = x, meanlog = 2, sdlog = 0.5), # nolint line_length_linter.
                         prob_infection = 0.5,
                         outbreak_start_date = as.Date("2023-01-01"),
                         anonymise = FALSE,
                         outbreak_size = c(10, 1e4),
                         population_age = c(1, 90),
                         contact_tracing_status_probs = c(
                           under_followup = 0.7,
                           lost_to_followup = 0.2,
                           unknown = 0.1
                         ),
                         config = create_config()) {
  # check and convert distribution to func if needed before .check_sim_input()
  stopifnot(
    "Input delay distributions need to be either functions or <epiparameter>" =
      inherits(infectious_period, c("function", "epiparameter"))
  )
  contact_distribution <- as.function(
    contact_distribution,
    func_type = "density"
  )
  infectious_period <- as.function(infectious_period, func_type = "generate")

  .check_sim_input(
    sim_type = "contacts",
    contact_distribution = contact_distribution,
    infectious_period = infectious_period,
    prob_infection = prob_infection,
    outbreak_start_date = outbreak_start_date,
    outbreak_size = outbreak_size,
    contact_tracing_status_probs = contact_tracing_status_probs,
    population_age = population_age
  )

  if (is.data.frame(population_age)) {
    population_age <- .check_df(population_age, df_type = "age")
  } else {
    population_age <- sort(population_age)
    names(population_age) <- c("lower", "upper")
  }

  contacts <- .sim_internal(
    sim_type = "contacts",
    contact_distribution = contact_distribution,
    infectious_period = infectious_period,
    prob_infection = prob_infection,
    outbreak_start_date = outbreak_start_date,
    anonymise = anonymise,
    outbreak_size = outbreak_size,
    population_age = population_age,
    contact_tracing_status_probs = contact_tracing_status_probs,
    config = config
  )

  # return contacts table
  contacts
}
