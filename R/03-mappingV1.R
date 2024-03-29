#' Backend V1 of the mapping API
#'
#' @param mappingId (character) optional id to select one of the mappings, default is "IsoMemo"
#'
#' @export
mappingV1 <- function(mappingId) {

  mappingId <- mappingIdSanitize(mappingId, default = "IsoMemo")
  logging("Got request on v1/mapping with: mappingId='%s'", collapse(mappingId))
  res <- step(list(), validateMappingId, mappingId)
  if (is.Error(res)) return(res)

  # only if validation succeeded getMapping() will be executed:
  res <- step(res, getMapping, mappingId)
  res
}
