#' Simulate a line list
#'
#' @description The line list is simulated using a branching process and
#' parameterised with user defined epidemiological parameters.
#'
#' @details For age-stratified hospitalised and death rates a `<data.frame>`
#' will need to be passed to the `hosp_rate` and/or `hosp_death_rate`
#' arguments. This `<data.frame>` should have two columns:
#' * `age_limit`: a column with one `numeric` per cell for the lower bound
#' (minimum) age of the age group (inclusive).
#' * `rate`: a column with one `numeric` per cell for the proportion
#' (or probability) of hospitalisation for that age group. Should be between
#' 0 and 1.
#'
#' For an age structured population, a `<data.frame>` with two columns:
#' * `age_range`: a column with characters specifying the lower and upper bound
#'  of that age group, separated by a hyphen (-). Both bounds are inclusive
#' (integers). For example, an age group of one to ten would be given as
#' `"1-10"`.
#' * `proportion`: a column with the proportion of the population that are in
#' that age group. Proportions must sum to one.
#'
#'
#' @param R A single `numeric` for the reproduction number.
#' @param serial_interval An `<epidist>` object or anonymous function for
#' the serial interval.
#' @param onset_to_hosp An `<epidist>` object or anonymous function for
#' the onset to hospitalisation delay distribution.
#' @param onset_to_death An `<epidist>` object or anonymous function for
#' the onset to death delay distribution.
#' @param hosp_rate Either a single `numeric` for the hospitalisation rate of
#' everyone in the population, or a `<data.frame>` with age specific
#' hospitalisation rates. Default is 20% hospitalisation (`0.2`) for the entire
#' population. See details and examples for more information.
#' @param hosp_death_rate Either a single `numeric` for the death rate for
#' hospitalised individuals across the population, or a `<data.frame>` with age
#' specific hospitalised death rates. Default is 50% death rate in hospitals
#' (`0.5`) for the entire population. See details and examples for more
#' information.
#' @param non_hosp_death_rate Either a single `numeric` for the death rate for
#' outside of hospitals across the population, or a `<data.frame>` with age
#' specific death rates outside of hospitals. Default is 5% death rate outside
#' of hospitals  (`0.05`) for the entire population. See details and examples
#' for more information.
#' @param outbreak_start_date A `date` for the start of the outbreak.
#' @param add_names A `logical` boolean for whether to add names to each row
#' of the line list. Default is `TRUE`.
#' @param add_ct A `logical` boolean for whether to add Ct values to each row
#' of the line list. Default is `TRUE`.
#' @param min_chain_size A single `numeric` defining the minimum chain size for
#' the simulated outbreak. Default is `10`. This can be increased when the
#' function should simulate a larger outbreak.
#' @param population_age Either a `numeric` vector with two elements or a
#' `<data.frame>` with age structure in the population. Use a `numeric` vector
#' to specific the age range of the population, the first element is the lower
#' bound for the age range, and and the second is the upper bound for the age
#' range (both inclusive, i.e. \[lower, upper\]). The `<data.frame>` with
#' age groups and the proportion of the population in that group. See details
#' and examples for more information.
#' @param case_type_probs A named `numeric` vector with the probability of
#' each case type. The names of the vector must be `"suspected"`, `"probable"`,
#' `"confirmed"`. Values of each case type must sum to one.
#' @param config A list of settings to adjust the randomly sampled delays and
#' Ct values (if `add_ct = TRUE`). See [create_config()] for more information.
#' @param ... [dots] Extra arguments to be passed to other functions.
#' **Currently not used and will return a warning if extra arguments are
#' supplied**.
#'
#' @return A line list `<data.frame>`
#' @export
#'
#' @author Joshua W. Lambert, Carmen Tamayo
#'
#' @examples
#' # load data required to simulate line list
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
#' # example with single hospitalisation rate for entire population
#' linelist <- sim_linelist(
#'   R = 1.1,
#'   serial_interval = serial_interval,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death,
#'   hosp_rate = 0.5
#' )
#' head(linelist)
#'
#' # example with age-stratified hospitalisation rate
#' # 20% for over 80s
#' # 10% for under 5s
#' # 5% for the rest
#' age_dep_hosp_rate <- data.frame(
#'   age_limit = c(1, 5, 80),
#'   rate = c(0.1, 0.05, 0.2)
#' )
#' linelist <- sim_linelist(
#'   R = 1.1,
#'   serial_interval = serial_interval,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death,
#'   hosp_rate = age_dep_hosp_rate
#' )
#' head(linelist)
sim_linelist <- function(R,
                         serial_interval,
                         onset_to_hosp,
                         onset_to_death,
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
                         config = create_config(),
                         ...) {
  chkDots(...)

  serial_interval <- as.function(serial_interval, func_type = "generate")
  onset_to_hosp <- as.function(onset_to_hosp, func_type = "generate")
  onset_to_death <- as.function(onset_to_death, func_type = "generate")

  .check_sim_input(
    sim_type = "linelist",
    R = R,
    serial_interval = serial_interval,
    outbreak_start_date = outbreak_start_date,
    min_chain_size = min_chain_size,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    add_names = add_names,
    add_ct = add_ct,
    case_type_probs = case_type_probs,
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

  chain <- linelist$chain[, linelist$cols]

  # return line list
  chain
}
