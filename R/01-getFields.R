getFields <- function(mappingId = "IsoMemo") {
  data <- sendQueryCache("fields", mappingId = mappingId)

  c(
    names(data[[1]]),
    data[[2]]$variable,
    data[[3]]$variable
  )
}
