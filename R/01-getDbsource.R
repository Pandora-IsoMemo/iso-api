getDbsource <- function(mappingId = "IsoMemo") {
  # only accepts a single mappingId
  sendQueryCache("dbsource", mappingId = mappingId)$dbsource
}

getDbsourceList <- function(mappingId = "IsoMemo"){
  Result(list(), dbsource = as.list(getDbsource(mappingId = mappingId)))
}
