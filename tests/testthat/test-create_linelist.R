test_that(".create_linelist works for pre_date_last_contact", {
  linelist <- .create_linelist(scenario = "pre_date_last_contact")
  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 7L))
  expect_identical(
    colnames(linelist),
    c(
      "n", "id", "infector", "generation", "time", "date_onset",
      "infector_time"
    )
  )
})

test_that(".create_linelist works for pre_date_first_contact", {
  linelist <- .create_linelist(scenario = "pre_date_first_contact")
  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 8L))
  expect_identical(
    colnames(linelist),
    c(
      "n", "id", "infector", "generation", "time", "date_onset",
      "infector_time", "date_last_contact"
    )
  )
})

test_that(".create_linelist works for pre_hospitalisation", {
  linelist <- .create_linelist(scenario = "pre_hospitalisation")
  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 11L))
  expect_identical(
    colnames(linelist),
    c(
      "n", "id", "infector", "generation", "time", "date_onset",
      "infector_time", "date_last_contact", "date_first_contact", "gender",
      "age"
    )
  )
})

test_that(".create_linelist works for pre_deaths", {
  linelist <- .create_linelist(scenario = "pre_deaths")
  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 12L))
  expect_identical(
    colnames(linelist),
    c(
      "n", "id", "infector", "generation", "time", "date_onset",
      "infector_time", "date_last_contact", "date_first_contact", "gender",
      "age", "hospitalisation"
    )
  )
})

test_that(".create_linelist works for pre_names", {
  linelist <- .create_linelist(scenario = "pre_names")
  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 15L))
  expect_identical(
    colnames(linelist),
    c(
      "n", "id", "infector", "generation", "time", "date_onset",
      "infector_time", "date_last_contact", "date_first_contact", "gender",
      "age", "hospitalisation", "deaths", "date_admission", "date_death"
    )
  )
})

test_that(".create_linelist works for pre_ct", {
  linelist <- .create_linelist(scenario = "pre_ct")
  expect_s3_class(linelist, class = "data.frame")
  expect_identical(dim(linelist), c(42L, 18L))
  expect_identical(
    colnames(linelist),
    c(
      "n", "id", "infector", "generation", "time", "date_onset",
      "infector_time", "date_last_contact", "date_first_contact", "gender",
      "age", "hospitalisation", "deaths", "date_admission", "date_death",
      "case_name", "infector_name", "case_type"
    )
  )
})

test_that(".create_linelist fails as expected", {
  expect_error(
    .create_linelist(scenario = "random"),
    regexp = "(arg)*(should be one of)"
  )

  expect_error(
    .create_linelist(scenario = 1),
    regexp = "(arg)*(must be)*(character)"
  )

  expect_error(
    .create_linelist(),
    regexp = "(argument)*(scenario)*(missing)"
  )
})
