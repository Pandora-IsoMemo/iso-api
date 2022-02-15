Result <- function(x, ...) {
  res <- c(x, list(...))
  res$status <- 200
  class(res) <- c("Result", "list")
  res
}
