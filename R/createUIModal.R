#' Create a Modal Based on a User Interface
#'
#' This function creates a modal based on a Shiny UI.
#' @param id This is the id of the modal that you are creating.
#' @param modalTitle This is the title of the modal that appears at the top of the modal.
#' @param uiOutputText This can be a tag list or a uiOutput from some other Shiny output.
#' @keywords modal, UI
#' @export
#' @examples
#'   createUIModal("sample-id","Upload file modal",
#'                 tagList(
#'                   fileInput("file1", "Load a File:")
#'                 ))

createUIModal <- function(id, modalTitle, uiOutputText) {
  
  ns <- NS(id)
  
  tags$div(class="modal fade", id=ns("modal"), tabindex="-1", role="dialog", `aria-labelledby`=ns("modelLabel"),
           tagList(
             
             HTML('<div class="modal-dialog" role="document">
                  <div class="modal-content">
                  <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'),
             
             tags$h4(class = "modal-title", id=ns("modelLabel"),modalTitle),
             
             HTML('</div><div class="modal-body">'),
             
             uiOutputText,
             
             HTML('</div>
                  <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                  </div>
                  </div>')
             )
             )
}
