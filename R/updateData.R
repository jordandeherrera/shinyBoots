#' Update Data Function (CRUD)
#'
#' This function updates data in a stored source.
#' @param data Data to be updated
#' @keywords CRUD, update
#' @export
#' @examples
#' observeEvent(input$submit, {
#'   if (input$id != "0") {
#'     UpdateData(formData())
#'   } else {
#'     CreateData(formData())
#'     UpdateInputs(CreateDefaultRecord(), session)
#'   }
#' }, priority = 1)

UpdateData <- function(data) {
  data <- CastData(data)
  responses[row.names(responses) == row.names(data), ] <<- data
}
