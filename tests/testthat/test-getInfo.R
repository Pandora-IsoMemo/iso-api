context("Get Avaiable DBs, categories, fields")

testthat::test_that("DBs", {
  testthat::expect_is(getDbsource(), "character")
})

testthat::test_that("Categories", {
  testthat::expect_is(getCategories(), "character")
})

testthat::test_that("Fields", {
  testthat::expect_is(getFields(), "character")
})
