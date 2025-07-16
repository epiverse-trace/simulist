set.seed(123)
ll <- sim_linelist()

test_that("censor_linelist works for daily censoring", {
  ll_cens <- censor_linelist(linelist = ll, interval = "daily")
  date_col_idx <- grep(pattern = "date_", x = colnames(ll_cens))
  date_col_class <- vapply(
    ll_cens[, date_col_idx], inherits, FUN.VALUE = logical(1), what = "Date"
  )
  date_col_int <- vapply(
    ll_cens[, date_col_idx], rlang::is_integerish, FUN.VALUE = logical(1)
  )
  expect_true(all(date_col_class))
  expect_true(all(date_col_int))
})

test_that("censor_linelist works for weekly censoring", {
  ll_cens <- censor_linelist(linelist = ll, interval = "weekly")
  date_col_idx <- grep(pattern = "date_", x = colnames(ll_cens))
  date_col_class <- vapply(
    ll_cens[, date_col_idx],
    inherits,
    FUN.VALUE = logical(1),
    what = "grates_isoweek"
  )
  date_col_int <- vapply(
    ll_cens[, date_col_idx], rlang::is_integerish, FUN.VALUE = logical(1)
  )
  expect_true(all(date_col_class))
  expect_true(all(date_col_int))
})

test_that("censor_linelist works for epiweek censoring", {
  ll_cens <- censor_linelist(linelist = ll, interval = "epiweek")
  date_col_idx <- grep(pattern = "date_", x = colnames(ll_cens))
  date_col_class <- vapply(
    ll_cens[, date_col_idx],
    inherits,
    FUN.VALUE = logical(1),
    what = "grates_epiweek"
  )
  date_col_int <- vapply(
    ll_cens[, date_col_idx], rlang::is_integerish, FUN.VALUE = logical(1)
  )
  expect_true(all(date_col_class))
  expect_true(all(date_col_int))
})

test_that("censor_linelist works for monthly censoring", {
  ll_cens <- censor_linelist(linelist = ll, interval = "monthly")
  date_col_idx <- grep(pattern = "date_", x = colnames(ll_cens))
  date_col_class <- vapply(
    ll_cens[, date_col_idx],
    inherits,
    FUN.VALUE = logical(1),
    what = "grates_yearmonth"
  )
  date_col_int <- vapply(
    ll_cens[, date_col_idx], rlang::is_integerish, FUN.VALUE = logical(1)
  )
  expect_true(all(date_col_class))
  expect_true(all(date_col_int))
})

test_that("censor_linelist works for yearly censoring", {
  ll_cens <- censor_linelist(linelist = ll, interval = "yearly")
  date_col_idx <- grep(pattern = "date_", x = colnames(ll_cens))
  date_col_class <- vapply(
    ll_cens[, date_col_idx],
    inherits,
    FUN.VALUE = logical(1),
    what = "grates_year"
  )
  date_col_int <- vapply(
    ll_cens[, date_col_idx], rlang::is_integerish, FUN.VALUE = logical(1)
  )
  expect_true(all(date_col_class))
  expect_true(all(date_col_int))
})

test_that("censor_linelist works for integer interval censoring", {
  ll_cens <- censor_linelist(linelist = ll, interval = 3)
  date_col_idx <- grep(pattern = "date_", x = colnames(ll_cens))
  date_col_class <- vapply(
    ll_cens[, date_col_idx],
    inherits,
    FUN.VALUE = logical(1),
    what = "grates_period"
  )
  date_col_int <- vapply(
    ll_cens[, date_col_idx], rlang::is_integerish, FUN.VALUE = logical(1)
  )
  expect_true(all(date_col_class))
  expect_true(all(date_col_int))
})

test_that("censor_linelist fails correctly for invalid input", {
  expect_error(
    censor_linelist(linelist = ll, interval = 1.5),
    regexp = "(Assertion)*(failed)*(Must be of type 'integerish')"
  )
  expect_error(
    censor_linelist(linelist = ll, interval = "day"),
    regexp = "(arg)*(should be one of)*(daily)"
  )
})
