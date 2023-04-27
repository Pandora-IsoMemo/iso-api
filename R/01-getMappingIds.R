getMappingIds <- function() {
  sendQueryCache("mappings")$dbmappings
}

getMappingIdsList <- function(mappingId = "IsoMemo"){
  Result(list(), mappingIds = as.list(getMappingIds()))
}

getMappingAll <- function() {
  Result(list(), mapping = sendQueryCache("mappingsAll"))
}
