Error <- function(status, message) {
  errormsg <- switch(
    as.character(status),
    "400" = "400 - Bad Request",
    "500" = "500 - Internal Server Error",
    sprintf("%s - Error", status)
  )
  out <- list(status = status, message = sprintf("%s - %s", errormsg, message))
  class(out) <- c("Error", "list")
  out
}

is.Error <- function(x) {
  inherits(x, "Error")
}
