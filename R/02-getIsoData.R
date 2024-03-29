getIsoData <- function(x, dbsource, category, field, mappingId = "IsoMemo") {
  res <- sendQueryCache("isoData", dbsource = dbsource, mappingId = mappingId)
  data <- res[[1]]
  extraNumeric <- spread(res[[2]], .data$variable, .data$value)
  extraCharacter <- spread(res[[3]], .data$variable, .data$value)

  data <- data %>%
    left_join(extraNumeric, by = c("id", "source")) %>%
    left_join(extraCharacter, by = c("id", "source")) %>%
    selectCategory(category, mappingId = mappingId)

  field <- intersect(field, names(data))

  data <- data %>%
    select(field)

  res <- sendQueryCache("lastUpdate", mappingId = mappingId)
  lastUpdate <- res$lastUpdate

  Result(x, isodata = data, updated = lastUpdate)
}


selectCategory <- function(data, category, mappingId = "IsoMemo"){
  shiny <- NULL
  if (is.null(category)) return(data)

  mapping <- sendQueryCache("mapping", mappingId = mappingId)
  fields <- mapping %>%
    filter(category %in% !!category) %>%
    pull(shiny) %>%
    intersect(names(data))

  data %>%
    select(fields)
}
