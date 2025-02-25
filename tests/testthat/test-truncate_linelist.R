set.seed(123)
ll <- sim_linelist()

test_that("truncate_linelist works as expected with defaults", {
  ll_trunc <- truncate_linelist(ll)
  # in this example dataset one case is removed
  expect_false(identical(ll$date_outcome, ll_trunc$date_outcome))
  expect_gt(nrow(ll), nrow(ll_trunc))
})

test_that("truncate_linelist works as expected with modified truncation_time", {
  ll_trunc <- truncate_linelist(
    linelist = ll,
    truncation_time = 60
  )
  expect_gt(nrow(ll), nrow(ll_trunc))
})

test_that("truncate_linelist works as expected with different units", {
  ll_trunc <- truncate_linelist(
    linelist = ll,
    truncation_time = 3,
    unit = "weeks"
  )
  expect_gt(nrow(ll), nrow(ll_trunc))
})

test_that("truncate_linelist works as expected with forward direction", {
  ll_trunc <- truncate_linelist(linelist = ll, direction = "forward")
  expect_gt(nrow(ll), nrow(ll_trunc))
})

test_that("truncate_linelist workds as expected with <Date> truncation_time", {
  ll_trunc <- truncate_linelist(
    linelist = ll,
    truncation_time = as.Date("2023-03-01")
  )
  expect_gt(nrow(ll), nrow(ll_trunc))
  expect_true(all(ll_trunc$date_reporting < as.Date("2023-03-01")))
})

test_that("truncate_linelist sets dates as NA when between events", {
  # simulate with high hospitalisation risk and long delay between onset to
  # hospitalisation and onset to death to truncate between reporting and event
  ll <- sim_linelist(
    hosp_risk = 0.9,
    onset_to_hosp = function(x) stats::rlnorm(n = x, meanlog = 3, sdlog = 0.1),
    onset_to_death = function(x) stats::rlnorm(n = x, meanlog = 3, sdlog = 0.1)
  )
  ll_trunc <- truncate_linelist(ll, truncation_time = 30)
  # it is possible that the proportion of NAs in the truncated data is lower
  # than the complete data if by chance the hospitalised cases are removed
  # but some NAs should be introduced in truncated data in rows that are kept
  expect_lte(
    sum(is.na(ll$date_outcome[ll$id %in% ll_trunc$id])),
    sum(is.na(ll_trunc$date_outcome))
  )
})

test_that("truncate_linelist warns if truncation_time is Date and unit given", {
  expect_warning(
    truncate_linelist(
      linelist = ll,
      truncation_time = as.Date("2023-03-01"),
      unit = "weeks"
    ),
    regexp = "(truncation_time)*(is)*(Date)*(unit)*(direction)*(are ignored)"
  )
  expect_warning(
    truncate_linelist(
      linelist = ll,
      truncation_time = as.Date("2023-03-01"),
      direction = "forwards"
    ),
    regexp = "(truncation_time)*(is)*(Date)*(unit)*(direction)*(are ignored)"
  )
})

test_that("truncate_linelist fails as expected for invalid linelist", {
  expect_error(
    truncate_linelist(data.frame()),
    regexp = "(linelist must be a data.frame output from)*(sim_linelist)"
  )
})

test_that("truncate_linelist fails as expected for invalid truncation_time", {
  expect_error(
    truncate_linelist(ll, truncation_time = -1),
    regexp = "(truncation_time)*(single positive numeric or)*(Date)"
  )
})

test_that("truncate_linelist fails as expected for invalid unit", {
  expect_error(
    truncate_linelist(ll, unit = "daily"),
    regexp = "(should be one of)*(days)*(weeks)*(months)*(years)"
  )
})

test_that("truncate_linelist fails as expected for invalid direction", {
  expect_error(
    truncate_linelist(ll, direction = "retrospective"),
    regexp = "(should be one of)*(backwards)*(forwards)"
  )
})
