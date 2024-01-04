#' Simulate a line list and a contacts table
#'
#' @description The line list and contacts are simulated using a branching
#' process and parameterised with previously published epidemiological
#' parameters.
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
#' # load data required to simulate outbreak data
#' serial_interval <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "serial interval",
#'   prob_distribution = "gamma",
#'   prob_distribution_params = c(shape = 1, scale = 1)
#' )
#'
#' # get onset to hospital admission from {epiparameter} database
#' onset_to_hosp <- epiparameter::epidist_db(
#'   disease = "COVID-19",
#'   epi_dist = "onset to hospitalisation",
#'   single_epidist = TRUE
#' )
#'
#' # get onset to death from {epiparameter} database
#' onset_to_death <- epiparameter::epidist_db(
#'   disease = "COVID-19",
#'   epi_dist = "onset to death",
#'   single_epidist = TRUE
#' )
#'
#' contact_distribution <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "contact_distribution",
#'   prob_distribution = "pois",
#'   prob_distribution_params = c(l = 5)
#' )
#'
#' outbreak <- sim_outbreak(
#'   R = 1.1,
#'   serial_interval = serial_interval,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death,
#'   contact_distribution = contact_distribution
#' )
sim_outbreak <- function(R,
                         serial_interval,
                         onset_to_hosp,
                         onset_to_death,
                         contact_distribution,
                         hosp_rate = 0.2,
                         hosp_death_rate = 0.5,
                         non_hosp_death_rate = 0.05,
                         outbreak_start_date = as.Date("2023-01-01"),
                         add_names = TRUE,
                         add_ct = TRUE,
                         min_chain_size = 10,
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
                         config = create_config(),
                         ...) {
  chkDots(...)

  # check and convert distribution to func if needed before .check_sim_input()
  stopifnot(
    "Input delay distributions need to be either functions or <epidist>" =
      (is.function(serial_interval) || inherits(serial_interval, "epidist")) &&
      (is.function(onset_to_hosp) || inherits(onset_to_hosp, "epidist")) &&
      (is.function(onset_to_death) || inherits(onset_to_death, "epidist")) &&
      (is.function(contact_distribution) ||
         inherits(contact_distribution, "epidist"))
  )
  serial_interval <- as.function(serial_interval, func_type = "generate")
  onset_to_hosp <- as.function(onset_to_hosp, func_type = "generate")
  onset_to_death <- as.function(onset_to_death, func_type = "generate")
  contact_distribution <- as.function(
    contact_distribution,
    func_type = "generate"
  )

  .check_sim_input(
    sim_type = "outbreak",
    R = R,
    serial_interval = serial_interval,
    outbreak_start_date = outbreak_start_date,
    min_chain_size = min_chain_size,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    contact_distribution = contact_distribution,
    add_names = add_names,
    add_ct = add_ct,
    case_type_probs = case_type_probs,
    contact_tracing_status_probs = contact_tracing_status_probs,
    hosp_rate = hosp_rate,
    hosp_death_rate = hosp_death_rate,
    non_hosp_death_rate = non_hosp_death_rate,
    population_age = population_age
  )

  if (is.data.frame(population_age)) {
    population_age <- .check_age_df(population_age)
    age_range <- c(
      min(population_age[, "min_age"]),
      max(population_age[, "max_age"])
    )
  } else {
    age_range <- population_age
  }
  if (is.data.frame(hosp_rate)) {
    hosp_rate <- .check_rate_df(
      hosp_rate,
      age_range = age_range
    )
  }
  if (is.data.frame(hosp_death_rate)) {
    hosp_death_rate <- .check_rate_df(
      hosp_death_rate,
      age_range = age_range
    )
  }
  if (is.data.frame(non_hosp_death_rate)) {
    non_hosp_death_rate <- .check_rate_df(
      non_hosp_death_rate,
      age_range = age_range
    )
  }

  chain <- .sim_bp_linelist(
    R = R,
    serial_interval = serial_interval,
    outbreak_start_date = outbreak_start_date,
    min_chain_size = min_chain_size,
    population_age = population_age,
    config = config
  )

  linelist <- .sim_clinical_linelist(
    chain = chain,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    hosp_rate = hosp_rate,
    hosp_death_rate = hosp_death_rate,
    non_hosp_death_rate = non_hosp_death_rate,
    outbreak_start_date = outbreak_start_date,
    add_names = add_names,
    add_ct = add_ct,
    case_type_probs = case_type_probs,
    config = config
  )

  contacts <- .sim_contacts_tbl(
    .data = linelist$chain,
    outbreak_start_date = outbreak_start_date,
    contact_distribution = contact_distribution,
    population_age = population_age,
    contact_tracing_status_probs = contact_tracing_status_probs,
    config = config
  )

  chain <- linelist$chain[, linelist$cols]

  # return outbreak data
  list(
    linelist = chain,
    contacts = contacts
  )
}
