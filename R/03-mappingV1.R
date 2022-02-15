#' Backend V1 of the mapping API
#'
#' @export
mappingV1 <- function() {
  ## Version 1 of the API
  logging("Got request on v1/mapping")

  getMapping()
}
