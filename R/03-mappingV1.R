#' Backend V1 of the mapping API
#'
#' @param mappingId (character) optional id to select one of the mappings, default is "IsoMemo"
#'
#' @export
mappingV1 <- function(mappingId) {

  mappingId <- mappingIdSanitize(mappingId, default = "IsoMemo")
  res <- step(list(), validateMappingId, mappingId)
  if (is.Error(res)) return(res)

  logging("Got request on v1/mapping with: mappingId='%s'", collapse(mappingId))

  # only if validation succeeded getMapping() will be executed:
  res <- step(res, getMapping, mappingId)
  res
}
