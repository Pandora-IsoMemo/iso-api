#' Backend V1 of the API
#'
#' @param dbsource (character) filter for database proider
#' @param category (character) filter for field category
#' @param field (character) filter for fields
#' @param mappingId (character) optional id to select one of the mappings, default is "IsoMemo"
#'
#' @export
isoDataV1 <- function(dbsource, category, field, mappingId) {

  mappingId <- mappingIdSanitize(mappingId, default = "IsoMemo")
  res <- step(list(), validateMappingId, mappingId)
  if (is.Error(res)) return(res)

  dbsource <- dbsourceSanitize(dbsource, default = getDbsource(mappingId = mappingId))
  category <- categorySanitize(category, default = NULL)
  field <- fieldSanitize(field, default = getFields(mappingId = mappingId))

  logging("Got request with: dbsource='%s'", collapse(dbsource))
  if (!is.null(category))
    logging("category='%s'", collapse(category))

  if (!identical(field, getFields(mappingId = mappingId)))
    logging("field='%s'", collapse(field))


  res <- step(res, validateDBSource, dbsource, mappingId)
  res <- step(res, validateCategory, category, mappingId)
  res <- step(res, validateField, field, mappingId)
  # only if validation succeeded getIsoData() will be executed:
  res <- step(res, getIsoData, dbsource, category, field, mappingId)
  res
}

validateMappingId <- function(x, mappingId) {
  validate$mappingId(x, mappingId)
}

validateDBSource <- function(x, dbsource, mappingId) {
  validate$dbsource(x, dbsource, mappingId)
}

validateCategory <- function(x, category, mappingId) {
  validate$category(x, category, mappingId)
}

validateField <- function(x, field, mappingId) {
  validate$field(x, field, mappingId)
}


step <- function(x, fun, ...) {
  if (is.Error(x)) x else fun(x, ...)
}
