context("validate")

testthat::test_that("validate", {
  e <- validate$timeFormat(NULL, "2018-01-2 00:00:00")
  testthat::expect_is(e, "Error")
  testthat::expect_equal(e$status, 400)
  testthat::expect_true(grepl("got time: .* expected", e$message))
  e <- validate$integerFormat(NULL, "1a")
  testthat::expect_is(e, "Error")
  testthat::expect_true(grepl("got value: .* integer", e$message))
  testthat::expect_null(
    validate$timeFormat(NULL, "2018-01-20T00:00:00")
  )
})
