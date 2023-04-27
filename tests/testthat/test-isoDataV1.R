context("Version 1")

testthat::test_that("Version 1 of API", {
  testthat::expect_is(
    isoDataV1()$isodata,
    "data.frame"
  )
  testthat::expect_is(
    isoDataV1("Do not exist"),
    "Error"
  )
  testthat::expect_true(
    all(unique(isoDataV1()$isodata$source) %in% getDbsource())
  )
  testthat::expect_true(
    all(unique(isoDataV1("isomemo")$isodata$source) %in% getDbsource())
  )
  testthat::expect_true(
    all(unique(isoDataV1("isomemo,intchron")$isodata$source) %in% getDbsource())
  )
  testthat::expect_is(
    isoDataV1("isomemo,in"),
    "Error"
  )
  testthat::expect_true(
    all(unique(isoDataV1(c("isomemo", "intchron"))$isodata$source) %in% getDbsource())
  )
})
