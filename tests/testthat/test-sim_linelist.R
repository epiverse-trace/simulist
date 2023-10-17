suppressMessages({
  serial_interval <- epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "serial interval",
    prob_distribution = "gamma",
    prob_distribution_params = c(shape = 1, scale = 1)
  )

  # get onset to hospital admission from {epiparameter} database
  onset_to_hosp <- epiparameter::epidist_db(
    disease = "COVID-19",
    epi_dist = "onset to hospitalisation",
    single_epidist = TRUE
  )

  # get onset to death from {epiparameter} database
  onset_to_death <- epiparameter::epidist_db(
    disease = "COVID-19",
    epi_dist = "onset to death",
    single_epidist = TRUE
  )
})

test_that("sim_list works as expected", {
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 9L))
  expect_identical(
    colnames(linelist),
    c("id", "case_name", "case_type", "gender", "age", "onset_date",
      "hospitalisation_date", "date_first_contact", "date_last_contact")
  )
})

test_that("sim_list works as expected with age-strat rates", {
  age_dep_hosp_rate <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(5, 80, 90),
    rate = c(0.1, 0.05, 0.2)
  )
  age_dep_hosp_death_rate <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(5, 80, 90),
    rate = c(0.1, 0.05, 0.2)
  )
  age_dep_non_hosp_death_rate <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(5, 80, 90),
    rate = c(0.05, 0.025, 0.1)
  )
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    hosp_rate = age_dep_hosp_rate,
    hosp_death_rate = age_dep_hosp_death_rate,
    non_hosp_death_rate = age_dep_non_hosp_death_rate
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 9L))
  expect_identical(
    colnames(linelist),
    c("id", "case_name", "case_type", "gender", "age", "onset_date",
      "hospitalisation_date", "date_first_contact", "date_last_contact")
  )
})

test_that("sim_list works as expected with Ct", {
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    add_ct = TRUE
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 10L))
  expect_identical(
    colnames(linelist),
    c("id", "case_name", "case_type", "gender", "age", "onset_date",
      "hospitalisation_date", "date_first_contact", "date_last_contact",
      "ct_value")
  )
})

test_that("sim_list fails as expected for include_contacts = TRUE while WIP", {
  expect_error(
    sim_linelist(
      R = 1.1,
      serial_interval = serial_interval,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death, include_contacts = TRUE
    ),
    regexp = "Including contacts is not currently supported in \\{simulist\\}" # nolint not a file path
  )
})
