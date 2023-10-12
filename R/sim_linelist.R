#' Simulate a linelist
#'
#' @description The linelist is simulated using a branching process and
#' parameterised with previously published epidemiological parameters.
#'
#' @param R A single `numeric` for the reproduction number.
#' @param serial_interval An `<epidist>` object for the serial interval.
#' @param onset_to_hosp An `<epidist>` object for the onset to hospitalisation
#' delay distribution.
#' @param onset_to_death An `<epidist>` object for the onset to death delay
#' distribution.
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
#' @param hosp_rate A `list` for the age-stratified hospitalisation rate.
#' **Currently not implemented**.
#' @param hosp_to_death_rate A `list` for the age-stratified rate at which
#' those admitted to hospital go onto die. **Currently not implemented**.
#' @param include_contacts A `logical` boolean to determine whether contacts
#' are added to the linelist. **Currently not implmented**.
#' @param ... [dots] Extra arguments to be passed to other functions.
#' **Currently not used and will return a warning if extra arguments are
#' supplied**.
#'
#' @return A linelist `<data.frame>`
#' @export
sim_linelist <- function(R,
                         serial_interval,
                         onset_to_hosp,
                         onset_to_death,
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
                         hosp_rate = list(), # basic version is non-stratified by age. this argument lets users add it
                         hosp_to_death_rate = list(), # basic version should not include this, let user modify
                         include_contacts = FALSE, # WIP
                         ...) {

  chkDots(...)

  # Introducing % of hospitalisations- higher amongst older people and young kids
  # 20% for over 80s
  # 10% for under 5s
  # 5% for the rest

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
  checkmate::assert_list(hosp_rate)
  checkmate::assert_list(hosp_to_death_rate)
  checkmate::assert_numeric(case_type_probs, len = 3)
  checkmate::assert_names(
    names(case_type_probs),
    permutation.of = c("suspected", "probable", "confirmed")
  )

  stopifnot(
    "The values in the case_type_prob vector must sum to 1" =
      sum(case_type_probs) == 1
  )

  chain_size <- 0
  # condition on a minimum chain size
  while(chain_size < min_chain_size) {
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

  names(chain)[names(chain) == "ancestor"] = "infector"

  # add delays dates
  chain$time_rounded <- round(chain$time) # this could be unrounded (check for error)
  chain$onset_date <- chain$time + outbreak_start_date

  # add exposure date for cases
  id_time <- data.frame(infector = chain$id, infector_time = chain$time)
  chain <- dplyr::left_join(chain, id_time, by = "infector")

  chain <- .add_date_last_contact(
    .data = chain,
    outbreak_start_date = outbreak_start_date,
    distribution = "pois",
    rate = 3
  )
  chain <- .add_date_first_contact(
    .data = chain,
    distribution = "pois",
    rate = 3
  )
  chain <- .add_hospitalisation(.data = chain, onset_to_hosp = onset_to_hosp)
  chain <- .add_deaths(.data = chain, onset_to_death = onset_to_death)

  # add random age and gender
  chain$gender <- sample(c("m", "f"), replace = TRUE, size = nrow(chain))
  chain$age <- sample(
    age_range[1]:age_range[2],
    replace = TRUE,
    size = nrow(chain)
  )

  # death and hospitalisation are age-dependent

  # Introducing % of hospitalisations- higher amongst older people and young kids
  # 20% for over 80s
  # 10% for under 5s
  # 5% for the rest

  ## TODO change this to allow user to modify hospitalisation rates

  over_80s <- which(chain$age >= 80)
  over_80s_sample <- sample(over_80s, replace = FALSE, size = 0.8*length(over_80s))
  chain$hosp_rounded[over_80s_sample] <- NA

  under_5s <- which(chain$age <= 5)
  under_5s_sample <- sample(under_5s, replace = FALSE, size = 0.9*length(under_5s))
  chain$hosp_rounded[under_5s_sample] <- NA

  rest <- which(chain$age > 5 & chain$age < 80)
  rest_sample <- sample(rest, replace = FALSE, size = 0.95*length(rest))
  chain$hosp_rounded[rest_sample] <- NA

  # Introducing a % of deaths, higher among hospitalised people
  # Death rate in the hospital by age
  # over 80s: 50%
  # under 5s: 50%
  # rest: 3%

  over_80s_hosp <- which(chain$age >= 80 & !is.na(chain$hosp_rounded))
  over_80s_hosp_dead <- sample(over_80s_hosp, replace = FALSE, size = length(over_80s_hosp) * 0.5)
  chain$death_rounded[over_80s_hosp_dead] <- NA

  under_5s_hosp <- which(chain$age <= 5 & !is.na(chain$hosp_rounded))
  under_5s_hosp_dead <- sample(under_5s_hosp, replace = FALSE, size = length(under_5s_hosp) * 0.5)
  chain$death_rounded[under_5s_hosp_dead] <- NA

  rest_hosp <- which(chain$age > 5 & chain$age < 80 & !is.na(chain$hosp_rounded))
  rest_hosp_dead <- sample(rest_hosp, replace = FALSE, size = 0.97 * length(rest_hosp))
  chain$death_rounded[rest_hosp_dead] <- NA

  # Death rate outside the hospital by age
  # OVER 80s - 20%
  # Under 5s - 10%
  # Rest - 2%

  over_80s_nothosp <- which(chain$age >= 80 & is.na(chain$hosp_rounded))
  over80s_nothosp_sample <- sample(over_80s_nothosp, replace = FALSE, size = 0.8 * length(over_80s_nothosp))
  chain$death_rounded[over80s_nothosp_sample] <- NA

  under_5s_nothosp <- which(chain$age <= 5 & is.na(chain$hosp_rounded))
  under5s_nothosp_sample <- sample(under_5s_nothosp, replace = FALSE, size = 0.9 * length(under_5s_nothosp))
  chain$death_rounded[under5s_nothosp_sample] <- NA

  rest_nothosp <- which(chain$age > 5 & chain$age < 80 & is.na(chain$hosp_rounded))
  rest_nothosp_sample <- sample(rest_nothosp, replace = F, size = 0.98 * length(rest_nothosp))
  chain$death_rounded[rest_nothosp_sample] <- NA

  # add hospitalisation and death dates
  chain$hospitalisation_date <- chain$hosp_rounded + outbreak_start_date
  chain$death_date <- chain$death_rounded + outbreak_start_date

  if (add_names) {
    chain <- .add_names(.data = chain)
  }

  # add confirmed, probable, suspected case types
  chain$case_type <- sample(
    x = names(case_type_probs),
    size = nrow(chain),
    replace = TRUE,
    prob = case_type_probs
  )

  # add Ct if confirmed
  chain <- .add_ct(.data = chain, distribution = "norm", mean = 25, sd = 2)

  if (include_contacts) {
    # TODO finalise create_contacts()
    contacts <- create_contacts(.data = chain)
  }

  linelist_cols <- c(
    "id", "gender", "age", "onset_date", "hospitalisation_date",
    "date_first_contact", "date_last_contact"
  )
  chain <- chain[, linelist_cols]

  # return linelist
  chain
}
