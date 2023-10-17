testthat::test_that("Endpoint dbsourcesV1 of Version 1 of API", {
  testthat::expect_true(
    all(names(mappingIdsV1()) %in% c("mappingIds", "status"))
  )
  testthat::expect_is(
    mappingIdsV1(),
    c('Result', 'list')
  )
  testthat::expect_is(
    mappingIdsV1()$mappingIds,
    "list"
  )
  testthat::expect_true(
    length(mappingIdsV1()$mappingIds) > 0
  )
  testthat::expect_identical(
    mappingIdsV1()$mappingIds, getMappingIdsList()$mappingIds
  )
})
