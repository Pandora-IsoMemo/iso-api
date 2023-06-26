# prevent NOTE in R CMD CHECK because of
# spread(..., variable, value)
if(getRversion() >= "2.15.1") utils::globalVariables(c("variable", "value"))

getIsoData <- function(x, dbsource, category, field) {
  res <- sendQueryCache("isoData", dbsource = dbsource)

  data <- res[[1]]
  extraNumeric <- spread(res[[2]], variable, value)
  extraCharacter <- spread(res[[3]], variable, value)

  data <- data %>%
    left_join(extraNumeric, by = c("id", "source")) %>%
    left_join(extraCharacter, by = c("id", "source")) %>%
    selectCategory(category)

  field <- intersect(field, names(data))

  data <- data %>%
    select(field)

  res <- sendQueryCache("lastUpdate")
  lastUpdate <- res$lastUpdate

  Result(x, isodata = data, updated = lastUpdate)
}


selectCategory <- function(data, category){
  .data <- NULL
  if (is.null(category)) return(data)

  mapping <- sendQueryCache("mapping")
  fields <- mapping %>%
    filter(category %in% !!category) %>%
    pull(.data$shiny) %>%
    intersect(names(data))

  data %>%
    select(fields)
}
