getMappingIds <- function() {
  sendQueryCache("mappings")$dbmappings
}

getMappingAll <- function() {
  Result(list(), mapping = sendQueryCache("mappingAll"))
}
