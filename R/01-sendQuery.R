sendQueryCache <- function(query, ...) {
  print(paste("query: ", query))
  query <- dbtools::Query(getQuery(query), ...)
  print(query)
  dbtools::sendQuery(CacheDB(), query, retries = 4, intSleep = 4)
}

getQuery <- function(query) {
  if (grepl(";$", query)) query
  else file(system.file(
    sprintf("sql/%s.sql", sub("\\.sql$", "", query, ignore.case = TRUE)),
    package = "MpiIsoApi",
    mustWork = TRUE
  ))
}

CacheDB <- function() {
  dbtools::Credentials(
    dbtools::MySQL,
    username = settings$username,
    password = settings$password,
    dbname = settings$dbname,
    host = settings$host,
    port = settings$port
  )
}
