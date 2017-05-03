#' Box UI
#'
#' This function creates a box.
#' @param output UI code that belongs inside of box.
#' @param title Title of the box
#' @keywords box, UI
#' @export
#' @examples
#' boxUI(title = "Test Title", uiOutput("Some Output"))

boxUI <- function(title, output){
  tagList(
    box(
      span(h3(title, align="center"),style="color:#fba800"),
      width = 12,
      output
    )
  )
}
