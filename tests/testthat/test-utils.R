test_that(".anonymise works as expected", {
  set.seed(1)
  expect_identical(.anonymise("string"), "5dMaH9wQnr")
})

test_that(".anonymise works as expected with different string_lne", {
  set.seed(1)
  expect_identical(.anonymise("string", string_len = 5), "5dMaH")
})

test_that(".anonymise works as expected with NAs", {
  set.seed(1)
  expect_identical(
    .anonymise(c("string", NA, "string2", NA)),
    c("5dMaH9wQnr", NA, "7YGuuP2Tjg", NA)
  )
})

test_that(".anonymise works as expected with repeated strings", {
  set.seed(1)
  expect_identical(
    .anonymise(c("string", "string2", "string")),
    c("5dMaH9wQnr", "7YGuuP2Tjg", "5dMaH9wQnr")
  )
})

test_that(".as_df and .restore_df_subclass work as expected", {
  df <- data.frame(a = 1)
  class(df) <- c("tbl", "data.frame")
  df <- .as_df(df)
  expect_s3_class(df, class = "data.frame", exact = TRUE)
  expect_contains(names(attributes(df)), ".class")
  df <- .restore_df_subclass(df)
  expect_s3_class(df, class = c("tbl", "data.frame"), exact = TRUE)
  expect_false(".class" %in% names(attributes(df)))
})
