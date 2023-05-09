getMapping <- function(mappingId = "IsoMemo") {
  # only accepts a single mappingId
  Result(list(), mapping = sendQueryCache("mapping", mappingId = mappingId))
}
