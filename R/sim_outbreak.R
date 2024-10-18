#' Simulate a line list and a contacts table
#'
#' @description The line list and contacts are simulated using a branching
#' process and parameterised with epidemiological parameters.
#'
#' @inherit sim_linelist details
#'
#' @inheritParams sim_linelist
#' @inheritParams sim_contacts
#'
#' @return A list with two elements:
#' 1. A line list `<data.frame>`
#' 2. A contacts `<data.frame>`
#' @export
#'
#' @author Joshua W. Lambert
#'
#' @examples
#' # quickly simulate an outbreak using the function defaults
#' outbreak <- sim_outbreak()
#' head(outbreak$linelist)
#' head(outbreak$contacts)
#'
#' # to simulate a more realistic outbreak load epiparameters from
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
#' # get onset to hospital admission from {epiparameter} database
#' onset_to_hosp <- epiparameter_db(
#'   disease = "COVID-19",
#'   epi_name = "onset to hospitalisation",
#'   single_epiparameter = TRUE
#' )
#'
#' # get onset to death from {epiparameter} database
#' onset_to_death <- epiparameter_db(
#'   disease = "COVID-19",
#'   epi_name = "onset to death",
#'   single_epiparameter = TRUE
#' )
#'
#' outbreak <- sim_outbreak(
#'   contact_distribution = contact_distribution,
#'   infectious_period = infectious_period,
#'   prob_infection = 0.5,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death
#' )
sim_outbreak <- function(contact_distribution = function(x) stats::dpois(x = x, lambda = 2), # nolint start line_length_linter
                         infectious_period = function(x) stats::rlnorm(n = x, meanlog = 2, sdlog = 0.5),
                         prob_infection = 0.5,
                         onset_to_hosp = function(x) stats::rlnorm(n = x, meanlog = 1.5, sdlog = 0.5),
                         onset_to_death = function(x) stats::rlnorm(n = x, meanlog = 2.5, sdlog = 0.5), # nolint end line_length_linter
                         onset_to_recovery = NULL,
                         hosp_risk = 0.2,
                         hosp_death_risk = 0.5,
                         non_hosp_death_risk = 0.05,
                         outbreak_start_date = as.Date("2023-01-01"),
                         anonymise = FALSE,
                         outbreak_size = c(10, 1e4),
                         population_age = c(1, 90),
                         case_type_probs = c(
                           suspected = 0.2,
                           probable = 0.3,
                           confirmed = 0.5
                         ),
                         contact_tracing_status_probs = c(
                           under_followup = 0.7,
                           lost_to_followup = 0.2,
                           unknown = 0.1
                         ),
                         config = create_config()) {
  # check and convert distribution to func if needed before .check_sim_input()
  funcs <- as_function(
    list(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      onset_to_recovery = onset_to_recovery
    )
  )
  contact_distribution <- funcs$contact_distribution
  infectious_period <- funcs$infectious_period
  onset_to_hosp <- funcs$onset_to_hosp
  onset_to_death <- funcs$onset_to_death
  onset_to_recovery <- funcs$onset_to_recovery

  .check_sim_input(
    sim_type = "outbreak",
    contact_distribution = contact_distribution,
    infectious_period = infectious_period,
    prob_infection = prob_infection,
    outbreak_start_date = outbreak_start_date,
    outbreak_size = outbreak_size,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery,
    anonymise = anonymise,
    case_type_probs = case_type_probs,
    contact_tracing_status_probs = contact_tracing_status_probs,
    hosp_risk = hosp_risk,
    hosp_death_risk = hosp_death_risk,
    non_hosp_death_risk = non_hosp_death_risk,
    population_age = population_age
  )
  .cross_check_sim_input(
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    hosp_risk = hosp_risk,
    hosp_death_risk = hosp_death_risk,
    non_hosp_death_risk = non_hosp_death_risk
  )

  if (is.data.frame(population_age)) {
    population_age <- .check_age_df(population_age)
    age_range <- c(
      lower = min(population_age[, "min_age"]),
      upper = max(population_age[, "max_age"])
    )
  } else {
    population_age <- sort(population_age)
    names(population_age) <- c("lower", "upper")
    age_range <- population_age
  }
  if (is.data.frame(hosp_risk)) {
    hosp_risk <- .check_risk_df(
      hosp_risk,
      age_range = age_range
    )
  }
  if (is.data.frame(hosp_death_risk)) {
    hosp_death_risk <- .check_risk_df(
      hosp_death_risk,
      age_range = age_range
    )
  }
  if (is.data.frame(non_hosp_death_risk)) {
    non_hosp_death_risk <- .check_risk_df(
      non_hosp_death_risk,
      age_range = age_range
    )
  }

  outbreak <- .sim_internal(
    sim_type = "outbreak",
    contact_distribution = contact_distribution,
    infectious_period = infectious_period,
    prob_infection = prob_infection,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery,
    hosp_risk = hosp_risk,
    hosp_death_risk = hosp_death_risk,
    non_hosp_death_risk = non_hosp_death_risk,
    outbreak_start_date = outbreak_start_date,
    anonymise = anonymise,
    outbreak_size = outbreak_size,
    population_age = population_age,
    case_type_probs = case_type_probs,
    contact_tracing_status_probs = contact_tracing_status_probs,
    config = config
  )

  # return list of line list and contacts table
  outbreak
}
