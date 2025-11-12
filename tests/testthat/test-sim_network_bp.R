contact_distribution <- function(x) stats::dpois(x = x, lambda = 2)
infectious_period <- function(n) stats::rgamma(n = n, shape = 1, scale = 1)

test_that(".sim_network_bp works as expected", {
  set.seed(1)
  expect_snapshot(
    .sim_network_bp(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      max_outbreak_size = 1e4,
      config = create_config()
    )
  )
})

test_that(".sim_network_bp works as expected with no contacts", {
  contact_distribution <- function(x) stats::dpois(x = x, lambda = 1)
  set.seed(1)
  expect_snapshot(
    .sim_network_bp(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      max_outbreak_size = 1e4,
      config = create_config()
    )
  )
})

test_that(".sim_network_bp works as expected with unadjusted network", {
  set.seed(1)
  expect_snapshot(
    .sim_network_bp(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      max_outbreak_size = 1e4,
      config = create_config(network = "unadjusted")
    )
  )
})

test_that(".sim_network_bp warns as expected", {
  set.seed(2)
  expect_warning(
    .sim_network_bp(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      max_outbreak_size = 10,
      config = create_config()
    ),
    regexp = "(Number of cases exceeds maximum)*(Returning data early)"
  )
})

test_that(".sim_network_bp errors with negative infectious period", {
  infectious_period <- function(n) stats::rnorm(n = n, mean = 10, sd = 5)
  set.seed(3)
  expect_error(
    .sim_network_bp(
      contact_distribution = contact_distribution,
      infectious_period = infectious_period,
      prob_infection = 0.5,
      max_outbreak_size = 1e4,
      config = create_config()
    ),
    regexp = "(Negative infectious period sampled)"
  )
})
