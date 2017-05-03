#' Create a Modal Based On a Google Slide Presentation
#'
#' This function creates a modal based on a Google Presentation.
#' @param id This is the id of the modal that you are creating.
#' @param modalTitle This is the title of the modal that appears at the top of the modal.
#' @param prezSrc This is the URL of the published Google presentation that you want to appear in the modal.
#' @keywords modal, Google Sheets
#' @export
#' @examples
#' output$postmortemModal <- renderUI({
#' createPrezModal("sample","Sample Prezentation Modal",
#'                 "https://docs.google.com/presentation/d/14H24z59wQVTnAg9AKD_bIZ6F3DKnGIy9haBK557XMVo/embed?start=false&loop=false&delayms=3000")
#' })

createPrezModal <- function(id, modalTitle, prezSrc) {

  ns <- NS(id)

  tags$div(class="modal fade", id=ns("modal"), tabindex="-1", role="dialog", `aria-labelledby`=ns("modelLabel"),
           tagList(

             HTML('<div class="modal-dialog" role="document">
                  <div class="modal-content">
                  <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'),

             tags$h4(class = "modal-title", id=ns("modelLabel"),modalTitle),

             HTML('</div><div class="modal-body">'),

             tags$iframe(id=ns("googleform"),
                         src=prezSrc,
                         frameborder="0",
                         width="100%",
                         height="400px",
                         allowfullscreen="true",
                         mozallowfullscreen="true",
                         webkitallowfullscreen="true"),

             HTML('</div>
                  <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                  </div>
                  </div>')
             )
             )
}
