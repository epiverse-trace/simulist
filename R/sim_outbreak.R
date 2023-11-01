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
sim_outbreak <- function(R, # nolint cyclocomp
                         serial_interval,
                         onset_to_hosp,
                         onset_to_death,
                         contact_distribution,
                         hosp_rate = 0.2,
                         hosp_death_rate = 0.5,
                         non_hosp_death_rate = 0.05,
                         outbreak_start_date = as.Date("2023-01-01"),
                         add_names = TRUE,
                         add_ct = FALSE,
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

  # input checking
  checkmate::assert_number(R, lower = 0)
  checkmate::assert_class(serial_interval, classes = "epidist")
  checkmate::assert_class(onset_to_hosp, classes = "epidist")
  checkmate::assert_class(onset_to_death, classes = "epidist")
  checkmate::assert_class(contact_distribution, classes = "epidist")
  checkmate::assert_date(outbreak_start_date)
  checkmate::assert_logical(add_names, len = 1)
  checkmate::assert_logical(add_ct, len = 1)
  checkmate::assert_integerish(min_chain_size, lower = 1)
  checkmate::assert_numeric(case_type_probs, len = 3)
  checkmate::assert_names(
    names(case_type_probs),
    permutation.of = c("suspected", "probable", "confirmed")
  )
  checkmate::assert_numeric(contact_tracing_status_probs, len = 3)
  checkmate::assert_names(
    names(contact_tracing_status_probs),
    permutation.of = c("under_followup", "lost_to_followup", "unknown")
  )

  stopifnot(
    "The values in the case_type_prob vector must sum to 1" =
      sum(case_type_probs) == 1,
    "The values in the contact_tracing_status_probs vector must sum to 1" =
      all.equal(sum(contact_tracing_status_probs), 1),
    "hosp_rate must be a single numeric or a data.frame" =
      is.numeric(hosp_rate) && length(hosp_rate) == 1 ||
      is.data.frame(hosp_rate),
    "hosp_death_rate must be a single numeric or a data.frame" =
      is.numeric(hosp_death_rate) && length(hosp_death_rate) == 1 ||
      is.data.frame(hosp_death_rate),
    "non_hosp_death_rate must be a single numeric or a data.frame" =
      is.numeric(non_hosp_death_rate) && length(non_hosp_death_rate) == 1 ||
      is.data.frame(non_hosp_death_rate),
    "population_age must be two numerics or a data.frame" =
      is.numeric(population_age) && length(population_age) == 2 ||
      is.data.frame(population_age)
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

  contacts <- .sim_contacts(
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
