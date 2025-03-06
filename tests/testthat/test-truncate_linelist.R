set.seed(123)
ll <- sim_linelist()
# get max and min date to test truncation removes correct rows
date_cols <- grep(pattern = "date_", x = colnames(ll), fixed = TRUE)
max_date <- as.Date(
  max(unlist(ll[, date_cols]), na.rm = TRUE),
  origin = "1970-01-01"
)
min_date <- as.Date(
  min(unlist(ll[, date_cols]), na.rm = TRUE),
  origin = "1970-01-01"
)

test_that("truncate_linelist works as expected with defaults", {
  ll_trunc <- truncate_linelist(ll)
  expect_gt(nrow(ll), nrow(ll_trunc))
  # truncated line list has no dates after truncation day (14 days default)
  expect_true(
    all(unlist(ll_trunc[, date_cols]) < (max_date - 14), na.rm = TRUE)
  )
  # original line list has dates between truncation day and max date
  expect_true(
    all(unlist(ll[, date_cols]) <= max_date, na.rm = TRUE) &&
    any(unlist(ll[, date_cols]) > (max_date - 14), na.rm = TRUE)
  )
})

test_that("truncate_linelist works as expected with modified truncation_day", {
  ll_trunc <- truncate_linelist(
    linelist = ll,
    truncation_day = 60
  )
  expect_gt(nrow(ll), nrow(ll_trunc))
  # truncated line list has no dates after truncation day
  expect_true(
    all(unlist(ll_trunc[, date_cols]) < (max_date - 60), na.rm = TRUE)
  )
  # original line list has dates between truncation day and max date
  expect_true(
    all(unlist(ll[, date_cols]) <= max_date, na.rm = TRUE) &&
      any(unlist(ll[, date_cols]) > (max_date - 60), na.rm = TRUE)
  )
})

test_that("truncate_linelist works as expected with different units", {
  ll_trunc <- truncate_linelist(
    linelist = ll,
    truncation_day = 3,
    unit = "weeks"
  )
  expect_gt(nrow(ll), nrow(ll_trunc))
  # truncated line list has no dates after truncation day
  expect_true(
    all(unlist(ll_trunc[, date_cols]) < (max_date - 21), na.rm = TRUE)
  )
  # original line list has dates between truncation day and max date
  expect_true(
    all(unlist(ll[, date_cols]) <= max_date, na.rm = TRUE) &&
      any(unlist(ll[, date_cols]) > (max_date - 21), na.rm = TRUE)
  )
})

test_that("truncate_linelist works as expected with non-integer truncation", {
  # targetting row 90 & row 92 which are reported on 2023-03-16
  # but differ by half a day
  # row 90 max date minus reporting date of 30.85773
  # row 92 max date minus reporting date of 30.20320

  # both are "2023-03-16"
  trunc_date_incl <- as.character(max_date - 30.15)
  trunc_date_excl <- as.character(max_date - 30.5)
  expect_identical(trunc_date_incl, trunc_date_excl)

  # include both cases
  ll_trunc_incl <- truncate_linelist(
    linelist = ll,
    truncation_day = 30.15
  )
  # exclude on case earlier on 2023-03-16 but not other half a day later
  ll_trunc_excl <- truncate_linelist(
    linelist = ll,
    truncation_day = 30.5
  )

  # cases on the same day are kept or removed based on non-integer time/date
  expect_true(ll[90, "case_name"] %in% ll_trunc_incl$case_name)
  expect_true(ll[90, "case_name"] %in% ll_trunc_excl$case_name)
  expect_true(ll[92, "case_name"] %in% ll_trunc_incl$case_name)
  expect_false(ll[92, "case_name"] %in% ll_trunc_excl$case_name)

  # events on 2023-03-16 still in the linelist based on non-integer truncation
  trunc_date_incl %in% as.character(as.Date(unlist(ll_trunc_incl[, date_cols])))
  trunc_date_excl %in% as.character(as.Date(unlist(ll_trunc_excl[, date_cols])))
})

test_that("truncate_linelist works as expected with forward direction", {
  ll_trunc <- truncate_linelist(linelist = ll, direction = "forward")
  expect_gt(nrow(ll), nrow(ll_trunc))
  # truncated line list has no dates after truncation day
  trunc_date <- min_date + 14
  expect_true(
    all(unlist(ll_trunc[, date_cols]) < trunc_date, na.rm = TRUE)
  )
  # original line list has dates between truncation day and max date
  expect_true(
    all(unlist(ll[, date_cols]) <= max_date, na.rm = TRUE) &&
      any(unlist(ll[, date_cols]) > trunc_date, na.rm = TRUE)
  )
})

test_that("truncate_linelist workds as expected with <Date> truncation_day", {
  ll_trunc <- truncate_linelist(
    linelist = ll,
    truncation_day = as.Date("2023-03-01")
  )
  expect_gt(nrow(ll), nrow(ll_trunc))
  expect_true(
    all(unlist(ll_trunc[, date_cols]) < as.Date("2023-03-01"), na.rm = TRUE)
  )
})

test_that("truncate_linelist sets dates as NA when between events", {
  # simulate with high hospitalisation risk and long delay between onset to
  # hospitalisation and onset to death to truncate between reporting and event
  ll <- sim_linelist(
    hosp_risk = 0.9,
    onset_to_hosp = function(x) stats::rlnorm(n = x, meanlog = 3, sdlog = 0.1),
    onset_to_death = function(x) stats::rlnorm(n = x, meanlog = 3, sdlog = 0.1)
  )
  ll_trunc <- truncate_linelist(ll, truncation_day = 30)
  # it is possible that the proportion of NAs in the truncated data is lower
  # than the complete data if by chance the hospitalised cases are removed
  # but some NAs should be introduced in truncated data in rows that are kept
  expect_lte(
    sum(is.na(ll$date_outcome[ll$id %in% ll_trunc$id])),
    sum(is.na(ll_trunc$date_outcome))
  )
})

test_that("truncate_linelist warns if truncation_day is Date and unit given", {
  expect_warning(
    truncate_linelist(
      linelist = ll,
      truncation_day = as.Date("2023-03-01"),
      unit = "weeks"
    ),
    regexp = "(truncation_day)*(is)*(Date)*(unit)*(direction)*(are ignored)"
  )
  expect_warning(
    truncate_linelist(
      linelist = ll,
      truncation_day = as.Date("2023-03-01"),
      direction = "forwards"
    ),
    regexp = "(truncation_day)*(is)*(Date)*(unit)*(direction)*(are ignored)"
  )
})

test_that("truncate_linelist fails as expected for invalid linelist", {
  expect_error(
    truncate_linelist(data.frame()),
    regexp = "(linelist must be a data.frame output from)*(sim_linelist)"
  )
})

test_that("truncate_linelist fails as expected for invalid truncation_day", {
  expect_error(
    truncate_linelist(ll, truncation_day = -1),
    regexp = "(truncation_day)*(single nonnegative numeric or)*(Date)"
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
