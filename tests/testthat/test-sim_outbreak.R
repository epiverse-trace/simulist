test_that("sim_outbreak works as expected with defaults", {
  set.seed(1)
  expect_snapshot(sim_outbreak())
})


contact_distribution <- function(x) stats::dpois(x = x, lambda = 2)
infectious_period <- function(x) stats::rgamma(n = x, shape = 1, scale = 1)
onset_to_hosp <- function(x) {
  stats::rlnorm(n = x, meanlog = 0.947, sdlog = 1.628)
}
onset_to_death <- function(x) {
  stats::rlnorm(n = x, meanlog = 2.863, sdlog = 0.534)
}

test_that("sim_outbreak works as expected", {
  set.seed(1)
  expect_snapshot(
    sim_outbreak(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death
    )
  )
})

test_that("sim_outbreak works as expected with anonymised", {
  set.seed(1)
  expect_snapshot(
    sim_outbreak(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      anonymise = TRUE
    )
  )
})

test_that("sim_outbreak works as expected with age-strat risks", {
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
    sim_outbreak(
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

test_that("sim_outbreak works as expected with age structure", {
  age_struct <- data.frame(
    age_limit = c(1, 5, 80, 90),
    proportion = c(0.1, 0.7, 0.2, 0)
  )
  set.seed(1)
  expect_snapshot(
    sim_outbreak(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      onset_to_hosp = onset_to_hosp,
      onset_to_death = onset_to_death,
      population_age = age_struct
    )
  )
})
