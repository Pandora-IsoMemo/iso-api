getDbsource <- function() {
  sendQueryCache("dbsource")$dbsource
}

getDbsourceList <- function(){
  Result(list(), dbsource = as.list(getDbsource()))
}
