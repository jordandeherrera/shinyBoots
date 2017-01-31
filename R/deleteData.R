#' Delete Data Function (CRUD)
#'
#' This function deletes the record selected
#' @param data Data to be deleted
#' @keywords CRUD, delete
#' @export
#' @examples
#' observeEvent(input$delete, {
#'   DeleteData(formData())
#'   UpdateInputs(CreateDefaultRecord(), session)
#' }, priority = 1)

DeleteData <- function(data) {
  responses <<- responses[row.names(responses) != unname(data["id"]), ]
}
