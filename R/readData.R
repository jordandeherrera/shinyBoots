#' Read Data Function (CRUD)
#'
#' This function reads data from a saved source.
#' @keywords CRUD, create
#' @export
#' @examples
#' observeEvent(input$responses_rows_selected, {
#'   if (length(input$responses_rows_selected) > 0) {
#'     data <- ReadData()[input$responses_rows_selected, ]
#'     UpdateInputs(data, session)
#'   }
#' })

ReadData <- function() {
  if (exists("responses")) {
    responses
  }
}
