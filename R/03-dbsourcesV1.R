#' Backend V1 of the dbsources API
#'
#' @export
dbsourcesV1 <- function() {
  ## Version 1 of the API
  logging("Got request on v1/dbsources")

  getDbsourceList()
}
