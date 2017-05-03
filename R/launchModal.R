#' Create Launch Modal
#'
#' This function creates a modal that appears on launch
#' @param inputId This is the id of the modal that you are creating.
#' @param label The label of the modal that appears to the user
#' @keywords modal
#' @export
#' @examples
#' createLaunchModal("upload-ui","Step 2: Upload data")

createLaunchModal <- function(inputId, label){
  id = paste0("#",inputId,"-modal")

  tags$li(
    tags$a(
      href="#"
      ,`data-toggle` = "modal"
      ,`data-target` = id
      ,label
    )
  )
}
