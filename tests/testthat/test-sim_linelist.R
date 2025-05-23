test_that("sim_linelist works as expected with defaults", {
  set.seed(1)
  expect_snapshot(sim_linelist())
})

contact_distribution <- function(x) stats::dpois(x = x, lambda = 2)
infectious_period <- function(x) stats::rgamma(n = x, shape = 1, scale = 1)
onset_to_hosp <- function(x) {
  stats::rlnorm(n = x, meanlog = 0.947, sdlog = 1.628)
}
onset_to_death <- function(x) {
  stats::rlnorm(n = x, meanlog = 2.863, sdlog = 0.534)
}

test_that("sim_linelist works as expected", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
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
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_risk = age_dep_hosp_risk,
      hosp_death_risk = age_dep_hosp_death_risk,
      non_hosp_death_risk = age_dep_non_hosp_death_risk
    )
  )
})

test_that("sim_linelist works as expected with anonymous", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      anonymise = TRUE
    )
  )
})

test_that("sim_linelist works as expected with age structure", {
  age_struct <- data.frame(
    age_limit = c(1, 5, 80, 90),
    proportion = c(0.1, 0.7, 0.2, 0)
  )
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
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
    age_limit = c(1, 5, 80, 90),
    proportion = c(0.1, 0.7, 0.2, 0)
  )
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_risk = age_dep_hosp_risk,
      population_age = age_struct
    )
  )
})

test_that("sim_linelist gives expected proportion of ages with age struct", {
  age_struct <- data.frame(
    age_limit = c(1, 5, 80, 90),
    proportion = c(0.2, 0.5, 0.3, 0)
  )
  set.seed(1)
  linelist <- sim_linelist(
    contact_distribution = contact_distribution,
    infectious_period = infectious_period,
    prob_infection = 0.5,
    onset_to_hosp = function(x) stats::rlnorm(n = x, meanlog = 1, sdlog = 0.5),
    onset_to_death = function(x) stats::rlnorm(n = x, meanlog = 2, sdlog = 0.5),
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
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        last_contact_distribution = function(x) stats::rgeom(n = x, prob = 0.5)
      )
    )
  )
})

test_that("sim_linelist works as expected with modified config parameters", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        last_contact_distribution = function(x) stats::rpois(n = x, lambda = 5)
      )
    )
  )
})

test_that("sim_linelist warns as expected", {
  set.seed(1)
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
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
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        last_contact_distribution = function(x) stats::rgeom(n = x, lambda = 1)
      )
    ),
    regexp = "(unused argument)*(lambda = 1)"
  )
})

test_that("sim_linelist fails as expected with empty config", {
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
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
      infectious_period = infectious_period,
      prob_infection = 0.1,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death
    ),
    regexp = "(Exceeded maximum number of iterations for simulating outbreak)"
  )
})

test_that("sim_linelist warns when risks are given by onset-to-event is NULL", {
  set.seed(1)
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = NULL,
      onset_to_death = onset_to_death,
      hosp_risk = 0.2
    ),
    regexp = "(onset_to_hosp is set to NULL)*(hosp_risk is being ignored)"
  )
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NULL,
      hosp_death_risk = 0.5
    ),
    regexp =
      "(onset_to_death is set to NULL)*(hosp_death_risk is being ignored)"
  )
  expect_warning(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NULL,
      non_hosp_death_risk = 0.02
    ),
    regexp =
      "(onset_to_death is set to NULL)*(non_hosp_death_risk is being ignored)"
  )
})

test_that("sim_linelist is silent when onset is NULL and risk is off", {
  set.seed(1)
  expect_silent(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = NULL,
      onset_to_death = onset_to_death
    )
  )
  expect_silent(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = NULL,
      onset_to_death = onset_to_death,
      hosp_risk = NULL
    )
  )
  expect_silent(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NULL,
    )
  )
  expect_silent(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NULL,
      non_hosp_death_risk = NULL
    )
  )
})

test_that("sim_linelist fails when onset-to-event are given by risk is NULL", {
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_risk = NULL
    ),
    regexp = "(hosp_risk is set to NULL)*(but onset_to_hosp is specified)"
  )
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      hosp_death_risk = NULL
    ),
    regexp =
      "(hosp_death_risk is set to NULL but onset_to_hosp and onset_to_death)"
  )
  expect_error(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      non_hosp_death_risk = NULL
    ),
    regexp = "(non_hosp_death_risk is set to NULL)*(onset_to_death is specified)"
  )
})

test_that("sim_linest date_admission column is NA when onset_to_hosp is NULL", {
  set.seed(1)
  ll <- suppressWarnings(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = NULL,
      onset_to_death = onset_to_death
    )
  )
  expect_true(all(is.na(ll$date_admission)))

  ll <- suppressWarnings(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = NULL,
      onset_to_death = onset_to_death,
      hosp_risk = NULL
    )
  )
  expect_true(all(is.na(ll$date_admission)))
})

test_that("sim_linest date_death column is NA when onset_to_death is NULL", {
  set.seed(1)
  ll <- suppressWarnings(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = NULL
    )
  )
  expect_true(all(is.na(ll$date_death)))

  ll <- sim_linelist(
    contact_distribution = contact_distribution,
    infectious_period = infectious_period,
    prob_infection = 0.5,
    onset_to_hosp = onset_to_hosp,
    onset_to_death = NULL,
    hosp_death_risk = NULL,
    non_hosp_death_risk = NULL
  )
  expect_true(all(is.na(ll$date_death)))
})

test_that("sim_linelist works as expected with time-varying cfr", {
  set.seed(1)
  expect_snapshot(
    sim_linelist(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
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
      infectious_period = infectious_period,
      prob_infection = 0.5,
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
      infectious_period = infectious_period,
      prob_infection = 0.5,
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
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      config = create_config(
        time_varying_death_risk = function(risk, time) risk * exp(time)
      )
    ),
    regexp = "(Time-varying)*(risk outside)*(0)*(1)*(Check time-varying func)",
  )
})
