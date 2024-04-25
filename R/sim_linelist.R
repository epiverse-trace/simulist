#' Simulate a line list
#'
#' @description The line list is simulated using a branching process and
#' parameterised with user defined epidemiological parameters.
#'
#' @details For age-stratified hospitalised and death risks a `<data.frame>`
#' will need to be passed to the `hosp_risk` and/or `hosp_death_risk`
#' arguments. This `<data.frame>` should have two columns:
#' * `age_limit`: a column with one `numeric` per cell for the lower bound
#' (minimum) age of the age group (inclusive).
#' * `risk`: a column with one `numeric` per cell for the proportion
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
#' @param contact_distribution An `<epidist>` object or anonymous function for
#' the contact distribution. This is any discrete density function that
#' produces non-negative integers (including zero, \eqn{\mathbb{N}_0}) for the
#' number of contacts per infection.
#' @param infect_period An `<epidist>` object or anonymous function for
#' the infectious period. This defines the duration from becoming infectious
#' to no longer infectious. In the simulation, individuals are assumed to
#' become infectious immediately after being infected (the latency period is
#' assumed to be zero). The time intervals between an infected individual and
#' their contacts are assumed to be uniformly distributed within the
#' infectious period.
#' @param prob_infect A single `numeric` for the probability of a secondary
#' contact being infected by an infected primary contact.
#' @param onset_to_hosp An `<epidist>` object, an anonymous function for
#' the onset to hospitalisation delay distribution, or `NA` to not simulate
#' hospitalisation (admission) dates.
#' @param onset_to_death An `<epidist>` object, an anonymous function for
#' the onset to death delay distribution, or `NA` to not simulate dates for
#' individuals that died.
#' @param onset_to_recovery An `<epidist>` object, an anonymous function for
#' the onset to death delay distribution, or `NA` to not simulate dates for
#' individuals that recovered. Default is `NA` so by default cases that
#' recover get an `NA` in the `$date_outcome` line list column.
#' @param hosp_risk Either a single `numeric` for the hospitalisation risk of
#' everyone in the population, or a `<data.frame>` with age specific
#' hospitalisation risks Default is 20% hospitalisation (`0.2`) for the entire
#' population. If the `onset_to_hosp` argument is set to `NA` this argument
#' should also be set to `NA`. See details and examples for more information.
#' @param hosp_death_risk Either a single `numeric` for the death risk for
#' hospitalised individuals across the population, or a `<data.frame>` with age
#' specific hospitalised death risks Default is 50% death risk in hospitals
#' (`0.5`) for the entire population. If the `onset_to_death` argument is set
#' to `NA` this argument should also be set to `NA`. See details and examples
#' for more information. If a time-varying death risk is specified in the
#' `config` the `hosp_death_risk` is interpreted as the maximum risk across
#' the epidemic.
#' @param non_hosp_death_risk Either a single `numeric` for the death risk for
#' outside of hospitals across the population, or a `<data.frame>` with age
#' specific death risks outside of hospitals. Default is 5% death risk outside
#' of hospitals  (`0.05`) for the entire population. If the `onset_to_death`
#' argument is set to `NA` this argument should also be set to `NA`. See
#' details and examples for more information. If a time-varying death risk is
#' specified in the `config` the `non_hosp_death_risk` is interpreted as the
#' maximum risk across the epidemic.
#' @param outbreak_start_date A `date` for the start of the outbreak.
#' @param add_names A `logical` boolean for whether to add names to each row
#' of the line list. Default is `TRUE`.
#' @param outbreak_size A `numeric` vector of length 2 defining the minimum and
#' the maximum number of infected individuals for the simulated outbreak.
#' Default is `c(10, 1e4)`, so the minimum outbreak size is 10 infected
#' individuals, and the maximum outbreak size is 10,000 infected individuals.
#' Either number can be changed to increase or decrease the maximum or minimum
#' outbreak size to allow simulating larger or smaller outbreaks. If the
#' minimum outbreak size cannot be reached after running the simulation for
#' many iterations (internally) then the function errors, whereas if the
#' maximum outbreak size is exceeded the function returns the data early and a
#' warning stating how many cases and contacts are returned.
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
#' Ct values. See [create_config()] for more information.
#'
#' @return A line list `<data.frame>`
#' @export
#'
#' @author Joshua W. Lambert, Carmen Tamayo
#'
#' @examples
#' # load data required to simulate line list
#' contact_distribution <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "contact distribution",
#'   prob_distribution = "pois",
#'   prob_distribution_params = c(mean = 2)
#' )
#'
#' infect_period <- epiparameter::epidist(
#'   disease = "COVID-19",
#'   epi_dist = "infectious period",
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
#' # example with single hospitalisation risk for entire population
#' linelist <- sim_linelist(
#'   contact_distribution = contact_distribution,
#'   infect_period = infect_period,
#'   prob_infect = 0.5,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death,
#'   hosp_risk = 0.5
#' )
#' head(linelist)
#'
#' # example with age-stratified hospitalisation risk
#' # 20% for over 80s
#' # 10% for under 5s
#' # 5% for the rest
#' age_dep_hosp_risk <- data.frame(
#'   age_limit = c(1, 5, 80),
#'   risk = c(0.1, 0.05, 0.2)
#' )
#' linelist <- sim_linelist(
#'   contact_distribution = contact_distribution,
#'   infect_period = infect_period,
#'   prob_infect = 0.5,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death,
#'   hosp_risk = age_dep_hosp_risk
#' )
#' head(linelist)
sim_linelist <- function(contact_distribution,
                         infect_period,
                         prob_infect,
                         onset_to_hosp,
                         onset_to_death,
                         onset_to_recovery = NA,
                         hosp_risk = 0.2,
                         hosp_death_risk = 0.5,
                         non_hosp_death_risk = 0.05,
                         outbreak_start_date = as.Date("2023-01-01"),
                         add_names = TRUE,
                         outbreak_size = c(10, 1e4),
                         population_age = c(1, 90),
                         case_type_probs = c(
                           suspected = 0.2,
                           probable = 0.3,
                           confirmed = 0.5
                         ),
                         config = create_config()) {
  # check and convert distribution to func if needed before .check_sim_input()
  funcs <- as_function(
    list(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      onset_to_recovery = onset_to_recovery
    )
  )
  contact_distribution <- funcs$contact_distribution
  infect_period <- funcs$infect_period
  onset_to_hosp <- funcs$onset_to_hosp
  onset_to_death <- funcs$onset_to_death
  onset_to_recovery <- funcs$onset_to_recovery

  .check_sim_input(
    sim_type = "linelist",
    contact_distribution = contact_distribution,
    infect_period = infect_period,
    prob_infect = prob_infect,
    outbreak_start_date = outbreak_start_date,
    outbreak_size = outbreak_size,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery,
    add_names = add_names,
    case_type_probs = case_type_probs,
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

  linelist <- .sim_internal(
    sim_type = "linelist",
    contact_distribution = contact_distribution,
    infect_period = infect_period,
    prob_infect = prob_infect,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery,
    hosp_risk = hosp_risk,
    hosp_death_risk = hosp_death_risk,
    non_hosp_death_risk = non_hosp_death_risk,
    outbreak_start_date = outbreak_start_date,
    add_names = add_names,
    outbreak_size = outbreak_size,
    population_age = population_age,
    case_type_probs = case_type_probs,
    config = config
  )

  # return line list
  linelist
}
