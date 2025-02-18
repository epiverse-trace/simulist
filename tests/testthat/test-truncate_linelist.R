set.seed(123)
ll <- sim_linelist()

test_that("truncate_linelist works as expected with defaults", {
  ll_trunc <- truncate_linelist(ll)
  # in this example dataset only the outcome col is adjusted from truncate_linelist
  expect_false(identical(ll$date_outcome, ll_trunc$date_outcome))
})

test_that("truncate_linelist works as expected with modified delay", {
  ll_trunc <- truncate_linelist(
    ll,
    delay = function(x) rlnorm(n = x, meanlog = 3, sdlog = 2)
  )
  # in this example dataset the df is subset
  expect_gt(nrow(ll), nrow(ll_trunc))
})

test_that("truncate_linelist works as expected with max_date", {
  expect_message(ll_trunc <- truncate_linelist(ll, max_date = "2023-02-01"))
  # in this example dataset the df is subset
  expect_gt(nrow(ll), nrow(ll_trunc))
  expect_true(all(ll_trunc$date_onset < as.Date("2023-02-01")))
})

test_that("truncate_linelist works as expected with outcome delay_type", {
  ll_trunc <- truncate_linelist(ll, truncation_event = "outcome")
  # in this example dataset the df is subset
  expect_gt(nrow(ll), nrow(ll_trunc))
})

test_that("truncate_linelist sets dates as NA when between events", {
  # simulate with high hospitalisation risk and long delay between onset to
  # hospitalisation and onset to death to truncate between reporting and event
  ll <- sim_linelist(
    hosp_risk = 0.9,
    onset_to_hosp = function(x) stats::rlnorm(n = x, meanlog = 2, sdlog = 0.1),
    onset_to_death = function(x) stats::rlnorm(n = x, meanlog = 3, sdlog = 0.1)
  )
  ll_trunc <- truncate_linelist(
    ll,
    delay = function(x) rlnorm(n = x, meanlog = 2, sdlog = 0.5)
  )
  # it is possible that the proportion of NAs in the truncated data is lower
  # than the complete data if by chance the hospitalised cases are removed
  # but some NAs should be introduced in truncated data in rows that are kept
  expect_lte(
    sum(is.na(ll$date_outcome[ll$id %in% ll_trunc$id])),
    sum(is.na(ll_trunc$date_outcome))
  )
})

test_that("truncate_linelist prints message as expected for with numeric max_date", {
  expect_message(
    truncate_linelist(ll, max_date = 10),
    regexp = "(Truncation max date is:)*(Assuming)*(origin)*('1970-01-01')"
  )
})

test_that("truncate_linelist fails as expected for invalid linelist", {
  expect_error(
    truncate_linelist(data.frame()),
    regexp = "(linelist must be a data.frame output from)*(sim_linelist)"
  )
})

test_that("truncate_linelist fails as expected for invalid delay", {
  expect_error(
    truncate_linelist(ll, delay = function(x, y) x + y),
    regexp = "(delay supplied must have 1 argument)"
  )
})

test_that("truncate_linelist fails as expected for invalid delay_type", {
  expect_error(
    truncate_linelist(ll, truncation_event = "random"),
    regexp = "(should be one of)*(reporting)*(onset)*(admission)*(outcome)"
  )
})
