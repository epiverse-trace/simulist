test_that(".check_rate_df works as expected", {
  age_dep_hosp_rate <- data.frame(
    age_limit = c(1, 5, 80),
    rate = c(0.1, 0.05, 0.2)
  )
  age_dep_hosp_rate <- .check_rate_df(age_dep_hosp_rate, age_range = c(1, 90))
  expect_s3_class(age_dep_hosp_rate, class = "data.frame")
  expect_identical(dim(age_dep_hosp_rate), c(3L, 3L))
  expect_identical(colnames(age_dep_hosp_rate), c("min_age", "max_age", "rate"))
  expect_identical(
    row.names(age_dep_hosp_rate),
    c("[1,5)", "[5,80)", "[80,90]")
  )
})

test_that(".check_rate_df fails as expected", {
  age_dep_hosp_rate <- data.frame(
    age_min = c(1, 5, 80),
    hosp_rate = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_rate_df(age_dep_hosp_rate, age_range = c(1, 91)),
    regexp = "column names should be 'age_limit' & 'rate'"
  )

  age_dep_hosp_rate <- data.frame(
    age_limit = c(2, 5, 80),
    rate = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_rate_df(age_dep_hosp_rate, age_range = c(1, 90)),
    regexp = "minimum age of lowest age group should match lower age range"
  )

  age_dep_hosp_rate <- data.frame(
    age_limit = c(1, 5, 90),
    rate = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_rate_df(age_dep_hosp_rate, age_range = c(1, 90)),
    regexp =
      "lower bound of oldest age group must be lower than highest age range"
  )

  age_dep_hosp_rate <- data.frame(
    age_limit = c(1, 5, 80),
    rate = c(-0.1, 0.5, 1.1)
  )
  expect_error(
    .check_rate_df(age_dep_hosp_rate, age_range = c(1, 90)),
    regexp = "rate should be between 0 and 1"
  )

  age_dep_hosp_rate <- data.frame(
    age_limit = c(1, 5, 5),
    rate = c(0.1, 0.05, 0.2)
  )
  expect_error(
    .check_rate_df(age_dep_hosp_rate, age_range = c(1, 90)),
    regexp = "age limit in rate data frame must be unique"
  )

  age_dep_hosp_rate <- data.frame(
    age_limit = c(1, 10, 80),
    rate = c(0.1, 0.05, NA)
  )
  expect_error(
    .check_rate_df(age_dep_hosp_rate, age_range = c(1, 90)),
    regexp = "age limit or rate cannot be NA or NaN"
  )
})

test_that(".check_age_df works as expected", {
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  age_struct <- .check_age_df(age_struct)
  expect_s3_class(age_struct, class = "data.frame")
  expect_identical(dim(age_struct), c(3L, 3L))
  expect_identical(colnames(age_struct), c("min_age", "max_age", "proportion"))
})

test_that(".check_age_df fails as expected", {
  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    percentage = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "column names should be 'age_range' & 'proportion'"
  )

  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, NA, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "age range or proportion cannot be NA or NaN"
  )

  age_struct <- data.frame(
    age_range = c("1-4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.3),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "proportions of each age bracket should sum to 1"
  )

  age_struct <- data.frame(
    age_range = c("1_4", "5-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "(all age groups should be separated with a)*(-)"
  )

  age_struct <- data.frame(
    age_range = c("1-4", "52-79", "80-90"),
    proportion = c(0.1, 0.7, 0.2),
    stringsAsFactors = FALSE
  )
  expect_error(
    .check_age_df(age_struct),
    regexp = "age groups should be contiguous"
  )
})
