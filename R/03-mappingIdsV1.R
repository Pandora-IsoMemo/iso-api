#' Backend V1 of the mappingIds API
#'
#' @export
mappingIdsV1 <- function() {
  ## Version 1 of the API
  logging("Got request on v1/mappingIds")

  getMappingIdsList()
}
