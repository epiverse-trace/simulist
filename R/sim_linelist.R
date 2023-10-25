#' Simulate a linelist
#'
#' @description The linelist is simulated using a branching process and
#' parameterised with previously published epidemiological parameters.
#'
#' @details For age-stratified hospitalised and death rates a `<data.frame>`
#' will need to be passed to the `hosp_rate` and/or `hosp_death_rate`
#' arguments. This `<data.frame>` should have three columns:
#' * `min_age`: a column with one `numeric` per cell for the minimum age of
#' the age group (inclusive).
#' * `max_age`: a column with one `numeric` per cell for the maximum age of
#' the age group (exclusive).
#' * `rate`: a column with one `numeric` per cell for the proportion
#' (or probability) of hospitalisation for that age group. Should be between
#' 0 and 1.
#'
#'
#' @param R A single `numeric` for the reproduction number.
#' @param serial_interval An `<epidist>` object for the serial interval.
#' @param onset_to_hosp An `<epidist>` object for the onset to hospitalisation
#' delay distribution.
#' @param onset_to_death An `<epidist>` object for the onset to death delay
#' distribution.
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
#' of the linelist. Default is `TRUE`.
#' @param add_ct A `logical` boolean for whether to add Ct values to each row
#' of the linelist. Default is `FALSE`.
#' @param min_chain_size A single `numeric` defining the minimum chain size for
#' the simulated outbreak. Default is `10`. This can be increased when the
#' function should simulate a larger outbreak.
#' @param age_range A `numeric` vector with two elements. The first is the lower
#' bound for the age range, and and the second is the upper bound for the age
#' range (both inclusive, i.e. \[lower, upper\]).
#' @param case_type_probs A named `numeric` vector with the probability of
#' each case type. The names of the vector must be `"suspected"`, `"probable"`,
#' `"confirmed"`. Values of each case type must sum to one.
#' @param config A list of settings to adjust the randomly sampled delays and
#' Ct values (if `add_ct = TRUE`). See [create_config()] for more information.
#' @param ... [dots] Extra arguments to be passed to other functions.
#' **Currently not used and will return a warning if extra arguments are
#' supplied**.
#'
#' @return A linelist `<data.frame>`
#' @export
#'
#' @author Joshua W. Lambert, Carmen Tamayo
#'
#' @examples
#' # load data required to simulate linelist
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
#'
#' # example with age-stratified hospitalisation rate
#' # 20% for over 80s
#' # 10% for under 5s
#' # 5% for the rest
#' age_dep_hosp_rate <- data.frame(
#'   min_age = c(1, 5, 80),
#'   max_age = c(5, 80, 90),
#'   rate = c(0.1, 0.05, 0.2)
#' )
#' linelist <- sim_linelist(
#'   R = 1.1,
#'   serial_interval = serial_interval,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death,
#'   hosp_rate = age_dep_hosp_rate
#' )
sim_linelist <- function(R, # nolint cyclocomp
                         serial_interval,
                         onset_to_hosp,
                         onset_to_death,
                         hosp_rate = 0.2,
                         hosp_death_rate = 0.5,
                         non_hosp_death_rate = 0.05,
                         outbreak_start_date = as.Date("2023-01-01"),
                         add_names = TRUE,
                         add_ct = FALSE,
                         min_chain_size = 10,
                         age_range = c(1, 90),
                         case_type_probs = c(
                           suspected = 0.2,
                           probable = 0.3,
                           confirmed = 0.5
                         ),
                         config = create_config(),
                         ...) {

  chkDots(...)

  # input checking
  checkmate::assert_number(R, lower = 0)
  checkmate::assert_class(serial_interval, classes = "epidist")
  checkmate::assert_class(onset_to_hosp, classes = "epidist")
  checkmate::assert_class(onset_to_death, classes = "epidist")
  checkmate::assert_date(outbreak_start_date)
  checkmate::assert_logical(add_names, len = 1)
  checkmate::assert_logical(add_ct, len = 1)
  checkmate::assert_integerish(min_chain_size, lower = 1)
  checkmate::assert_numeric(age_range, len = 2)
  checkmate::assert_numeric(case_type_probs, len = 3)
  checkmate::assert_names(
    names(case_type_probs),
    permutation.of = c("suspected", "probable", "confirmed")
  )

  stopifnot(
    "The values in the case_type_prob vector must sum to 1" =
      sum(case_type_probs) == 1,
    "hosp_rate must be a single numeric or a data.frame" =
      is.numeric(hosp_rate) && length(hosp_rate) == 1 ||
      is.data.frame(hosp_rate),
    "hosp_death_rate must be a single numeric or a data.frame" =
      is.numeric(hosp_death_rate) && length(hosp_death_rate) == 1 ||
      is.data.frame(hosp_death_rate),
    "non_hosp_death_rate must be a single numeric or a data.frame" =
      is.numeric(non_hosp_death_rate) && length(non_hosp_death_rate) == 1 ||
      is.data.frame(non_hosp_death_rate)
  )

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

  chain_size <- 0
  # condition on a minimum chain size
  while (chain_size < min_chain_size) {
    chain <- bpmodels::chain_sim(
      n = 1,
      offspring = "pois",
      stat = "size",
      serial = function(x) epiparameter::generate(serial_interval, x),
      lambda = R,
      tree = TRUE,
      infinite = 1000
    )
    chain_size <- max(chain$id)
  }

  names(chain)[names(chain) == "ancestor"] <- "infector"

  # add delays dates
  # this could be unrounded (check for error)
  chain$time_rounded <- round(chain$time)
  chain$onset_date <- chain$time + outbreak_start_date

  # add exposure date for cases
  id_time <- data.frame(infector = chain$id, infector_time = chain$time)

  # left join infector time to data preserving column and row order
  col_order <- c(colnames(chain), "infector_time")
  chain <- merge(chain, id_time, by = "infector", all.x = TRUE)
  chain <- chain[order(is.na(chain$infector), decreasing = TRUE), ]
  chain <- chain[col_order]
  rownames(chain) <- NULL

  chain <- .add_date_last_contact(
    .data = chain,
    outbreak_start_date = outbreak_start_date,
    distribution = config$last_contact_distribution,
    config$last_contact_distribution_params
  )
  chain <- .add_date_first_contact(
    .data = chain,
    distribution = config$first_contact_distribution,
    config$first_contact_distribution_params
  )

  # add random age and gender
  chain$gender <- sample(c("m", "f"), replace = TRUE, size = nrow(chain))
  chain$age <- sample(
    age_range[1]:age_range[2],
    replace = TRUE,
    size = nrow(chain)
  )

  chain <- .add_hospitalisation(
    .data = chain,
    onset_to_hosp = onset_to_hosp,
    hosp_rate = hosp_rate
  )
  chain <- .add_deaths(
    .data = chain,
    onset_to_death = onset_to_death,
    hosp_death_rate = hosp_death_rate,
    non_hosp_death_rate = non_hosp_death_rate
  )

  # add hospitalisation and death dates
  chain$hospitalisation_date <- chain$hosp_rounded + outbreak_start_date
  chain$death_date <- chain$death_rounded + outbreak_start_date

  linelist_cols <- c(
    "id", "case_type", "gender", "age", "onset_date", "hospitalisation_date",
    "date_first_contact", "date_last_contact"
  )

  if (add_names) {
    chain <- .add_names(.data = chain)
    linelist_cols <- append(linelist_cols, "case_name", after = 1)
  }

  # add confirmed, probable, suspected case types
  chain$case_type <- sample(
    x = names(case_type_probs),
    size = nrow(chain),
    replace = TRUE,
    prob = case_type_probs
  )


  # add Ct if confirmed
  if (add_ct) {
    chain <- .add_ct(
      .data = chain,
      distribution = config$ct_distribution,
      config$ct_distribution_params
    )
    linelist_cols <- c(linelist_cols, "ct_value")
  }

  chain <- chain[, linelist_cols]

  # return linelist
  chain
}
