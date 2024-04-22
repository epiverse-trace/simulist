suppressMessages({
  contact_distribution <- epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "contact distribution",
    prob_distribution = "pois",
    prob_distribution_params = c(mean = 2)
  )

  infect_period <- epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "infectious period",
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
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death
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
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_risk = age_dep_hosp_risk,
      hosp_death_risk = age_dep_hosp_death_risk,
      non_hosp_death_risk = age_dep_non_hosp_death_risk
    )
  )
})

test_that("sim_linelist works as expected without Ct", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      add_ct = FALSE
    )
  )
})

test_that("sim_linelist works as expected with anonymous", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      add_names = FALSE
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
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      population_age = age_struct
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
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_risk = age_dep_hosp_risk,
      population_age = age_struct
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
    contact_distribution = contact_distribution,
    infect_period = infect_period,
    prob_infect = 0.5,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = onset_to_death,
    population_age = age_struct,
    outbreak_size = c(500, 5000)
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
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        last_contact_distribution = "geom",
        last_contact_distribution_params = c(prob = 0.5)
      )
    )
  )
})

test_that("sim_linelist works as expected with modified config parameters", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        last_contact_distribution_params = c(lambda = 5)
      )
    )
  )
})

test_that("sim_linelist warns as expected", {
  set.seed(1)
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      outbreak_size = c(5, 10)
    ),
    regexp = "(Number of cases exceeds maximum)*(Returning data early)"
  )
})

test_that("sim_linelist fails as expected with modified config", {
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
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
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
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
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = list()
    ),
    regexp = "Network incorrectly specified, check config"
  )
})

test_that("sim_linelist fails as expected exceeding max iter for bp model", {
  set.seed(1)
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.1,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death
    ),
    regexp = "(Exceeded maximum number of iterations for simulating outbreak)"
  )
})

test_that("sim_linelist warns when risks are given by onset-to-event is NA", {
  set.seed(1)
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = NA,
      onset_to_death = onset_to_death,
      hosp_risk = 0.2
    ),
    regexp = "(onset_to_hosp is set to NA)*(hosp_risk is being ignored)"
  )
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NA,
      hosp_death_risk = 0.5
    ),
    regexp = paste0(
      "(onset_to_death is set to NA)*(hosp_death_risk is being ignored)*",
      "(non_hosp_death_risk is being ignored)"
    )
  )
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NA,
      non_hosp_death_risk = 0.02
    ),
    regexp = paste0(
      "(onset_to_death is set to NA)*(hosp_death_risk is being ignored)*",
      "(non_hosp_death_risk is being ignored)"
    )
  )
})

test_that("sim_linelist fails when onset-to-event are given by risk is NA", {
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_risk = NA
    ),
    regexp = "(hosp_risk is set to NA)*(but onset_to_hosp is specified)"
  )
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_death_risk = NA
    ),
    regexp = "(hosp_death_risk is set to NA but onset_to_death is specified)"
  )
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      non_hosp_death_risk = NA
    ),
    regexp = "(non_hosp_death_risk is set to NA)*(onset_to_death is specified)"
  )
})

test_that("sim_linest date_admission column is NA when onset_to_hosp is NA", {
  ll <- suppressWarnings(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = NA,
      onset_to_death = onset_to_death
    )
  )
  expect_true(all(is.na(ll$date_admission)))

  ll <- suppressWarnings(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = NA,
      onset_to_death = onset_to_death,
      hosp_risk = NA
    )
  )
  expect_true(all(is.na(ll$date_admission)))
})

test_that("sim_linest date_death column is NA when onset_to_death is NA", {
  ll <- suppressWarnings(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NA
    )
  )
  expect_true(all(is.na(ll$date_death)))

  ll <- sim_linelist(
    contact_distribution = contact_distribution,
    infect_period = infect_period,
    prob_infect = 0.5,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = NA,
    hosp_death_risk = NA,
    non_hosp_death_risk = NA
  )
  expect_true(all(is.na(ll$date_death)))
})

test_that("sim_linelist works as expected with time-varying cfr", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        time_varying_death_risk = function(risk, time) risk * exp(-time)
      )
    )
  )
})

test_that("sim_linelist works as expected with time-varying cfr & age-strat", {
  set.seed(1)
  age_dep_hosp_death_risk <- data.frame(
    age_limit = c(1, 5, 80),
    risk = c(0.1, 0.05, 0.2)
  )
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_death_risk = age_dep_hosp_death_risk,
      config = create_config(
        time_varying_death_risk = function(risk, time) risk * exp(-time)
      )
    )
  )
})

test_that("sim_linelist fails as expected with time-varying cfr", {
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        time_varying_death_risk = function(x, y, z) x + y + x
      )
    ),
    regexp = "(Anonymous functions supplied must have)*(2)*(argument)"
  )
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        time_varying_death_risk = function(risk, time) risk * exp(time)
      )
    ),
    regexp = "(Time-varying)*(risk outside)*(0)*(1)*(Check time-varying func)",
  )
})
