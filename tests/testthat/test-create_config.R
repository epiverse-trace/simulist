config_length <- 6
config_names <- c(
  "last_contact_distribution", "first_contact_distribution",
  "ct_distribution", "network", "time_varying_death_risk", "data_entry_event"
)

test_that("create_config works as expected with defaults", {
  config <- create_config()
  expect_type(config, type = "list")
  expect_length(config, config_length)
  expect_named(config, config_names)
})

test_that("create_config works as expected modifying element", {
  config <- create_config(
    last_contact_distribution = function(x) rgeom(n = x, prob = 0.5)
  )
  expect_type(config, type = "list")
  expect_length(config, config_length)
  expect_named(config, config_names)
  expect_identical(
    config$last_contact_distribution,
    function(x) rgeom(n = x, prob = 0.5)
  )
})

test_that("create_config works as expected with spliced list", {
  config <- create_config(
    !!!list(
      last_contact_distribution = function(x) rpois(n = x, lambda = 2),
      ct_distribution = function(x) rlnorm(n = x, meanlog = 2, sdlog = 1)
    )
  )
  expect_type(config, type = "list")
  expect_length(config, config_length)
  expect_named(config, config_names)
  expect_identical(
    config$last_contact_distribution,
    function(x) rpois(n = x, lambda = 2)
  )
  expect_identical(
    config$ct_distribution,
    function(x) rlnorm(n = x, meanlog = 2, sdlog = 1)
  )

  config <- create_config(
    last_contact_distribution = function(x) rpois(n = x, lambda = 4),
    !!!list(
      ct_distribution = function(x) rlnorm(n = x, meanlog = 3, sdlog = 1)
    )
  )
  expect_type(config, type = "list")
  expect_length(config, config_length)
  expect_named(config, config_names)
  expect_identical(
    config$last_contact_distribution,
    function(x) rpois(n = x, lambda = 4)
  )
  expect_identical(
    config$ct_distribution,
    function(x) rlnorm(n = x, meanlog = 3, sdlog = 1)
  )
})

test_that("create_config fails as expected misspelling modifying element", {
  # test also checks that partial name matching of list names does not happen
  expect_error(
    create_config(last_contact_dist = function(x) rpois(n = x, lambda = 1)),
    regexp = "Incorrect argument names supplied to create_config"
  )
})

test_that("create_config fails as expected with unnamed elements", {
  expect_error(
    create_config("unadjusted"),
    regexp = "Incorrect argument names supplied to create_config"
  )
  expect_error(
    create_config(
      ct_distribution = function(x) rlnorm(n = x, meanlog = 2, sdlog = 1),
      "unadjusted"
    ),
    regexp = "Incorrect argument names supplied to create_config"
  )
})

test_that("create_config fails as expected with list input", {
  expect_error(
    create_config(
      list(ct_distribution = function(x) rlnorm(n = x, meanlog = 2, sdlog = 1))
    ),
    regexp = "Incorrect argument names supplied to create_config"
  )
  expect_error(
    create_config(
      list(last_contact_distribution = function(x) rpois(n = x, lambda = 1)),
      ct_distribution = function(x) rlnorm(n = x, meanlog = 2, sdlog = 1)
    ),
    regexp = "Incorrect argument names supplied to create_config"
  )
})
