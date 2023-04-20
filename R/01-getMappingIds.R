getMappingIds <- function() {
  sendQueryCache("mappings")$mappings
}
