suppressMessages({
  contact_interval <- as.function(
    epiparameter::epidist(
      disease = "COVID-19",
      epi_dist = "contact interval",
      prob_distribution = "gamma",
      prob_distribution_params = c(shape = 1, scale = 1)
    ), func_type = "generate"
  )
})

test_that(".sim_network_bp works as expected", {
  set.seed(1)
  res <- .sim_network_bp(
    mean_contacts = 2,
    contact_interval = contact_interval,
    prob_infect = 0.5
  )
  expect_s3_class(res, class = "data.frame")
  expect_identical(dim(res), c(10L, 5L))
  expect_identical(
    colnames(res),
    c("id", "ancestor", "generation", "infected", "time")
  )
})

test_that(".sim_network_bp works as expected with no contacts", {
  set.seed(4)
  res <- .sim_network_bp(
    mean_contacts = 1,
    contact_interval = contact_interval,
    prob_infect = 0.5
  )
  expect_s3_class(res, class = "data.frame")
  expect_identical(dim(res), c(1L, 5L))
  expect_identical(
    colnames(res),
    c("id", "ancestor", "generation", "infected", "time")
  )
})
