# set seed to sim small outbreak
set.seed(1234)
ll <- sim_linelist()

test_that("messy_linelist works as expected by default", {
  messy_ll <- messy_linelist(ll)
  expect_s3_class(messy_ll, "data.frame")
  expect_identical(nrow(ll) + 1L, nrow(messy_ll))
  expect_identical(colnames(ll), colnames(messy_ll))
  expect_gt(sum(is.na(messy_ll)), sum(is.na(ll)))
  col_class <- vapply(messy_ll, class, FUN.VALUE = character(1))
  expect_false(all(c("numeric", "integer") %in% col_class))
  expect_false("Date" %in% col_class)
  expect_gt(anyDuplicated(messy_ll), 0)
})

test_that("messy_linelist works with different missing_value", {
  messy_ll <- suppressWarnings(
    messy_linelist(
      ll,
      prop_missing = 0.8,
      missing_value = -99L,
      numeric_as_char = FALSE,
      prop_int_as_word = 0
    )
  )
  expect_type(messy_ll$id, "integer")
  expect_type(messy_ll$age, "integer")
  expect_type(messy_ll$date_onset, "character")
  expect_type(messy_ll$case_name, "character")
})

test_that("messy_linelist works with higher proportion of spelling mistakes", {
  # set seed to ensure spelling mistakes are introduced
  set.seed(3)
  messy_ll <- messy_linelist(
    ll,
    prop_spelling_mistakes = 1,
    prop_duplicate_row = 0
  )
  # Levenshtein distance between clean and messy strings should be 1
  expect_true(
    all(diag(utils::adist(ll$case_name, messy_ll$case_name)) == 1, na.rm = TRUE)
  )
  expect_true(
    all(diag(utils::adist(ll$case_type, messy_ll$case_type)) == 1, na.rm = TRUE)
  )
})

test_that("messy_linelist works with zero spelling mistakes", {
  messy_ll <- messy_linelist(
    ll,
    prop_spelling_mistakes = 0,
    prop_duplicate_row = 0
  )
  # Levenshtein distance between clean and messy strings should be 0
  expect_true(
    all(diag(utils::adist(ll$case_name, messy_ll$case_name)) == 0, na.rm = TRUE)
  )
  expect_true(
    all(diag(utils::adist(ll$case_type, messy_ll$case_type)) == 0, na.rm = TRUE)
  )
})

test_that("messy_linelist works with inconsistent sex", {
  # turn off spelling mistakes to match sex characters
  messy_ll <- messy_linelist(ll, prop_spelling_mistakes = 0)
  expect_false(all(messy_ll$sex %in% c("m", "f", NA_character_)))
  expect_true(all(
    messy_ll$sex %in% c(
      "m", "f", "M", "F", "male", "female", "Male", "Female", NA_character_
    )
  ))
})

test_that("messy_linelist works without inconsistent sex", {
  messy_ll <- messy_linelist(ll, inconsistent_sex = FALSE)
  expect_true(all(messy_ll$sex %in% c("m", "f", NA_character_)))
})

test_that("messy_linelist works encoding sex as numeric", {
  messy_ll <- messy_linelist(
    ll,
    sex_as_numeric = TRUE,
    inconsistent_sex = FALSE
  )
  expect_true(all(messy_ll$sex %in% c(0L, 1L, NA_integer_)))
})

test_that("messy_linelist works without numeric_as_char", {
  messy_ll <- messy_linelist(ll, numeric_as_char = FALSE, prop_int_as_word = 0)
  col_class <- vapply(messy_ll, class, FUN.VALUE = character(1))
  expect_true(all(c("numeric", "integer") %in% col_class))
  expect_true(all(
    c("integer", "numeric") %in% col_class[c("id", "age", "ct_value")]
  ))
})

test_that("messy_linelist works with numeric_as_char & sex_as_numeric", {
  messy_ll <- messy_linelist(
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

test_that("messy_linelist works without date_as_char", {
  messy_ll <- messy_linelist(ll, date_as_char = FALSE)
  col_class <- vapply(messy_ll, class, FUN.VALUE = character(1))
  expect_true("Date" %in% col_class)
  expect_true(all(col_class[startsWith(names(col_class), "date_")] == "Date"))
})

test_that("messy_linelist works with inconsistent_dates", {
  # no missing values to match every date in regexp
  messy_ll <- messy_linelist(ll, inconsistent_dates = TRUE, prop_missing = 0)
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

test_that("messy_linelist works with zero prop_int_as_words", {
  messy_ll <- messy_linelist(ll, prop_int_as_word = 0, numeric_as_char = FALSE)
  expect_identical(
    vapply(ll, is.integer, FUN.VALUE = logical(1)),
    vapply(messy_ll, is.integer, FUN.VALUE = logical(1))
  )
})

test_that("messy_linelist works with zero duplicate rows", {
  messy_ll <- messy_linelist(ll, prop_duplicate_row = 0)
  expect_identical(anyDuplicated(messy_ll), 0L)
})

test_that("messy_linelist works with inconsistent_id", {
  messy_ll <- messy_linelist(ll, inconsistent_id = TRUE, prop_int_as_word = 0)
  expect_false(identical(ll$id, messy_ll$id))
})

test_that("messy_linelist warns when coercing from missing_value", {
  expect_warning(
    messy_linelist(
      ll,
      missing_value = "n/a",
      numeric_as_char = FALSE,
      date_as_char = FALSE
    ),
    regexp = "(The linelist columns)*(date_)*(are being coerced to character)"
  )
})

test_that("messy_linelist errors with incorrect linelist", {
  expect_error(
    messy_linelist(data.frame(a = 1)),
    regexp = "(linelist must be a data.frame output from)*(sim_linelist)"
  )
})

test_that("messy_linelist errors sex_as_numeric & inconsistent_sex are TRUE", {
  expect_error(
    messy_linelist(ll, sex_as_numeric = TRUE),
    regexp = "Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`."
  )
})

test_that("messy_linelist errors date_as_char = FALSE & inconsistent_dates = TRUE", {
  expect_error(
    messy_linelist(ll, date_as_char = FALSE, inconsistent_dates = TRUE),
    regexp = "`date_as_char` must be TRUE when `inconsistent_dates = TRUE`."
  )
})

test_that("messy_linelist errors when incorrect argument passed to dots", {
  expect_error(
    messy_linelist(ll, random_arg = TRUE),
    regexp = "(Incorrect argument names supplied to)*(messy_linelist)"
  )
})
