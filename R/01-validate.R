validate  <- modules::module({

  validate <- function(msg, fun) {
    function(x, val, ...) {
      if (fun(val, ...)) x
      else Error(400, sprintf(msg, val))
    }
  }

  timeFormat <- validate(
    "got time: %s expected: 'YYYY-MM-DDTHH:MM:SS'",
    .validateStartTimeFormat <- function(val) {
      grepl(dateTimeRegEx, val)
    })

  integerFormat <- validate(
    "got value: %s expected: integer",
    function(val) {
      grepl("^[0-9]+$", val)
    })

  integerInRange <- validate(
    "got range: %s expected: 1 < integer 1000 ?",
    function(val) {
      grepl("^[1-9][0-9]{0,2}$", val)
    })

  dbsource <- validate(
    sprintf("got dbsource: '%%s' expected one in (%s)", collapse(getDbsource())),
    function(val) {
      all(val %in% getDbsource())
    }
  )

  category <- validate(
    sprintf("got category: '%%s' expected one in (%s)", collapse(getCategories())),
    function(val) {
      all(val %in% getCategories())
    }
  )

  field <- validate(
    sprintf("got field: '%%s' expected one in (%s)", collapse(getFields())),
    function(val) {
      all(val %in% getFields())
    }
  )


  dateRegEx <- "[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])"
  timeRegEx <- "([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]"
  dateTimeRegEx <- paste0("^", dateRegEx, "(T| )", timeRegEx, "$")

})
