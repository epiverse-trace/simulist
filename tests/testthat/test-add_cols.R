onset_to_hosp <- function(x) {
  stats::rlnorm(n = x, meanlog = 0.947, sdlog = 1.628)
}
onset_to_death <- function(x) {
  stats::rlnorm(n = x, meanlog = 2.863, sdlog = 0.534)
}
onset_to_recovery <- function(x) rep(NA, times = x)

test_that(".add_date_contact works as expected", {
  ll <- readRDS(file = file.path("testdata", "pre_date_contact.rds"))
  linelist <- .add_date_contact(
    .data = ll,
    first_contact_distribution = function(x) stats::rpois(n = x, lambda = 3),
    last_contact_distribution = function(x) stats::rpois(n = x, lambda = 3),
    outbreak_start_date = as.Date("2023-01-01")
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_s3_class(linelist$date_last_contact, class = "Date")
  expect_s3_class(linelist$date_first_contact, class = "Date")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), c("date_first_contact", "date_last_contact"))
  )
})

test_that(".add_date_contact fails as expected for non-integers", {
  ll <- readRDS(file.path("testdata", "pre_date_contact.rds"))
  expect_error(
    .add_date_contact(
      .data = ll,
      first_contact_distribution = function(x) {
        stats::rlnorm(n = x, meanlog = 1, sdlog = 1)
      },
      last_contact_distribution = function(x) stats::rpois(n = x, lambda = 3),
      outbreak_start_date = as.Date("2023-01-01")
    ),
    regexp = "(contact distribution)*(must)*(produce)*(nonnegative integers)"
  )

  expect_error(
    .add_date_contact(
      .data = ll,
      first_contact_distribution = function(x) "x",
      last_contact_distribution = function(x) stats::rpois(n = x, lambda = 3),
      outbreak_start_date = as.Date("2023-01-01")
    ),
    regexp = "(contact distribution)*(must)*(produce)*(nonnegative integers)"
  )

  expect_error(
    .add_date_contact(
      .data = ll,
      first_contact_distribution = "pois",
      last_contact_distribution = function(x) stats::rpois(n = x, lambda = 3),
      outbreak_start_date = as.Date("2023-01-01")
    ),
    regexp = "(Assertion)*(failed)*(Must be a function, not 'character')"
  )
})

test_that(".add_hospitalisation works as expected", {
  ll <- readRDS(file.path("testdata", "pre_hospitalisation.rds"))
  linelist <- .add_hospitalisation(
    .data = ll,
    onset_to_hosp = onset_to_hosp,
    hosp_risk = 0.5
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$hospitalisation, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "hospitalisation")
  )
})

test_that(".add_hospitalisation works as expected with different parameter", {
  ll <- readRDS(file.path("testdata", "pre_hospitalisation.rds"))
  linelist <- .add_hospitalisation(
    .data = ll,
    onset_to_hosp = onset_to_hosp,
    hosp_risk = 0.1
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$hospitalisation, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "hospitalisation")
  )
})

test_that(".add_hospitalisation works as expected with age-strat risks", {
  ll <- readRDS(file.path("testdata", "pre_hospitalisation.rds"))
  age_dep_hosp_risk <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(4, 79, 90),
    risk = c(0.1, 0.05, 0.2)
  )
  linelist <- .add_hospitalisation(
    .data = ll,
    onset_to_hosp = onset_to_hosp,
    hosp_risk = age_dep_hosp_risk
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$hospitalisation, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "hospitalisation")
  )
})

test_that(".add_outcome works as expected", {
  ll <- readRDS(file.path("testdata", "pre_outcome.rds"))
  linelist <- .add_outcome(
    .data = ll,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery,
    hosp_death_risk = 0.5,
    non_hosp_death_risk = 0.5,
    config = create_config()
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$outcome, type = "character")
  expect_type(linelist$outcome_time, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "outcome", "outcome_time")
  )
})

test_that(".add_outcome works as expected with different parameter", {
  ll <- readRDS(file.path("testdata", "pre_outcome.rds"))
  linelist <- .add_outcome(
    .data = ll,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery,
    hosp_death_risk = 0.9,
    non_hosp_death_risk = 0.1,
    config = create_config()
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$outcome, type = "character")
  expect_type(linelist$outcome_time, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "outcome", "outcome_time")
  )
})

test_that(".add_outcome works as expected with age-strat risks", {
  ll <- readRDS(file.path("testdata", "pre_outcome.rds"))
  age_dep_hosp_death_risk <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(4, 79, 90),
    risk = c(0.1, 0.05, 0.2)
  )
  age_dep_non_hosp_death_risk <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(4, 79, 90),
    risk = c(0.05, 0.025, 0.1)
  )
  linelist <- .add_outcome(
    .data = ll,
    onset_to_death = onset_to_death,
    onset_to_recovery = onset_to_recovery,
    hosp_death_risk = age_dep_hosp_death_risk,
    non_hosp_death_risk = age_dep_non_hosp_death_risk,
    config = create_config()
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$outcome, type = "character")
  expect_type(linelist$outcome_time, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "outcome", "outcome_time")
  )
})

test_that(".add_names works as expected", {
  ll <- readRDS(file.path("testdata", "pre_names.rds"))
  linelist <- .add_names(.data = ll)
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$case_name, type = "character")
  expect_type(linelist$infector_name, type = "character")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "case_name", "infector_name")
  )
})

test_that(".add_names works as expected with anonymise = TRUE", {
  ll <- readRDS(file.path("testdata", "pre_names.rds"))
  linelist <- .add_names(.data = ll, anonymise = TRUE)
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$case_name, type = "character")
  expect_type(linelist$infector_name, type = "character")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "case_name", "infector_name")
  )
})

test_that(".add_ct works as expected", {
  ll <- readRDS(file.path("testdata", "pre_ct.rds"))
  linelist <- .add_ct(
    .data = ll,
    distribution = function(x) stats::rnorm(n = x, mean = 3, sd = 0.5)
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$ct_value, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "ct_value"))
})

test_that(".add_ct works as expected with different parameter", {
  ll <- readRDS(file.path("testdata", "pre_ct.rds"))
  linelist <- .add_ct(
    .data = ll,
    distribution = function(x) stats::rnorm(n = x, mean = 30, sd = 2)
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$ct_value, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "ct_value"))
})

test_that(".add_ct fails as expected", {
  ll <- readRDS(file.path("testdata", "pre_ct.rds"))
  expect_error(
    .add_ct(.data = ll, distribution = function(x) "x"),
    regexp = "(Ct distribution)*(must)*(produce)*(positive numbers)"
  )

  expect_error(
    .add_ct(.data = ll, distribution = function(x) -1),
    regexp = "(Ct distribution)*(must)*(produce)*(positive numbers)"
  )

  expect_error(
    .add_ct(.data = ll, distribution = "norm"),
    regexp = "(Assertion)*(failed)*(Must be a function, not 'character')"
  )
})
