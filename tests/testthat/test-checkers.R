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
