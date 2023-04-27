getMappingIds <- function() {
  sendQueryCache("mappings")$dbmappings
}

getMappingIdsList <- function(mappingId = "IsoMemo"){
  Result(list(), mappingIds = as.list(getMappingIds()))
}
