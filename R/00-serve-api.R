#' Start server and provide API
#'
#' Serves on localhost.
#'
#' @param port (numeric)
#'
#' @export
serveAPI <- function(port = 8000) {
  apiSpecifications <- system.file(
    "APISpecifications.R",
    package = "MpiIsoApi",
    mustWork = TRUE)
  plumb(apiSpecifications)$run(port = port)
}

plumb <- function(file) {
  # same as plumber::plumb just with fix implemented
  plumberFix$new(file)
}

plumberFix <- R6::R6Class(
  "plumberFix",
  inherit = plumber::plumber,
  public = list(
    run = function(host = '0.0.0.0', port = 8000, swagger = interactive()) {
      # This is a copy of the original run method provided by the authors
      # We need this because they have decided that it is a good idea to change
      # working directories. This is not what we want here.

      options(plumber.debug = 0) # necessary for error handling

      # Plus, if side effects were not enough, we also need to work around the use of globals
      # .globals$debug <- self$debug # leave as default no matter what
      message("Starting server to listen on port ", port)

      ## if (!is.null(private$filename)){
      ##   cwd <- getwd()
      ##   on.exit({ setwd(cwd) })
      ##   setwd(dirname(private$filename))
      ## }

      # This code block references some stuff from the original package. We do
      # not need it and it won't work in this context.
      if (FALSE) {
        sf <- self$swaggerFile()
        # Create a function that's hardcoded to return the swaggerfile -- regardless of env.
        fun <- function(){ }
        body(fun) <- sf
        self$addEndpoint("GET", "/swagger.json", fun, unboxedJsonSerializer())
        self$addAssets(system.file("swagger-ui", package = "plumber"), path = "/__swagger__")
        message("Running the swagger UI at http://127.0.0.1:", port, "/__swagger__/")
      }

      httpuv::runServer(host, port, self)
    }
  )
)
