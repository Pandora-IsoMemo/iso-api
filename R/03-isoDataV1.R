#' Backend V1 of the API
#'
#' @param dbsource (character) filter for database proider
#' @param category (character) filter for field category
#' @param field (character) filter for fields
#'
#' @export
isoDataV1 <- function(dbsource, category, field) {
  ## Version 1 of the API
  dbsource <- dbsourceSanitize(dbsource, getDbsource())
  category <- categorySanitize(category, NULL)
  field <- fieldSanitize(field, getFields())

  logging("Got request with: dbsource='%s'", collapse(dbsource))
  if (!is.null(category))
    logging("category='%s'", collapse(category))

  if (!identical(field, getFields()))
    logging("field='%s'", collapse(field))

  res <- step(list(), validateDBSource, dbsource)
  res <- step(res, validateCategory, category)
  res <- step(res, validateField, field)
  res <- step(res, getIsoData, dbsource, category, field)
  res
}

validateDBSource <- function(x, dbsource) {
  validate$dbsource(x, dbsource)
}

validateCategory <- function(x, category) {
  validate$category(x, category)
}

validateField <- function(x, field) {
  validate$field(x, field)
}


step <- function(x, fun, ...) {
  if (is.Error(x)) x else fun(x, ...)
}
