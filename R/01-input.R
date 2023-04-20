input <- function(x, default, sanitize = sanitizeInput) {
  if (missing(x)) default else sanitize(x)
}

matchValues <- function(x, y) {
  unlist(lapply(x, function(el) {
    if (el %in% tolower(y)) y[which(tolower(y) %in% el)]
    else el
  }))
}

sanitizeInput <- function(x) {
  x <- unlist(strsplit(x, ","))
  x <- trimws(x)
  gsub("\"|'", "", x)
  # gsub("T", " ", x) # relevant if we have timestamps
}

dbsourceSanitize <- function(dbsource, default, mappingId = "IsoMemo") {

  sanitize <- function(x) {
    x <- sanitizeInput(x)
    matchValues(tolower(x), getDbsource(mappingId = mappingId))
  }

  input(dbsource, default, sanitize)

}

categorySanitize <- function(category, default, mappingId = "IsoMemo"){
  sanitize <- function(x) {
    x <- sanitizeInput(x)
    matchValues(tolower(x), getCategories(mappingId = mappingId))
  }

  input(category, default, sanitize)
}

fieldSanitize <- function(field, default, mappingId = "IsoMemo"){
  sanitize <- function(x) {
    x <- sanitizeInput(x)
    matchValues(tolower(x), getFields(mappingId = mappingId))
  }

  input(field, default, sanitize)
}

mappingIdSanitize <- function(mappingId, default){
  sanitize <- function(x) {
    x <- sanitizeInput(x)
    matchValues(tolower(x), getMappingIds())
  }

  input(field, default, sanitize)
}
