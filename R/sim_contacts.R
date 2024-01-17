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
#' serial_interval <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "serial interval",
#'   prob_distribution = "gamma",
#'   prob_distribution_params = c(shape = 1, scale = 1)
#' )
#'
#' contact_distribution <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "contact_distribution",
#'   prob_distribution = "pois",
#'   prob_distribution_params = c(l = 5)
#' )
#'
#' contacts <- sim_contacts(
#'   R = 1.1,
#'   serial_interval = serial_interval
#' )
sim_contacts <- function(mean_contacts,
                         contact_interval,
                         prob_infect,
                         outbreak_start_date = as.Date("2023-01-01"),
                         min_outbreak_size = 10,
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
      inherits(contact_interval, c("function", "epidist"))
  )
  contact_interval <- as.function(contact_interval, func_type = "generate")

  .check_sim_input(
    sim_type = "contacts",
    mean_contacts = mean_contacts,
    contact_interval = contact_interval,
    prob_infect = prob_infect,
    outbreak_start_date = outbreak_start_date,
    min_outbreak_size = min_outbreak_size,
    contact_tracing_status_probs = contact_tracing_status_probs,
    population_age = population_age
  )

  chain <- .sim_bp_linelist(
    mean_contacts = mean_contacts,
    contact_interval = contact_interval,
    prob_infect = prob_infect,
    outbreak_start_date = outbreak_start_date,
    min_outbreak_size = min_outbreak_size,
    population_age = population_age,
    config = config
  )

  chain <- .add_names(.data = chain)

  contacts <- .sim_contacts_tbl(
    .data = chain,
    contact_tracing_status_probs = contact_tracing_status_probs
  )

  # return line list
  contacts
}
