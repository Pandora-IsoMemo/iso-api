getMapping <- function(mappingId = "IsoMemo") {
  Result(list(), mapping = sendQueryCache("mapping", mappingId = mappingId))
}
