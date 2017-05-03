#' Button Modal
#'
#' This function creates a button within a modal that simultaneously closes the current modal and then opens another modal.
#' @param inputId This is the id of the button.
#' @param label This is the label of the button visible to the user.
#' @keywords modal, buttons, user interface
#' @export
#' @examples
#' buttonModal("upload-ui", "Upload Data")

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
