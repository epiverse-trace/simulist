test_that(".check_risk_df works as expected", {
  age_dep_hosp_risk <- data.frame(
    age_limit = c(1, 5, 80),
    risk = c(0.1, 0.05, 0.2)
  )
  age_dep_hosp_risk <- .check_risk_df(
    age_dep_hosp_risk,
    age_range = c(lower = 1, upper = 90)
  )
  expect_s3_class(age_dep_hosp_risk, class = "data.frame")
  expect_identical(dim(age_dep_hosp_risk), c(3L, 3L))
  expect_identical(colnames(age_dep_hosp_risk), c("min_age", "max_age", "risk"))
  expect_identical(
    row.names(age_dep_hosp_risk),
    c("[1,5)", "[5,80)", "[80,90]")
  )
})

test_that(".check_risk_df fails as expected", {
  age_dep_hosp_risk <- data.frame(
    age_min = c(1, 5, 80),
    hosp_risk = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_risk_df(age_dep_hosp_risk, age_range = c(lower = 1, upper = 91)),
    regexp = "column names should be 'age_limit' & 'risk'"
  )

  age_dep_hosp_risk <- data.frame(
    age_limit = c(2, 5, 80),
    risk = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_risk_df(age_dep_hosp_risk, age_range = c(lower = 1, upper = 90)),
    regexp = "minimum age of lowest age group should match lower age range"
  )

  age_dep_hosp_risk <- data.frame(
    age_limit = c(1, 5, 90),
    risk = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_risk_df(age_dep_hosp_risk, age_range = c(lower = 1, upper = 90)),
    regexp =
      "lower bound of oldest age group must be lower than highest age range"
  )

  age_dep_hosp_risk <- data.frame(
    age_limit = c(1, 5, 80),
    risk = c(-0.1, 0.5, 1.1)
  )
  expect_error(
    .check_risk_df(age_dep_hosp_risk, age_range = c(lower = 1, upper = 90)),
    regexp = "risk should be between 0 and 1"
  )

  age_dep_hosp_risk <- data.frame(
    age_limit = c(1, 5, 5),
    risk = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_risk_df(age_dep_hosp_risk, age_range = c(lower = 1, upper = 90)),
    regexp = "age limit in risk data frame must be unique"
  )

  age_dep_hosp_risk <- data.frame(
    age_limit = c(1, 10, 80),
    risk = c(0.1, 0.05, NA)
  )
  expect_error(
    .check_risk_df(age_dep_hosp_risk, age_range = c(lower = 1, upper = 90)),
    regexp = "age limit or risk cannot be NA or NaN"
  )
})

test_that(".check_age_df works as expected", {
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  age_struct <- .check_age_df(age_struct)
  expect_s3_class(age_struct, class = "data.frame")
  expect_identical(dim(age_struct), c(3L, 3L))
  expect_identical(colnames(age_struct), c("min_age", "max_age", "proportion"))
})

test_that(".check_age_df fails as expected", {
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    percentage = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "column names should be 'age_range' & 'proportion'"
  )

  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, NA, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "age range or proportion cannot be NA or NaN"
  )

  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.3),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "proportions of each age bracket should sum to 1"
  )

  age_struct <- data.frame(
    age_range = c("1_4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "(all age groups should be separated with a)*(-)"
  )

  age_struct <- data.frame(
    age_range = c("1-4", "52-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "age groups should be contiguous"
  )
})

suppressMessages({
  contact_distribution <- as.function(epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "contact distribution",
    prob_distribution = "pois",
    prob_distribution_params = c(mean = 2)
  ))

  contact_interval <- as.function(epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "contact interval",
    prob_distribution = "gamma",
    prob_distribution_params = c(shape = 1, scale = 1)
  ))

  # get onset to hospital admission from {epiparameter} database
  onset_to_hosp <- as.function(epiparameter::epidist_db(
    disease = "COVID-19",
    epi_dist = "onset to hospitalisation",
    single_epidist = TRUE
  ))

  # get onset to death from {epiparameter} database
  onset_to_death <- as.function(epiparameter::epidist_db(
    disease = "COVID-19",
    epi_dist = "onset to death",
    single_epidist = TRUE
  ))
})

test_that(".check_sim_input works as expected", {
  chk <- .check_sim_input(
    sim_type = "outbreak",
    contact_distribution = contact_distribution,
    contact_interval = contact_interval,
    prob_infect = 0.5,
    outbreak_start_date = as.Date("2023-01-01"),
    min_outbreak_size = 10,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    add_names = TRUE,
    add_ct = FALSE,
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
    hosp_risk = 0.2,
    hosp_death_risk = 0.5,
    non_hosp_death_risk = 0.05,
    population_age = c(1, 90)
  )
  expect_type(chk, type = "character")
  expect_length(chk, n = 1)

  chk <- .check_sim_input(
    sim_type = "linelist",
    contact_distribution = contact_distribution,
    contact_interval = contact_interval,
    prob_infect = 0.5,
    outbreak_start_date = as.Date("2023-01-01"),
    min_outbreak_size = 10,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    add_names = TRUE,
    add_ct = FALSE,
    case_type_probs = c(
      suspected = 0.2,
      probable = 0.3,
      confirmed = 0.5
    ),
    hosp_risk = 0.2,
    hosp_death_risk = 0.5,
    non_hosp_death_risk = 0.05,
    population_age = c(1, 90)
  )
  expect_type(chk, type = "character")
  expect_length(chk, n = 1)

  chk <- .check_sim_input(
    sim_type = "contacts",
    contact_distribution = contact_distribution,
    contact_interval = contact_interval,
    prob_infect = 0.5,
    outbreak_start_date = as.Date("2023-01-01"),
    min_outbreak_size = 10,
    contact_tracing_status_probs = c(
      under_followup = 0.7,
      lost_to_followup = 0.2,
      unknown = 0.1
    ),
    population_age = c(1, 90)
  )
  expect_type(chk, type = "character")
  expect_length(chk, n = 1)
})

test_that(".check_sim_input fails as expected", {
  expect_error(
    .check_sim_input(sim_type = "random"),
    regexp = "(arg)*(should be one of)*(linelist)*(contacts)*(outbreak)"
  )
  expect_error(
    .check_sim_input(sim_type = "outbreak", contact_distribution = list(), prob_infect = 0.5),
    regexp = "(Assertion on)*(contact_distribution)*(failed)"
  )
  expect_error(
    .check_sim_input(sim_type = "outbreak", contact_distribution = contact_distribution, contact_interval = list(), prob_infect = 0.5),
    regexp = "(Assertion on)*(contact_interval)*(failed)"
  )
  expect_error(
    .check_sim_input(
      sim_type = "outbreak",
      contact_distribution = contact_distribution,
      contact_interval = contact_interval,
      prob_infect = 0.5,
      outbreak_start_date = "01-01-2023"
    ),
    regexp = "(Assertion on)*(outbreak_start_date)*(failed)"
  )
  expect_error(
    .check_sim_input(
      sim_type = "outbreak",
      contact_distribution = contact_distribution,
      contact_interval = contact_interval,
      prob_infect = 0.5,
      outbreak_start_date = as.Date("2023-01-01"),
      min_outbreak_size = "10"
    ),
    regexp = "(Assertion on)*(min_outbreak_size)*(failed)"
  )
})
