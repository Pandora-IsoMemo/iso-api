getMapping <- function(x, mappingId = "IsoMemo") {
  # only accepts a single mappingId
  Result(x, mapping = sendQueryCache("mapping", mappingId = mappingId))
}
