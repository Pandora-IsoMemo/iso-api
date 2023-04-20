getDbsource <- function(mappingId = "IsoMemo") {
  sendQueryCache("dbsource", mappingId = mappingId)$dbsource
}

getDbsourceList <- function(mappingId = "IsoMemo"){
  Result(list(), dbsource = as.list(getDbsource(mappingId = mappingId)))
}
