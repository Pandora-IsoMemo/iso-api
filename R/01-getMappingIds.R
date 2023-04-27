getMappingIds <- function() {
  sendQueryCache("mappings")$dbmappings
}
