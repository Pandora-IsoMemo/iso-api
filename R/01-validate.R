validate  <- modules::module({

  validate <- function(msgFun, fun) {
    function(x, val, mappingId = "IsoData", ...) {
      if (fun(val, mappingId, ...)) x
      else Error(400, sprintf(msgFun(mappingId), val))
    }
  }

  timeFormat <- validate(
    function(mappingId) "got time: %s expected: 'YYYY-MM-DDTHH:MM:SS'",
    .validateStartTimeFormat <- function(val, mappingId) {
      grepl(dateTimeRegEx, val)
    })

  integerFormat <- validate(
    function(mappingId) "got value: %s expected: integer",
    function(val, mappingId) {
      grepl("^[0-9]+$", val)
    })

  integerInRange <- validate(
    function(mappingId) "got range: %s expected: 1 < integer 1000 ?",
    function(val, mappingId) {
      grepl("^[1-9][0-9]{0,2}$", val)
    })

  mappingId <- validate(
    function(mappingId) sprintf("got mappingId: '%%s' expected a single one in (%s)", collapse(getMappingIds())),
    function(val, mappingId) {
      length(val) == 1 && (val %in% getMappingIds())
    }
  )

  dbsource <- validate(
    function(mappingId) sprintf("got dbsource: '%%s' expected one in (%s)", collapse(getDbsource(mappingId = mappingId))),
    function(val, mappingId) {
      all(val %in% getDbsource(mappingId = mappingId))
    }
  )

  category <- validate(
    function(mappingId) sprintf("got category: '%%s' expected one in (%s)", collapse(getCategories(mappingId = mappingId))),
    function(val, mappingId) {
      all(val %in% getCategories(mappingId = mappingId))
    }
  )

  field <- validate(
    function(mappingId) sprintf("got field: '%%s' expected one in (%s)", collapse(getFields(mappingId = mappingId))),
    function(val, mappingId) {
      all(val %in% getFields(mappingId = mappingId))
    }
  )

  dateRegEx <- "[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])"
  timeRegEx <- "([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]"
  dateTimeRegEx <- paste0("^", dateRegEx, "(T| )", timeRegEx, "$")

})
