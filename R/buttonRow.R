#' Button Row
#'
#' This function creates a row of buttons
#' @param ... Insert button functions in a tagList {shiny}
#' @keywords button row, buttons
#' @export
#' @examples
#'   buttonRow(taglist(
#'   buttonModal(buttonModal("sample-id","ID Form")),
#'   actionButton("submit","Submit Responses", icon = icon("check"))
#'   ))

buttonRow <- function( ...){
  tags$div(class="btn-group", `role`="group", `aria-label`="Basic example", ...)
}
