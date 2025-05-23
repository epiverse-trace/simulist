#' Check if `<data.frame>` defining either age-stratified hospitalisation or
#' death risk, or defining age structure of population is correct
#'
#' @param x A `<data.frame>`.
#' @param df_type A `character` string, either `"risk"` or `"age"` to specify
#' which input `<data.frame>` is being checked.
#' @param age_range A `numeric` vector of length 2. Only required when
#' `df_type = risk`, `NULL` by default.
#'
#' @return A `<data.frame>`, also called for error side-effects when input is
#' invalid.
#' @keywords internal
.check_df <- function(x, df_type = c("risk", "age"), age_range = NULL) {
  df_type <- match.arg(df_type)
  col_name <- switch(df_type,
    risk = "risk",
    age = "proportion"
  )
  stopifnot(
    "Age limit in data frame must be unique" =
      anyDuplicated(x$age_limit) == 0
  )
  if (df_type == "risk") {
    stopifnot(
      "Column names should be 'age_limit' & 'risk'" =
        setequal(c("age_limit", col_name), colnames(x)),
      "Age limit or risk cannot be NA or NaN" =
        !anyNA(x),
      "`age_range` argument must be specified for risk <data.frame>" =
        !is.null(age_range),
      "Minimum age of lowest age group should match lower age range" =
        age_range[["lower"]] == min(x$age_limit),
      "Lower bound of oldest age group must be lower than highest age range" =
        age_range[["upper"]] > max(x$age_limit),
      "Risk should be between 0 and 1" =
        min(x$risk) >= 0 && max(x$risk) <= 1
    )
  } else {
    stopifnot(
      "Column names should be 'age_limit' & 'proportion'" =
        setequal(c("age_limit", col_name), colnames(x)),
      "Age limit or proportion cannot be NA or NaN" =
        !anyNA(x),
      "Minimum age of lowest age group must be greater than zero" =
        min(x$age_limit) > 0,
      "Proportions of each age bracket should sum to 1" =
        all.equal(sum(x$proportion), 1)
    )
  }

  # order risk df on age_limit
  x <- x[order(x$age_limit), ]

  if (df_type == "risk") {
    # format risk data frame
    age_range_ <- age_range[["lower"]]:age_range[["upper"]]
  } else {
    # extract bounds and groups
    age_range_ <- min(x$age_limit):max(x$age_limit)
  }

  # findInterval inclusive/exclusive bound rules match age bracket
  age_groups <- unname(split(age_range_, findInterval(age_range_, x$age_limit)))

  # add and sort data frames cols
  x$max_age <- vapply(age_groups, max, FUN.VALUE = numeric(1))
  colnames(x) <- c("min_age", col_name, "max_age")
  x <- x[, c("min_age", "max_age", col_name)]

  # add informative row names
  row.names(x) <- paste0(
    "[", x$min_age, ",", (x$max_age + 1), ")"
  )
  # last age bracket has inclusive upper bound
  row.names(x)[nrow(x)] <- paste0(
    "[", x$min_age[nrow(x)], ",", x$max_age[nrow(x)], "]"
  )
  # return data frame
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
.check_sim_input <- function(sim_type = c("linelist", "contacts", "outbreak"), # nolint cyclocomp_linter
                             contact_distribution,
                             infectious_period,
                             prob_infection,
                             outbreak_start_date,
                             outbreak_size,
                             onset_to_hosp = NULL,
                             onset_to_death = NULL,
                             onset_to_recovery = NULL,
                             anonymise = NULL,
                             case_type_probs = NULL,
                             contact_tracing_status_probs = NULL,
                             hosp_risk = NULL,
                             hosp_death_risk = NULL,
                             non_hosp_death_risk = NULL,
                             population_age = NULL) {
  sim_type <- match.arg(sim_type)

  checkmate::assert_number(prob_infection, lower = 0, upper = 1)
  .check_func_req_args(contact_distribution, func_name = "contact_distribution")
  .check_func_req_args(infectious_period, func_name = "infectious_period")
  checkmate::assert_date(outbreak_start_date)
  checkmate::assert_integerish(outbreak_size, lower = 1, len = 2)

  stopifnot(
    "population_age must be two numerics or a data.frame" =
      checkmate::test_numeric(population_age, len = 2) ||
      is.data.frame(population_age)
  )

  if (sim_type %in% c("linelist", "outbreak")) {
    .check_func_req_args(onset_to_hosp, func_name = "onset_to_hosp")
    .check_func_req_args(onset_to_death, func_name = "onset_to_death")
    .check_func_req_args(onset_to_recovery, func_name = "onset_to_recovery")
    checkmate::assert_logical(anonymise, len = 1)
    checkmate::assert_numeric(case_type_probs, len = 3, lower = 0, upper = 1)
    checkmate::assert_names(
      names(case_type_probs),
      permutation.of = c("suspected", "probable", "confirmed")
    )

    stopifnot(
      "The values in the case_type_prob vector must sum to 1" =
        sum(case_type_probs) == 1,
      "hosp_risk must be a single numeric or a data.frame" =
        is.numeric(hosp_risk) || is.data.frame(hosp_risk) ||
        is.null(hosp_risk),
      "hosp_death_risk must be a single numeric or a data.frame" =
        is.numeric(hosp_death_risk) || is.data.frame(hosp_death_risk) ||
        is.null(hosp_death_risk),
      "non_hosp_death_risk must be a single numeric or a data.frame" =
        is.numeric(non_hosp_death_risk) || is.data.frame(non_hosp_death_risk) ||
        is.null(non_hosp_death_risk)
    )
    if (is.numeric(hosp_risk)) {
      checkmate::assert_number(hosp_risk, lower = 0, upper = 1)
    }
    if (is.numeric(hosp_death_risk)) {
      checkmate::assert_number(hosp_death_risk, lower = 0, upper = 1)
    }
    if (is.numeric(non_hosp_death_risk)) {
      checkmate::assert_number(non_hosp_death_risk, lower = 0, upper = 1)
    }
  }

  if (sim_type %in% c("contacts", "outbreak")) {
    checkmate::assert_numeric(
      contact_tracing_status_probs,
      len = 3, lower = 0, upper = 1
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
.check_func_req_args <- function(func,
                                 func_name,
                                 n_req_args = 1,
                                 req_arg_names = NULL) {
  checkmate::assert_function(func)
  checkmate::assert_count(n_req_args, positive = TRUE)
  # using formals(args(fn)) to allow checking args of builtin primitives
  # for which formals(fn) would return NULL and cause the check to error
  # errors non-informatively for specials such as `if`
  valid_func <- checkmate::test_function(func) &&
    sum(mapply(function(x, y) { # nolint undesirable function
      is.name(x) && y != "..."
    }, formals(args(func)), names(formals(args(func))))) == n_req_args


  msg <- character(0)
  if (!valid_func) {
    msg <- c(msg, paste(
      func_name, "supplied must have", n_req_args, "arguments."
    ))
  }
  if (!is.null(req_arg_names) &&
      !identical(names(formals(func)), req_arg_names)) {
    msg <- c(msg, paste(
      func_name, "supplied must have", paste(req_arg_names, collapse = " & "),
      "arguments."
    ))
  }
  if (length(msg) > 0) {
    stop("\n", sprintf("  - %s\n", msg), call. = FALSE)
  }
}

#' Cross check the onset-to-hospitalisation or -death arguments are
#' compatible with hospitalisation and death risks
#'
#' @description
#' There are two types of cross-checking:
#' 1. If the onset-to-event distribution is specified but the corresponding risk
#' is not specified (i.e. `NULL`) the function will error ([stop()]).
#' 2. If the onset-to-event distribution is not specified (i.e. `NULL`) but the
#' corresponding risk is specified the function will throw a warning
#' ([warning()]).
#'
#' The difference in condition handling is because in the case that the
#' onset-to-event is `NULL` the simulation can safely ignore the corresponding
#' risk, while throwing a warning, as there are no events. In other words, if
#' the onset-to-hospitalisation is not specified, no infected individuals will
#' go to hospital and the `date_admission` column in the line list will all be
#' `NA`s. However, if the onset-to-event is specified and the corresponding
#' risk is `NULL` then the proportion of individuals infected that are
#' hospitalised or die cannot be calculated and therefore the simulation
#' cannot run. It is in this latter case that the cross-checking throws an
#' error.
#'
#' @inheritParams sim_linelist
#'
#' @return Invisibly return the `onset_to_hosp` argument. The function is
#' called for its side-effects, which will error or warn if the input is
#' invalid.
#' @keywords internal
.cross_check_sim_input <- function(onset_to_hosp, # nolint cyclocomp_linter
                                   onset_to_death,
                                   hosp_risk,
                                   hosp_death_risk,
                                   non_hosp_death_risk) {
  # hosp_risk, hosp_death_risk and non_hosp_death_risk can assumed to be a
  # number or a <data.frame> or NULL as they will have been checked by
  # .check_sim_input() before calling .cross_check_sim_input
  # onset_to_hosp and onset_to_death will be closures

  # check if onset_to_hosp and onset_to_death produce NA or numeric
  onset_to_hosp_eval <- onset_to_hosp(1)
  onset_to_death_eval <- onset_to_death(1)

  msg <- character(0)
  # risks can only be NULL when the onset to event is NA
  if (!rlang::is_lgl_na(onset_to_hosp_eval) && is.null(hosp_risk)) {
    msg <- c(msg, paste(
      "hosp_risk is set to NULL but onset_to_hosp is specified \n",
      "set hosp_risk to numeric value"
    ))
  }
  if (!rlang::is_lgl_na(onset_to_hosp_eval) &&
      !rlang::is_lgl_na(onset_to_death_eval) && is.null(hosp_death_risk)) {
    msg <- c(msg, paste(
      "hosp_death_risk is set to NULL but onset_to_hosp and onset_to_death",
      "is specified \n set hosp_death_risk to numeric value"
    ))
  }
  if (!rlang::is_lgl_na(onset_to_death_eval) && is.null(non_hosp_death_risk)) {
    msg <- c(msg, paste(
      "non_hosp_death_risk is set to NULL but onset_to_death is specified \n",
      "set non_hosp_death_risk to numeric value"
    ))
  }
  if (length(msg) > 0) {
    stop(
      "Some onset-to-event and their corresponding risk are incompatible:\n",
      sprintf("  - %s\n", msg),
      call. = FALSE
    )
  }

  if (rlang::is_lgl_na(onset_to_hosp_eval) &&
      checkmate::test_number(hosp_risk) ||
      rlang::is_lgl_na(onset_to_hosp_eval) && is.data.frame(hosp_risk)) {
    msg <- c(msg, paste(
      "onset_to_hosp is set to NULL but hosp_risk is specified \n",
      "hosp_risk is being ignored, set hosp_risk to NULL when",
      "onset_to_hosp is NULL"
    ))
  }
  if (rlang::is_lgl_na(onset_to_hosp_eval) &&
      checkmate::test_number(hosp_death_risk) ||
      rlang::is_lgl_na(onset_to_hosp_eval) && is.data.frame(hosp_death_risk)) {
    msg <- c(msg, paste(
      "onset_to_hosp is set to NULL but hosp_death_risk is specified \n",
      "hosp_death_risk is being ignored, set hosp_death_risk to NULL when",
      "onset_to_hosp is NULL"
    ))
  }
  if (rlang::is_lgl_na(onset_to_death_eval) &&
      checkmate::test_number(hosp_death_risk) ||
      rlang::is_lgl_na(onset_to_death_eval) && is.data.frame(hosp_death_risk)) {
    msg <- c(msg, paste(
      "onset_to_death is set to NULL but hosp_death_risk is specified \n",
      "hosp_death_risk is being ignored, set hosp_death_risk to NULL when",
      "onset_to_death is NULL"
    ))
  }
  if (rlang::is_lgl_na(onset_to_death_eval) &&
      checkmate::test_number(non_hosp_death_risk) ||
      rlang::is_lgl_na(onset_to_death_eval) &&
      is.data.frame(non_hosp_death_risk)) {
    msg <- c(msg, paste(
      "onset_to_death is set to NULL but non_hosp_death_risk is specified \n",
      "non_hosp_death_risk is being ignored, set non_hosp_death_risk to NULL",
      "when onset_to_death is NULL"
    ))
  }
  if (length(msg) > 0) {
    warning(
      "Some onset-to-event and their corresponding risk are incompatible:\n",
      sprintf("  - %s\n", msg),
      call. = FALSE
    )
  }

  invisible(onset_to_hosp)
}

#' Check if \R object is line list from [sim_linelist()]
#'
#' @details
#' This is a check that the object supplied to `linelist` is from the
#' [sim_linelist()] or [sim_outbreak()] functions, it is not related to
#' the class of the object, in other words, it does not check the object is
#' of class `<linelist>`.
#'
#' @inheritParams messy_linelist
#'
#' @return Invisibly return the `linelist` `<data.frame>`. The function is
#' called for its side-effects, which will error if the input is invalid.
#' @keywords internal
.check_linelist <- function(linelist) {
  stopifnot(
    "linelist must be a data.frame output from `sim_linelist()`." =
      is.data.frame(linelist) && ncol(linelist) == 13 &&
      setequal(
        colnames(linelist), c(
          "id", "case_name", "case_type", "sex", "age", "date_onset",
          "date_reporting", "date_admission", "outcome", "date_outcome",
          "date_first_contact", "date_last_contact", "ct_value"
        )
      ),
    "`linelist$date_reporting` column cannot contain any NAs." =
      !anyNA(linelist$date_reporting)
  )
  invisible(linelist)
}
