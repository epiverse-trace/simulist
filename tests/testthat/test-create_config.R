test_that("create_config works as expected with defaults", {
  config <- create_config()
  expect_type(config, type = "list")
  expect_length(config, 7)
  expect_named(
    config,
    c("last_contact_distribution", "last_contact_distribution_params",
      "first_contact_distribution", "first_contact_distribution_params",
      "ct_distribution", "ct_distribution_params", "genders")
  )
})

test_that("create_config works as expected modifying element", {
  config <- create_config(last_contact_distribution = "geom")
  expect_type(config, type = "list")
  expect_length(config, 7)
  expect_named(
    config,
    c("last_contact_distribution", "last_contact_distribution_params",
      "first_contact_distribution", "first_contact_distribution_params",
      "ct_distribution", "ct_distribution_params", "genders")
  )
  expect_identical(config$last_contact_distribution, "geom")
})

test_that("create_config works as expected misspelling modifying element", {
  # test also checks that partial name matching of list names does not happen
  config <- create_config(last_contact_dist = "geom")
  expect_type(config, type = "list")
  expect_length(config, 7)
  expect_named(
    config,
    c("last_contact_distribution", "last_contact_distribution_params",
      "first_contact_distribution", "first_contact_distribution_params",
      "ct_distribution", "ct_distribution_params", "genders")
  )
  expect_identical(config$last_contact_distribution, "pois")
})
