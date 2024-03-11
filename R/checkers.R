#' Check if `<data.frame>` defining age-stratified hospitalisation or death risk
#' is correct
#'
#' @param x A `<data.frame>`.
#'
#' @return A `<data.frame>`, also called for error side-effects when input is
#' invalid.
#' @keywords internal
.check_risk_df <- function(x, age_range) {
  # check input
  stopifnot(
    "column names should be 'age_limit' & 'risk'" =
      setequal(c("age_limit", "risk"), colnames(x)),
    "minimum age of lowest age group should match lower age range" =
      age_range[["lower"]] == min(x$age_limit),
    "lower bound of oldest age group must be lower than highest age range" =
      age_range[["upper"]] > max(x$age_limit),
    "age limit or risk cannot be NA or NaN" =
      !anyNA(x),
    "risk should be between 0 and 1" =
      min(x$risk) >= 0 && max(x$risk) <= 1,
    "age limit in risk data frame must be unique" =
      anyDuplicated(x$age_limit) == 0
  )

  # order risk df on age_limit
  x <- x[order(x$age_limit), ]

  # format risk data frame
  age_range_ <- age_range[["lower"]]:age_range[["upper"]]
  # findInterval inclusive/exclusive bound rules match age bracket
  age_groups <- unname(split(age_range_, findInterval(age_range_, x$age_limit)))

  # add and sort data frames cols
  x$max_age <- vapply(age_groups, max, FUN.VALUE = numeric(1))
  colnames(x) <- c("min_age", "risk", "max_age")
  x <- x[, c("min_age", "max_age", "risk")]

  # add informative row names
  row.names(x) <- paste0(
    "[", x$min_age, ",", (x$max_age + 1), ")"
  )
  # last age bracket has inclusive upper bound
  row.names(x)[nrow(x)] <- paste0(
    "[", x$min_age[nrow(x)], ",", x$max_age[nrow(x)], "]"
  )

  # return risk data frame
  x
}

#' Check if `<data.frame>` defining age structure of population is correct
#'
#' @param x A `<data.frame>`.
#'
#' @return A `<data.frame>`, also called for error side-effects when input is
#' invalid.
#' @keywords internal
.check_age_df <- function(x) {
  # check input
  stopifnot(
    "column names should be 'age_range' & 'proportion'" =
      setequal(c("age_range", "proportion"), colnames(x)),
    "age range or proportion cannot be NA or NaN" =
      !anyNA(x),
    "proportions of each age bracket should sum to 1" =
      all.equal(sum(x$proportion), 1),
    "all age groups should be separated with a '-' (e.g. '1-5')" =
      all(grepl(pattern = "-", x = x$age_range, fixed = TRUE))
  )

  # extract bounds and groups
  age_bounds <- strsplit(x$age_range, split = "-", fixed = TRUE)
  age_bounds <- lapply(age_bounds, as.numeric)
  age_groups <- unlist(lapply(age_bounds, function(y) y[1]:y[2]))

  # check age input
  stopifnot(
    "age groups should be non-overlapping" =
      anyDuplicated(age_groups) == 0,
    "age groups should be contiguous" =
      all(min(age_groups):max(age_groups) %in% age_groups),
    "age groups should include only positive integers" =
      checkmate::test_integerish(unlist(age_bounds), lower = 0)
  )

  # add and sort data frames cols
  x <- data.frame(
    min_age = vapply(age_bounds, "[[", FUN.VALUE = numeric(1), 1),
    max_age = vapply(age_bounds, "[[", FUN.VALUE = numeric(1), 2),
    proportion = x$proportion
  )

  # return age data frame
  x
}

#' Check if arguments input to simulation function are valid
#'
#' @details Arguments that are used by all simulation functions are required
#' and not given a default value, for other arguments that are not inputs in
#' all simulation functions a default of `NULL` is used.
#'
#' Defaults mentioned in argument documentation is the default for the exported
#' simulation function and not the default in this checking function. In this
#' function there is either no default or `NULL`.
#'
#' @param sim_type A `character` string specifying which simulation function
#' this function is being called within.
#' @inheritParams sim_linelist
#' @inheritParams sim_contacts
#'
#' @return Invisibly return the `sim_type` `character` string. The function is
#' called for its side-effects, which will error if the input is invalid.
#' @keywords internal
.check_sim_input <- function(sim_type = c("linelist", "contacts", "outbreak"),
                             contact_distribution,
                             contact_interval,
                             prob_infect,
                             outbreak_start_date,
                             outbreak_size,
                             onset_to_hosp = NULL,
                             onset_to_death = NULL,
                             add_names = NULL,
                             add_ct = NULL,
                             case_type_probs = NULL,
                             contact_tracing_status_probs = NULL,
                             hosp_risk = NULL,
                             hosp_death_risk = NULL,
                             non_hosp_death_risk = NULL,
                             population_age = NULL) {
  sim_type <- match.arg(sim_type)

  checkmate::assert_number(prob_infect, lower = 0, upper = 1)
  .check_func_req_args(contact_distribution)
  .check_func_req_args(contact_interval)
  checkmate::assert_date(outbreak_start_date)
  checkmate::assert_integerish(outbreak_size, lower = 1, len = 2)

  stopifnot(
    "population_age must be two numerics or a data.frame" =
      checkmate::test_numeric(population_age, len = 2) ||
        is.data.frame(population_age)
  )

  if (sim_type %in% c("linelist", "outbreak")) {
    .check_func_req_args(onset_to_hosp)
    .check_func_req_args(onset_to_death)
    checkmate::assert_logical(add_names, len = 1)
    checkmate::assert_logical(add_ct, len = 1)
    checkmate::assert_numeric(case_type_probs, len = 3, lower = 0, upper = 1)
    checkmate::assert_names(
      names(case_type_probs),
      permutation.of = c("suspected", "probable", "confirmed")
    )

    stopifnot(
      "The values in the case_type_prob vector must sum to 1" =
        sum(case_type_probs) == 1,
      "hosp_risk must be a single numeric or a data.frame" =
        is.numeric(hosp_risk) && length(hosp_risk) == 1 ||
          is.data.frame(hosp_risk),
      "hosp_death_risk must be a single numeric or a data.frame" =
        is.numeric(hosp_death_risk) && length(hosp_death_risk) == 1 ||
          is.data.frame(hosp_death_risk),
      "non_hosp_death_risk must be a single numeric or a data.frame" =
        is.numeric(non_hosp_death_risk) && length(non_hosp_death_risk) == 1 ||
          is.data.frame(non_hosp_death_risk)
    )
  }

  if (sim_type %in% c("contacts", "outbreak")) {
    checkmate::assert_numeric(
      contact_tracing_status_probs, len = 3, lower = 0, upper = 1
    )
    checkmate::assert_names(
      names(contact_tracing_status_probs),
      permutation.of = c("under_followup", "lost_to_followup", "unknown")
    )

    stopifnot(
      "The values in the contact_tracing_status_probs vector must sum to 1" =
        all.equal(sum(contact_tracing_status_probs), 1)
    )
  }

  invisible(sim_type)
}

#' Check distribution function has n required arguments
#'
#' @param func A [function].
#' @param n_req_args A single `numeric` specifying the number of required
#' arguments.
#'
#' @return A `logical`.
#' @keywords internal
#' @noRd
.check_func_req_args <- function(func, n_req_args = 1) {
  checkmate::assert_function(func)
  checkmate::assert_count(n_req_args, positive = TRUE)
  # using formals(args(fn)) to allow checking args of builtin primitives
  # for which formals(fn) would return NULL and cause the check to error
  # errors non-informatively for specials such as `if`
  checkmate::test_function(func) &&
    sum(mapply(function(x, y) { # nolint undesirable function
      is.name(x) && y != "..."
    }, formals(args(func)), names(formals(args(func))))) == n_req_args
}
