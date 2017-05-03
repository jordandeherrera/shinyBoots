#' Value Box Group
#'
#' This function creates a value box group.
#' @param ... Content of Value Box Group
#' @param title Title of the box
#' @param width Width of value box group
#' @keywords box, UI, group
#' @export
#' @examples
#' valueBoxGroup(boxUI(title = "Test Title", uiOutput("Some Output")))

valueBoxGroup <- function(..., title = "", width = 6){
  column(width = width, fluidRow(column(width = 12, h3(class = "box-heading",
                                                       title))), fluidRow(...))
}
