#' Button Modal
#'
#' This function creates a button from one modal that closes the current modal and then opens another modal
#' @param inputId This is the id of the modal that you want to navigate to
#' @param label This is the label of the button that is visible to the user.
#' @keywords button, modal
#' @export
#' @examples
#'   buttonModal("sample-id","ID Form")
buttonModal <- function(inputId, label){
  id = paste0("#",inputId,"-modal")
  
  tags$button(
    type="button"
    ,class="btn btn-default"
    ,`data-toggle` = "modal"
    ,`data-dismiss` = "modal"
    ,`data-target` = id
    ,label
  )
}

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