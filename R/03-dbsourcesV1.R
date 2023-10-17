#' Backend V1 of the dbsources API
#'
#' @param mappingId (character) optional id to select one of the mappings, default is "IsoMemo"
#'
#' @export
dbsourcesV1 <- function(mappingId) {

  mappingId <- mappingIdSanitize(mappingId, default = "IsoMemo")
  logging("Got request on v1/dbsources with: mappingId='%s'", collapse(mappingId))
  res <- step(list(), validateMappingId, mappingId)
  if (is.Error(res)) return(res)

  # only if validation succeeded getDbsourceList() will be executed:
  res <- step(res, getDbsourceList, mappingId)
  res
}
