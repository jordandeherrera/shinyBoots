#' CSV File Input
#'
#' This function creates a csv file input.
#' @param id This is the id of the input.
#' @param label This is the label of the input.
#' @keywords csv, input, file
#' @export
#' @examples
#' csvFileInput("property","Upload CSV of Properties")

csvFileInput <- function(id, label = "CSV file") {
  # Create a namespace function using the provided id
  ns <- NS(id)

  tagList(
    fileInput(ns("file"), label),
    checkboxInput(ns("heading"), "Has heading", value=T),
    selectInput(ns("quote"), "Quote", c(
      "None" = "",
      "Double quote" = "\"",
      "Single quote" = "'"),
      selected = "\"")
  )
}
