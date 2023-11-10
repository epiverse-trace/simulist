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

  contact_distribution <- epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "contact_distribution",
    prob_distribution = "pois",
    prob_distribution_params = c(l = 5)
  )
})

test_that("sim_outbreak works as expected", {
  set.seed(1)
  outbreak <- sim_outbreak(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    contact_distribution = contact_distribution
  )

  expect_type(outbreak, type = "list")
  expect_s3_class(outbreak$linelist, class = "data.frame")
  expect_s3_class(outbreak$contacts, class = "data.frame")
  expect_identical(dim(outbreak$linelist), c(42L, 10L))
  expect_identical(dim(outbreak$contacts), c(163L, 8L))
  expect_identical(
    colnames(outbreak$linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact"
    )
  )
  expect_identical(
    colnames(outbreak$contacts),
    c(
      "from", "to", "cnt_age", "cnt_gender", "date_first_contact",
      "date_last_contact", "was_case", "status"
    )
  )
})

test_that("sim_outbreak works as expected with add_names = FALSE", {
  set.seed(1)
  outbreak <- sim_outbreak(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    contact_distribution = contact_distribution,
    add_names = FALSE
  )

  expect_type(outbreak, type = "list")
  expect_s3_class(outbreak$linelist, class = "data.frame")
  expect_s3_class(outbreak$contacts, class = "data.frame")
  expect_identical(dim(outbreak$linelist), c(42L, 9L))
  expect_identical(dim(outbreak$contacts), c(168L, 8L))
  expect_identical(
    colnames(outbreak$linelist),
    c(
      "id", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact"
    )
  )
  expect_identical(
    colnames(outbreak$contacts),
    c(
      "from", "to", "cnt_age", "cnt_gender", "date_first_contact",
      "date_last_contact", "was_case", "status"
    )
  )
})

test_that("sim_outbreak works as expected with age-strat rates", {
  age_dep_hosp_rate <- data.frame(
    age_limit = c(1, 5, 80),
    rate = c(0.1, 0.05, 0.2)
  )
  age_dep_hosp_death_rate <- data.frame(
    age_limit = c(1, 5, 80),
    rate = c(0.1, 0.05, 0.2)
  )
  age_dep_non_hosp_death_rate <- data.frame(
    age_limit = c(1, 5, 80),
    rate = c(0.05, 0.025, 0.1)
  )
  set.seed(1)
  outbreak <- sim_outbreak(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    contact_distribution = contact_distribution,
    hosp_rate = age_dep_hosp_rate,
    hosp_death_rate = age_dep_hosp_death_rate,
    non_hosp_death_rate = age_dep_non_hosp_death_rate
  )

  expect_type(outbreak, type = "list")
  expect_s3_class(outbreak$linelist, class = "data.frame")
  expect_s3_class(outbreak$contacts, class = "data.frame")
  expect_identical(dim(outbreak$linelist), c(42L, 10L))
  expect_identical(dim(outbreak$contacts), c(177L, 8L))
  expect_identical(
    colnames(outbreak$linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact"
    )
  )
  expect_identical(
    colnames(outbreak$contacts),
    c(
      "from", "to", "cnt_age", "cnt_gender", "date_first_contact",
      "date_last_contact", "was_case", "status"
    )
  )
})

test_that("sim_outbreak works as expected with age structure", {
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  set.seed(1)
  outbreak <- sim_outbreak(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    contact_distribution = contact_distribution,
    population_age = age_struct
  )

  expect_type(outbreak, type = "list")
  expect_s3_class(outbreak$linelist, class = "data.frame")
  expect_s3_class(outbreak$contacts, class = "data.frame")
  expect_identical(dim(outbreak$linelist), c(42L, 10L))
  expect_identical(dim(outbreak$contacts), c(177L, 8L))
  expect_identical(
    colnames(outbreak$linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact"
    )
  )
  expect_identical(
    colnames(outbreak$contacts),
    c(
      "from", "to", "cnt_age", "cnt_gender", "date_first_contact",
      "date_last_contact", "was_case", "status"
    )
  )
})
