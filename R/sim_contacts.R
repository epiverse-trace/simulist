#' Simulate contacts for an infectious disease outbreak
#'
#' @inheritParams sim_linelist
#' @param contact_tracing_status_probs A named `numeric` vector with the
#' probability of each contact tracing status. The names of the vector must
#' be `"under_followup"`, `"lost_to_followup"`, `"unknown"`. Values of each
#' contact tracing status must sum to one.
#'
#' @return A contacts `<data.frame>`
#' @export
#'
#' @author Joshua W. Lambert, Carmen Tamayo
#'
#' @examples
#' # load data required to simulate contacts
#' contact_distribution <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "contact distribution",
#'   prob_distribution = "pois",
#'   prob_distribution_params = c(mean = 2)
#' )
#'
#' infectious_period <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "infectious period",
#'   prob_distribution = "gamma",
#'   prob_distribution_params = c(shape = 1, scale = 1)
#' )
#'
#' contacts <- sim_contacts(
#'   contact_distribution = contact_distribution,
#'   infectious_period = infectious_period,
#'   prob_infection = 0.5
#' )
sim_contacts <- function(contact_distribution,
                         infectious_period,
                         prob_infection,
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
    "Input delay distributions need to be either functions or <epidist>" =
      inherits(infectious_period, c("function", "epidist"))
  )
  contact_distribution <- as.function(
    contact_distribution, func_type = "density"
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
    population_age <- .check_age_df(population_age)
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
