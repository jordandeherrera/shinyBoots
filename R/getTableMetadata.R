#' Get Table Metadata Function (CRUD)
#'
#' This function gets table metadata as part of a CRUD series of functions.
#' @keywords CRUD, metadata
#' @export
#' @examples
#' # input fields are treated as a group
#' formData <- reactive({
#'   sapply(names(GetTableMetadata()$fields), function(x) input[[x]])
#' })

GetTableMetadata <- function() {
  fields <- c(id = "Id",
              requesterName = "Requester Name",
              propertyForm = "Property",
              yearForm = "Year",
              monthForm = "Month",
              categoryForm = "Category",
              notes = "Notes")
  result <- list(fields = fields)
  return (result)
}
