set.seed(123)
ll <- sim_linelist()

test_that("truncation works as expected with defaults", {
  ll_trunc <- truncation(ll)
  # in this example dataset only the outcome col is adjusted from truncation
  expect_false(identical(ll$date_outcome, ll_trunc$date_outcome))
})

test_that("truncation works as expected with modified delay", {
  ll_trunc <- truncation(
    ll,
    delay = function(x) rlnorm(n = x, meanlog = 5, sdlog = 2)
  )
  # in this example dataset the df is subset
  expect_gt(nrow(ll), nrow(ll_trunc))
  # some admissions and outcome are set to NA so prop of NAs is higher for trunc
  expect_lt(
    sum(is.na(ll$date_admission)) / nrow(ll),
    sum(is.na(ll_trunc$date_admission)) / nrow(ll_trunc)
  )
  expect_lt(
    sum(is.na(ll$date_outcome)) / nrow(ll),
    sum(is.na(ll_trunc$date_outcome)) / nrow(ll_trunc)
  )
})

test_that("truncation works as expected with max_date", {
  ll_trunc <- truncation(ll, max_date = "2023-02-01")
  # in this example dataset the df is subset
  expect_gt(nrow(ll), nrow(ll_trunc))
  expect_true(all(ll_trunc$date_onset < as.Date("2023-02-01")))
})

test_that("truncation works as expected with outcome delay_type", {
  ll_trunc <- truncation(ll, delay_type = "outcome")
  # in this example dataset the df is subset
  expect_gt(nrow(ll), nrow(ll_trunc))
})

test_that("truncation fails as expected for invalid linelist", {
  expect_error(
    truncation(data.frame()),
    regexp = "(linelist must be a data.frame output from)*(sim_linelist)"
  )
})

test_that("truncation fails as expected for invalid delay", {
  expect_error(
    truncation(ll, delay = function(x, y) x + y),
    regexp = "(delay supplied must have 1 argument)"
  )
})

test_that("truncation fails as expected for invalid max_date", {
  expect_error(
    truncation(ll, max_date = 10),
    regexp = "(origin)*(must be supplied)"
  )
})

test_that("truncation fails as expected for invalid delay_type", {
  expect_error(
    truncation(ll, delay_type = "random"),
    regexp = "('arg' should be one of)*(all)*(onset)*(admission)*(outcome)"
  )
})
