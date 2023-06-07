getDbsource <- function(mappingId = "IsoMemo") {
  # only accepts a single mappingId
  sendQueryCache("dbsource", mappingId = mappingId)$dbsource
}

getDbsourceList <- function(x, mappingId = "IsoMemo"){
  Result(x, dbsource = as.list(getDbsource(mappingId = mappingId)))
}
