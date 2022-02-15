# This file defines which endpoints are available for the client. The endpoints
# should only build the interface to functions in the package. No other logic in
# this file!

#* @get /v1/iso-data
#* @serializer unboxedJSON
isoDataV1 <- function(res, dbsource, category, field) {
  out <- MpiIsoApi::wrapCall(MpiIsoApi::isoDataV1(dbsource, category, field))
  res$status <- out$status
  out
}

#* @get /v1/dbsources
#* @serializer unboxedJSON
dbsourcesV1 <- function(res) {
  out <- MpiIsoApi::wrapCall(MpiIsoApi::dbsourcesV1())
  res$status <- out$status
  out
}

#* @get /v1/mapping
#* @serializer unboxedJSON
mappingV1 <- function(res) {
  out <- MpiIsoApi::wrapCall(MpiIsoApi::mappingV1())
  res$status <- out$status
  out
}
