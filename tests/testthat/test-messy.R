# set seed to sim small outbreak
set.seed(1234)
ll <- sim_linelist()

test_that("messy works as expected by default", {
  messy_ll <- messy(ll)
  expect_s3_class(messy_ll, "data.frame")
  expect_identical(dim(ll), dim(messy_ll))
  expect_identical(colnames(ll), colnames(messy_ll))
  expect_gt(sum(is.na(messy_ll)), sum(is.na(ll)))
  col_class <- vapply(messy_ll, class, FUN.VALUE = character(1))
  expect_false(all(c("numeric", "integer") %in% col_class))
  expect_false("Date" %in% col_class)
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
  # turn off spelling mistakes to match sex characters
  messy_ll <- messy(ll, prop_spelling_mistakes = 0)
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
  expect_true(all(c("numeric", "integer") %in% col_class))
  expect_true(all(
    c("integer", "numeric") %in% col_class[c("id", "age", "ct_value")]
  ))
})

test_that("messy works with numeric_as_char & sex_as_numeric", {
  messy_ll <- messy(
    ll,
    numeric_as_char = TRUE,
    sex_as_numeric = TRUE,
    inconsistent_sex = FALSE
  )
  expect_false(
    any(c("numeric", "integer") %in%
      vapply(messy_ll, class, FUN.VALUE = character(1)))
  )
  expect_type(messy_ll$sex, type = "character")
})

test_that("messy works without date_as_char", {
  messy_ll <- messy(ll, date_as_char = FALSE)
  col_class <- vapply(messy_ll, class, FUN.VALUE = character(1))
  expect_true("Date" %in% col_class)
  expect_true(all(col_class[startsWith(names(col_class), "date_")] == "Date"))
})

test_that("messy works with inconsistent_dates", {
  # no missing values to match every date in regexp
  messy_ll <- messy(ll, inconsistent_dates = TRUE, prop_missing = 0)
  expect_true(all(
    grepl(
      pattern = paste0(
        "^\\d{4}([-/]\\d{2}[-/]\\d{2})$|", # "%Y-%m-%d", "%Y/%m/%d"
        "^\\d{2}([-/]\\d{2}[-/]\\d{4})$|", # "%d-%m-%Y", "%d/%m/%Y"
        "^\\d{2} (\\w{3,9}) \\d{4}$" # "%d %B %Y", "%d %b %Y"
      ),
      x = messy_ll$date_onset
    )))
})

test_that("messy works without int_as_words", {
  messy_ll <- messy(ll, int_as_word = FALSE, numeric_as_char = FALSE)
  expect_identical(
    vapply(ll, is.integer, FUN.VALUE = logical(1)),
    vapply(messy_ll, is.integer, FUN.VALUE = logical(1))
  )
})

test_that("messy errors when sex_as_numeric & inconsistent_sex are TRUE", {
  expect_error(
    messy(ll, sex_as_numeric = TRUE),
    regexp = "Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`."
  )
})

test_that("messy errors when date_as_char is FALSE & inconsistent_dates is TRUE", {
  expect_error(
    messy(ll, date_as_char = FALSE, inconsistent_dates = TRUE),
    regexp = "`date_as_char` must be TRUE when `inconsistent_dates = TRUE`."
  )
})

test_that("messy errors when incorrect argument passed to dots", {
  expect_error(
    messy(ll, random_arg = TRUE),
    regexp = "(Incorrect argument names supplied to)*(messy)"
  )
})
