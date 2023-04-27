settings <- list2env(list(
  homeDir = "~/.inwt/MpiIsoApi",
  config = "mpi-iso-api-config.R",
  host = "127.0.0.1",
  port = 3306,
  dbname = "mpiIsoTest"
))

.onLoad <- function(libname, pkgname) {
  if (!interactive()) logging(
    "This is MpiIsoApi in version %s\n",
    as.character(utils::packageVersion("MpiIsoApi")))
  try({
    if (file.exists(settings$config))
      source(settings$config, settings)
    else
      source(sprintf("%s/%s", settings$homeDir, settings$config), settings)
  })
  invisible(NULL)
}
