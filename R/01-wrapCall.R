#' Wrap call to API endpoints
#'
#' This is overrides most of plumbers error handling mechanism and allows for
#' custom status flags and messages.
#'
#' @param expr (expression) a call to the API endpoint provided by the package.
#'
#' @export
wrapCall <- function(expr) {
  res <- try(expr)
  res <- if (inherits(res, "try-error")) {
    list(status = 500, message = "500 - Internal server error")
  } else if (is.null(expr$status)) {
    warning("Result has missing 'status': this has to be fixed!")
    res$status <- 200
    res
  } else if (!is.numeric(res$status)) {
    warning("Result status is not numeric: this has to be fixed!")
    res$status <- as.numeric(res$status)
    res
  } else {
    res
  }
}
