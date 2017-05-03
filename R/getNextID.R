#' Get Next ID (CRUD)
#'
#' This function gets the next ID in a data set as part of a CRUD series of functions.  Used in the create data function.
#' @keywords CRUD
#' @export
#' @examples
#' CreateData <- function(data) {
#' data <- CastData(data)
#' rownames(data) <- GetNextId()
#' if (exists("responses")) {
#'   responses <<- rbind(responses, data)
#' } else {
#'   responses <<- data
#' }
#' }

GetNextId <- function() {
  if (exists("responses") && nrow(responses) > 0) {
    max(as.integer(rownames(responses))) + 1
  } else {
    return (1)
  }
}
