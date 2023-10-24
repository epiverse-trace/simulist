suppressMessages({
  serial_interval <- epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "serial interval",
    prob_distribution = "gamma",
    prob_distribution_params = c(shape = 1, scale = 1)
  )

  contact_distribution <- epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "contact_distribution",
    prob_distribution = "pois",
    prob_distribution_params = c(l = 5)
  )
})

test_that("sim_contacts works as expected", {
  set.seed(1)
  contacts <- sim_contacts(
    R = 1.1,
    serial_interval = serial_interval,
    contact_distribution = contact_distribution
  )

  expect_s3_class(contacts, class = "data.frame")
  expect_identical(dim(contacts), c(170L, 8L))
  expect_identical(
    colnames(contacts),
    c("part_name", "contact_name", "cnt_age", "cnt_gender",
      "date_first_contact", "date_last_contact", "was_case", "status")
  )
})






test_that("sim_contacts works as expected with modified config", {
  set.seed(1)
  contacts <- sim_contacts(
    R = 1.1,
    serial_interval = serial_interval,
    contact_distribution = contact_distribution,
    config = create_config(
      last_contact_distribution = "geom",
      last_contact_distribution_params = c(prob = 0.5)
    )
  )

  expect_s3_class(contacts, class = "data.frame")
  expect_identical(dim(contacts), c(178L, 8L))
  expect_identical(
    colnames(contacts),
    c("part_name", "contact_name", "cnt_age", "cnt_gender",
      "date_first_contact", "date_last_contact", "was_case", "status")
  )
})

test_that("sim_contacts works as expected with modified config parameters", {
  set.seed(1)
  contacts <- sim_contacts(
    R = 1.1,
    serial_interval = serial_interval,
    contact_distribution = contact_distribution,
    config = create_config(
      last_contact_distribution_params = c(lambda = 5)
    )
  )

  expect_s3_class(contacts, class = "data.frame")
  expect_identical(dim(contacts), c(170L, 8L)) # TODO check why nrow is diff
  expect_identical(
    colnames(contacts),
    c("part_name", "contact_name", "cnt_age", "cnt_gender",
      "date_first_contact", "date_last_contact", "was_case", "status")
  )
})

test_that("sim_contacts fails as expected with modified config", {
  expect_error(
    sim_contacts(
      R = 1.1,
      serial_interval = serial_interval,
      contact_distribution = contact_distribution,
      config = create_config(
        last_contact_distribution = "geom"
      )
    ),
    regexp = "Incorrect parameterisation of distribution, check config"
  )
})

test_that("sim_contacts fails as expected with empty config", {
  expect_error(
    sim_contacts(
      R = 1.1,
      serial_interval = serial_interval,
      contact_distribution = contact_distribution,
      config = list()
    ),
    regexp = "Distribution parameters are missing, check config"
  )
})
