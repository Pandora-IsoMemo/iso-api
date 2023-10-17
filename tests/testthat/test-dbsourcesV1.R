testthat::test_that("Endpoint dbsourcesV1 of Version 1 of API", {
  testthat::expect_is(
    dbsourcesV1("Do not exist"),
    "Error"
  )
  testthat::expect_true(
    all(names(dbsourcesV1()) %in% c("dbsource", "status"))
  )
  testthat::expect_true(
    all(names(dbsourcesV1(mappingId = 'IsoMemo')) %in% c("dbsource", "status"))
  )
  testthat::expect_is(
    dbsourcesV1(),
    c('Result', 'list')
  )
  testthat::expect_is(
    dbsourcesV1()$dbsource,
    "list"
  )
  testthat::expect_true(
    all(unlist(dbsourcesV1()$dbsource) %in% getDbsource())
  )
  testthat::expect_true(
    all(unlist(dbsourcesV1(mappingId = 'IsoMemo')$dbsource) %in% getDbsource(mappingId = 'IsoMemo'))
  )
})
