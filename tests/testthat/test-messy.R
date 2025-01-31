test_that("messy works as expected by default", {
  # set seed to sim small outbreak
  set.seed(1234)
  ll <- sim_linelist()
  messy_ll <- messy(ll)
  expect_s3_class(messy_ll, "data.frame")
  expect_identical(dim(ll), dim(messy_ll))
  expect_identical(colnames(ll), colnames(messy_ll))
  expect_gt(sum(is.na(messy_ll)), sum(is.na(ll)))
})
