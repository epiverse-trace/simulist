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
#' contact_interval <- epiparameter::epidist(
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
#' outbreak <- sim_outbreak(
#'   mean_contacts = 2,
#'   contact_interval = contact_interval,
#'   prob_infect = 0.5,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death
#' )
sim_outbreak <- function(mean_contacts,
                         contact_interval,
                         prob_infect,
                         onset_to_hosp,
                         onset_to_death,
                         hosp_risk = 0.2,
                         hosp_death_risk = 0.5,
                         non_hosp_death_risk = 0.05,
                         outbreak_start_date = as.Date("2023-01-01"),
                         add_names = TRUE,
                         add_ct = TRUE,
                         min_outbreak_size = 10,
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
  stopifnot(
    "Input delay distributions need to be either functions or <epidist>" =
      inherits(contact_interval, c("function", "epidist")) &&
      inherits(onset_to_hosp, c("function", "epidist")) &&
      inherits(onset_to_death, c("function", "epidist"))
  )
  contact_interval <- as.function(contact_interval, func_type = "generate")
  onset_to_hosp <- as.function(onset_to_hosp, func_type = "generate")
  onset_to_death <- as.function(onset_to_death, func_type = "generate")

  .check_sim_input(
    sim_type = "outbreak",
    mean_contacts = mean_contacts,
    contact_interval = contact_interval,
    prob_infect = prob_infect,
    outbreak_start_date = outbreak_start_date,
    min_outbreak_size = min_outbreak_size,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    add_names = add_names,
    add_ct = add_ct,
    case_type_probs = case_type_probs,
    contact_tracing_status_probs = contact_tracing_status_probs,
    hosp_risk = hosp_risk,
    hosp_death_risk = hosp_death_risk,
    non_hosp_death_risk = non_hosp_death_risk,
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

  chain <- .sim_bp_linelist(
    mean_contacts = mean_contacts,
    contact_interval = contact_interval,
    prob_infect = prob_infect,
    outbreak_start_date = outbreak_start_date,
    min_outbreak_size = min_outbreak_size,
    population_age = population_age,
    config = config
  )

  linelist <- .sim_clinical_linelist(
    chain = chain,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    hosp_risk = hosp_risk,
    hosp_death_risk = hosp_death_risk,
    non_hosp_death_risk = non_hosp_death_risk,
    outbreak_start_date = outbreak_start_date,
    add_names = add_names,
    add_ct = add_ct,
    case_type_probs = case_type_probs,
    config = config
  )

  contacts <- .sim_contacts_tbl(
    .data = linelist$chain,
    contact_tracing_status_probs = contact_tracing_status_probs
  )

  linelist$chain <- linelist$chain[linelist$chain$infected == "infected", ]
  chain <- linelist$chain[, linelist$cols]

  # return outbreak data
  list(
    linelist = chain,
    contacts = contacts
  )
}
