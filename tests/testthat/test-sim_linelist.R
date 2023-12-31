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

test_that("sim_linelist works as expected", {
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 11L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact", "ct_value"
    )
  )
})

test_that("sim_linelist works as expected with age-strat risks", {
  age_dep_hosp_risk <- data.frame(
    age_limit = c(1, 5, 80),
    risk = c(0.1, 0.05, 0.2)
  )
  age_dep_hosp_death_risk <- data.frame(
    age_limit = c(1, 5, 80),
    risk = c(0.1, 0.05, 0.2)
  )
  age_dep_non_hosp_death_risk <- data.frame(
    age_limit = c(1, 5, 80),
    risk = c(0.05, 0.025, 0.1)
  )
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    hosp_risk = age_dep_hosp_risk,
    hosp_death_risk = age_dep_hosp_death_risk,
    non_hosp_death_risk = age_dep_non_hosp_death_risk
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 11L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact", "ct_value"
    )
  )
})

test_that("sim_linelist works as expected without Ct", {
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    add_ct = FALSE
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 10L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact"
    )
  )
})

test_that("sim_linelist works as expected with anonymous", {
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    add_names = FALSE
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 10L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact", "ct_value"
    )
  )
})

test_that("sim_linelist works as expected with age structure", {
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    population_age = age_struct
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 11L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact", "ct_value"
    )
  )
})

test_that("sim_linelist works as expected with age-strat risks & age struct", {
  age_dep_hosp_risk <- data.frame(
    age_limit = c(1, 5, 80),
    risk = c(0.1, 0.05, 0.2)
  )
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    hosp_risk = age_dep_hosp_risk,
    population_age = age_struct
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 11L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact", "ct_value"
    )
  )
})

test_that("sim_linelist gives expected proportion of ages with age struct", {
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.2, 0.5, 0.3),
    stringsAsFactors = FALSE
  )
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.5,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    population_age = age_struct
  )

  # as nrow -> Inf, sampled proportion -> age struct proportion
  # arbitrary tol used but given approximation for correct proportion
  expect_equal(
    sum(linelist$age < 5) / (length(linelist$age)),
    expected = 0.2,
    tolerance = 0.1
  )
  expect_equal(
    sum(linelist$age > 4 & linelist$age < 80) / (length(linelist$age)),
    expected = 0.5,
    tolerance = 0.1
  )
  expect_equal(
    sum(linelist$age > 79) / (length(linelist$age)),
    expected = 0.3,
    tolerance = 0.1
  )
})

test_that("sim_linelist works as expected with modified config", {
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    config = create_config(
      last_contact_distribution = "geom",
      last_contact_distribution_params = c(prob = 0.5)
    )
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 11L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact", "ct_value"
    )
  )
})

test_that("sim_linelist works as expected with modified config parameters", {
  set.seed(1)
  linelist <- sim_linelist(
    R = 1.1,
    serial_interval = serial_interval,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    config = create_config(
      last_contact_distribution_params = c(lambda = 5)
    )
  )

  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 11L))
  expect_identical(
    colnames(linelist),
    c(
      "id", "case_name", "case_type", "gender", "age", "date_onset",
      "date_admission", "date_death", "date_first_contact",
      "date_last_contact", "ct_value"
    )
  )
})

test_that("sim_linelist fails as expected with modified config", {
  expect_error(
    sim_linelist(
      R = 1.1,
      serial_interval = serial_interval,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        last_contact_distribution = "geom"
      )
    ),
    regexp = "Incorrect parameterisation of distribution, check config"
  )

  expect_error(
    sim_linelist(
      R = 1.1,
      serial_interval = serial_interval,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      add_ct = TRUE,
      config = create_config(
        ct_distribution = "gamma"
      )
    ),
    regexp = "(arg)*(should be one of)"
  )
})

test_that("sim_linelist fails as expected with empty config", {
  expect_error(
    sim_linelist(
      R = 1.1,
      serial_interval = serial_interval,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = list()
    ),
    regexp = "Distribution parameters are missing, check config"
  )
})

test_that("sim_linelist fails as expected exceeding max iter for bpmodel", {
  set.seed(1)
  expect_error(
    sim_linelist(
      R = 0.2,
      serial_interval = serial_interval,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death
    ),
    regexp = "(Exceeded maximum number of iterations for simulating outbreak)"
  )
})
