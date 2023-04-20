getMappingIds <- function() {
  Result(list(), mappings = sendQueryCache("mappings"))
}
