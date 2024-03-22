suppressMessages({
  contact_distribution <- as.function(
    epiparameter::epidist(
      disease = "COVID-19",
      epi_dist = "contact distribution",
      prob_distribution = "pois",
      prob_distribution_params = c(mean = 2)
    )
  )

  infect_period <- as.function(
    epiparameter::epidist(
      disease = "COVID-19",
      epi_dist = "infectious period",
      prob_distribution = "gamma",
      prob_distribution_params = c(shape = 1, scale = 1)
    ), func_type = "generate"
  )
})

test_that(".sim_network_bp works as expected", {
  set.seed(1)
  expect_snapshot(
    .sim_network_bp(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
      max_outbreak_size = 1e4,
      config = create_config()
    )
  )
})

test_that(".sim_network_bp works as expected with no contacts", {
  suppressMessages(
    contact_distribution <- as.function(
      epiparameter::epidist(
        disease = "COVID-19",
        epi_dist = "contact distribution",
        prob_distribution = "pois",
        prob_distribution_params = c(mean = 1)
      )
    )
  )
  set.seed(1)
  expect_snapshot(
    .sim_network_bp(
      contact_distribution = contact_distribution,
      infect_period = infect_period,
      prob_infect = 0.5,
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
      infect_period = infect_period,
      prob_infect = 0.5,
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
      infect_period = infect_period,
      prob_infect = 0.5,
      max_outbreak_size = 10,
      config = create_config()
    ),
    regexp = "(Number of cases exceeds maximum)*(Returning data early)"
  )
})
