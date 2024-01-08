#' Simulate contacts for an infectious disease outbreak
#'
#' @inheritParams sim_linelist
#' @param contact_distribution An `<epidist>` object or anonymous function for
#' the contact distribution. This is similar to the offspring distribution,
#' but describes the heterogeneity of contacts that are not infected.
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
#'   serial_interval = serial_interval,
#'   contact_distribution = contact_distribution
#' )
sim_contacts <- function(R,
                         serial_interval,
                         contact_distribution,
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
      inherits(serial_interval, c("function", "epidist")) &&
      inherits(contact_distribution, c("function", "epidist"))
  )
  serial_interval <- as.function(serial_interval, func_type = "generate")
  contact_distribution <- as.function(
    contact_distribution,
    func_type = "generate"
  )

  .check_sim_input(
    sim_type = "contacts",
    R = R,
    serial_interval = serial_interval,
    outbreak_start_date = outbreak_start_date,
    min_outbreak_size = min_outbreak_size,
    contact_distribution = contact_distribution,
    contact_tracing_status_probs = contact_tracing_status_probs,
    population_age = population_age
  )

  chain <- .sim_bp_linelist(
    R = R,
    serial_interval = serial_interval,
    outbreak_start_date = outbreak_start_date,
    min_outbreak_size = min_outbreak_size,
    population_age = population_age,
    config = config
  )

  chain <- .add_names(.data = chain)

  contacts <- .sim_contacts_tbl(
    .data = chain,
    outbreak_start_date = outbreak_start_date,
    contact_distribution = contact_distribution,
    population_age = population_age,
    contact_tracing_status_probs = contact_tracing_status_probs,
    config = config
  )

  # return line list
  contacts
}
