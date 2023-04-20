#' Backend V1 of the dbsources API
#'
#' @param mappingId id to select one of the mappings, e.g. "IsoMemo"
#' @export
dbsourcesV1 <- function(mappingId = "IsoMemo") {
  mappingId <- mappingIdSanitize(mappingId, default = "IsoMemo")

  logging("Got request on v1/dbsources with: mappingId='%s'", collapse(mappingId))

  res <- step(list(), validateMappingId, mappingId)
  # only if validation succeeded getDbsourceList() will be executed:
  res <- step(res, getDbsourceList, mappingId)
  res
}
