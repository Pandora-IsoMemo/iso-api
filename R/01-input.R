input <- function(x, default, sanitize = sanitizeInput) {
  if (missing(x)) default else sanitize(x)
}

sanitizeInput <- function(x) {
  x <- unlist(strsplit(x, ","))
  x <- trimws(x)
  gsub("\"|'", "", x)
  # gsub("T", " ", x) # relevant if we have timestamps
}

dbsourceSanitize <- function(dbsource, default) {

  sanitize <- function(x) {
    x <- sanitizeInput(x)
    matchValues(tolower(x), getDbsource())
  }

  matchValues <- function(x, y) {
    unlist(lapply(x, function(el) {
      if (el %in% tolower(y)) y[which(tolower(y) %in% el)]
      else el
    }))
  }

  input(dbsource, default, sanitize)

}

categorySanitize <- function(category, default){
  sanitize <- function(x) {
    x <- sanitizeInput(x)
    matchValues(tolower(x), getCategories())
  }

  matchValues <- function(x, y) {
    unlist(lapply(x, function(el) {
      if (el %in% tolower(y)) y[which(tolower(y) %in% el)]
      else el
    }))
  }

  input(category, default, sanitize)
}

fieldSanitize <- function(field, default){
  sanitize <- function(x) {
    x <- sanitizeInput(x)
    matchValues(tolower(x), getFields())
  }

  matchValues <- function(x, y) {
    unlist(lapply(x, function(el) {
      if (el %in% tolower(y)) y[which(tolower(y) %in% el)]
      else el
    }))
  }

  input(field, default, sanitize)
}

