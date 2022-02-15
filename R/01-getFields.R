getFields <- function() {
  data <- sendQueryCache("fields")

  c(
    names(data[[1]]),
    data[[2]]$variable,
    data[[3]]$variable
  )
}
