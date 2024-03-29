settings <- list2env(list(
  homeDir = "~/.inwt/MpiIsoApi",
  config = "mpi-iso-api-config.R",
  port = 3306,
  dbname = "mpiIso"
))

.onLoad <- function(libname, pkgname) {
  if (!interactive()) logging(
    "This is MpiIsoApi in version %s\n",
    as.character(utils::packageVersion("MpiIsoApi")))
  try({
    if (file.exists(settings$config))
      source(settings$config, settings)
    else
      source(file.path(settings$homeDir, settings$config), settings)
  })
  invisible(NULL)
}

#' Get Port
#'
#' @export
getPort <- function() {
  if (Sys.getenv("PORT") != "") {
    port <- Sys.getenv("PORT")
  } else {
    port <- Sys.getenv("PORT_DEFAULT")
  }

  port %>% as.numeric()
}
