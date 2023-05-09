#' Backend V1 of the mapping API
#'
#' @param mappingId id to select one of the mappings, e.g. "IsoMemo"
#' @export
mappingV1 <- function(mappingId = "IsoMemo") {
  mappingId <- mappingIdSanitize(mappingId, default = "IsoMemo")
  ## Version 1 of the API
  logging("Got request on v1/mapping with: mappingId='%s'", collapse(mappingId))

  res <- step(list(), validateMappingId, mappingId)
  # only if validation succeeded getMapping() will be executed:
  res <- step(res, getMapping, mappingId)
  res
}
