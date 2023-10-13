testthat::test_that("Compare tables from main and test databases", {
  # helper function:
  mainEqualToTest <- function(main, test) {
    # identical no of rows?
    if (nrow(main) != nrow(test)) return("Number of rows differ")
    # identical no of cols?
    if (ncol(main) != ncol(test)) return("Number of cols differ")
    # identical colnames?
    if (any(colnames(main) != colnames(test))) return("Column names differ")

    # are all columns identical?
    identicalColumns <- sapply(colnames(main),
                               function(colname) {identical(main[[colname]],
                                                            test[[colname]])}
    )

    if (all(identicalColumns)) return(TRUE)

    # for the columns that are not identical:
    notIdenticalColumns <- names(identicalColumns[!identicalColumns])
    ## is data from main contained in test?
    mainPartOfTest <- sapply(notIdenticalColumns, function(column) {
      all(main[[column]] %in% test[[column]])
    })
    ## are all different values NA in main and not NA in test?
    ValueInTestButNAInMain <- sapply(notIdenticalColumns, function(column) {
      (main[[column]][!(test[[column]] %in% main[[column]])]) %>%
        is.na() %>%
        all()
    })

    differentColumns <- notIdenticalColumns[!(mainPartOfTest & ValueInTestButNAInMain)]

    if (length(differentColumns) == 0) {
      return(TRUE)
    } else {
      return(
        sprintf("values on test differ from non-NA values on main for columns %s",
                paste0(differentColumns, collapse = ", "))
      )
    }
  }

  # Arrange:
  cat(sprintf("content of path: system.file: %s",
              list.files(system.file(file.path("..", ".."), package = "MpiIsoApi"),
                         all.files = TRUE,
                         recursive = FALSE,
                         include.dirs = TRUE) %>% paste0(collapse = ", ")))
  if (file.exists(file.path(system.file(file.path("..", ".."), package = "MpiIsoApi"), ".inwt", "MpiIsoApi", "mpi-iso-api-config.R"))) {
    source(file.path(system.file(file.path("..", ".."), package = "MpiIsoApi"), ".inwt", "MpiIsoApi", "mpi-iso-api-config.R"), settings)
  } else
    source(file.path(settings$homeDir, "mpi-iso-api-config.R"), settings)
  resMain <- sendQueryCache("isoData",
                            dbsource = c("14CSea", "CIMA", "IntChron", "LiVES"),
                            mappingId = "IsoMemo")

  dataMain <- resMain[[1]]
  extraNumericMain <- spread(resMain[[2]], .data$variable, .data$value)
  extraCharacterMain <- spread(resMain[[3]], .data$variable, .data$value)

  if (file.exists(file.path(system.file(file.path("..", ".."), package = "MpiIsoApi"), ".inwt", "MpiIsoApi", "mpi-iso-api-test-config.R")))
    source(file.path(system.file(file.path("..", ".."), package = "MpiIsoApi"), ".inwt", "MpiIsoApi", "mpi-iso-api-test-config.R"), settings)
  else
    source(file.path(settings$homeDir, "mpi-iso-api-test-config.R"), settings)
  resTest <- sendQueryCache("isoData",
                            dbsource = c("14CSea", "CIMA", "IntChron", "LiVES"),
                            mappingId = "IsoMemo")

  dataTest <- resTest[[1]]
  extraNumericTest <- spread(resTest[[2]], .data$variable, .data$value)
  extraCharacterTest <- spread(resTest[[3]], .data$variable, .data$value)

  # Act:
  testthat::expect_true(mainEqualToTest(dataMain, dataTest))
  testthat::expect_true(mainEqualToTest(extraNumericMain, extraNumericTest))
  testthat::expect_true(mainEqualToTest(extraCharacterMain, extraCharacterTest))
})
