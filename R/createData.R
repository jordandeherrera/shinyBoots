#' Create Data Function (CRUD)
#'
#' This function appends or creates data.
#' @param data Data to be added/created.
#' @keywords CRUD, create
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

CreateData <- function(data) {
  data <- CastData(data)
  rownames(data) <- GetNextId()
  if (exists("responses")) {
    responses <<- rbind(responses, data)
  } else {
    responses <<- data
  }
}
