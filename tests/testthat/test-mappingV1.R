testthat::test_that("Endpoint dbsourcesV1 of Version 1 of API", {
  testthat::expect_is(
    mappingV1("Do not exist"),
    "Error"
  )
  testthat::expect_true(
    all(names(mappingV1()) %in% c("mapping", "status"))
    )
  testthat::expect_true(
    all(names(mappingV1(mappingId = 'IsoMemo')) %in% c("mapping", "status"))
  )
  testthat::expect_is(
    mappingV1(),
    c('Result', 'list')
  )
  testthat::expect_is(
    mappingV1()$mapping,
    "data.frame"
  )
  testthat::expect_true(
    all(colnames(mappingV1()$mapping) %in% c("shiny", "fieldType", "category", "mappingId"))
  )
  testthat::expect_identical(
    mappingV1()$mapping, getMapping(list())$mapping
  )
  testthat::expect_identical(
    mappingV1(mappingId = 'IsoMemo')$mapping, getMapping(list(), mappingId = 'IsoMemo')$mapping
  )
})
