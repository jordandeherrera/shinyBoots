#' Update Inputs Function (CRUD)
#'
#' This function updates inputs as part of a CRUD series of functions.
#' @param data Data to be cast.
#' @keywords CRUD, update
#' @export
#' @examples
#' # Click "Submit" button -> save data
#' observeEvent(input$submit, {
#'   if (input$id != "0") {
#'     UpdateData(formData())
#'   } else {
#'     CreateData(formData())
#'     UpdateInputs(CreateDefaultRecord(), session)
#'   }
#' }, priority = 1)

UpdateInputs <- function(data, session) {
  updateTextInput(session, "id", value = unname(rownames(data)))
  updateTextInput(session, "requesterName", value = unname(data["requesterName"]))
  updateSelectizeInput(session, "propertyForm", selected = unname(data["propertyForm"]))
  updateSelectizeInput(session, "yearForm", selected = unname(data["yearForm"]))
  updateSelectizeInput(session, "monthForm", selected = unname(data["monthForm"]))
  updateSelectizeInput(session, "categoryForm", selected = unname(data["categoryForm"]))
  updateTextAreaInput(session, "notes", value = unname(data["notes"]))
}
