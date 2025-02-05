# set seed to sim small outbreak
set.seed(1234)
ll <- sim_linelist()

test_that("messy works as expected by default", {
  messy_ll <- messy(ll)
  expect_s3_class(messy_ll, "data.frame")
  expect_identical(dim(ll), dim(messy_ll))
  expect_identical(colnames(ll), colnames(messy_ll))
  expect_gt(sum(is.na(messy_ll)), sum(is.na(ll)))
  expect_false(
    c("numeric", "integer") %in%
      vapply(messy_ll, class, FUN.VALUE = character(1))
  )
})

test_that("messy works with higher proportion of spelling mistakes", {
  messy_ll <- messy(ll, prop_spelling_mistakes = 1)
  # Levenshtein distance between clean and messy strings should be 1
  expect_true(
    all(diag(utils::adist(ll$case_name, messy_ll$case_name)) == 1, na.rm = TRUE)
  )
  expect_true(
    all(diag(utils::adist(ll$case_type, messy_ll$case_type)) == 1, na.rm = TRUE)
  )
})

test_that("messy works with zero spelling mistakes", {
  messy_ll <- messy(ll, prop_spelling_mistakes = 0)
  # Levenshtein distance between clean and messy strings should be 0
  expect_true(
    all(diag(utils::adist(ll$case_name, messy_ll$case_name)) == 0, na.rm = TRUE)
  )
  expect_true(
    all(diag(utils::adist(ll$case_type, messy_ll$case_type)) == 0, na.rm = TRUE)
  )
})

test_that("messy works with inconsistent sex", {
  messy_ll <- messy(ll)
  expect_false(all(messy_ll$sex %in% c("m", "f", NA_character_)))
  expect_true(all(
    messy_ll$sex %in% c(
      "m", "f", "M", "F", "male", "female", "Male", "Female", NA_character_
    )
  ))
})

test_that("messy works without inconsistent sex", {
  messy_ll <- messy(ll, inconsistent_sex = FALSE)
  expect_true(all(messy_ll$sex %in% c("m", "f", NA_character_)))
})

test_that("messy works encoding sex as numeric", {
  messy_ll <- messy(ll, sex_as_numeric = TRUE, inconsistent_sex = FALSE)
  expect_true(all(messy_ll$sex %in% c(0L, 1L, NA_integer_)))
})

test_that("messy works without numeric_as_char", {
  messy_ll <- messy(ll, numeric_as_char = FALSE)
  col_class <- vapply(messy_ll, class, FUN.VALUE = character(1))
  expect_true(c("numeric", "integer") %in% col_class)
  expect_type(
    col_class[c("id", "age", "ct_value")],
    c("integer", "integer", "numeric")
  )
})

test_that("messy works with numeric_as_char & sex_as_numeric", {
  messy_ll <- messy(
    ll,
    numeric_as_char = TRUE,
    sex_as_numeric = TRUE,
    inconsistent_sex = FALSE
  )
  expect_false(
    c("numeric", "integer") %in%
      vapply(messy_ll, class, FUN.VALUE = character(1))
  )
  expect_type(messy_ll$sex, type = "character")
})

test_that("messy errors when sex_as_numeric & inconsistent_sex are TRUE", {
  expect_error(
    messy(ll, sex_as_numeric = TRUE),
    regexp = "Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`."
  )
})
