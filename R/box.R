#' Box
#'
#' This function creates a box which is collapsible.
#' @param ... UI code that belongs inside of box.
#' @param title Title of the box
#' @param footer Text that should appear in the footer if desired
#' @param status Status of the box (warning, normal, etc.)
#' @param collapsible Whether the box is collapsible or not
#' @param collapsed Whether the box is collapsed on page load by default
#' @keywords box, UI
#' @export
#' @examples
#' box(title = "Test Title", collapsible = T, uiOutput("Some Output"))

box <- function(..., title = NULL, footer = NULL, status = NULL, solidHeader = FALSE,
                background = NULL, width = 12, height = NULL, collapsible = TRUE,
                collapsed = FALSE){
  boxClass <- "box"
  if (solidHeader || !is.null(background)) {
    boxClass <- paste(boxClass, "box-solid")
  }
  if (!is.null(status)) {
    validateStatus(status)
    boxClass <- paste0(boxClass, " box-", status)
  }
  if (collapsible && collapsed) {
    boxClass <- paste(boxClass, "collapsed-box")
  }
  if (!is.null(background)) {
    validateColor(background)
    boxClass <- paste0(boxClass, " bg-", background)
  }
  style <- NULL
  if (!is.null(height)) {
    style <- paste0("height: ", validateCssUnit(height))
  }
  titleTag <- NULL
  if (!is.null(title)) {
    titleTag <- h3(class = "box-title", title)
  }
  collapseTag <- NULL
  if (collapsible) {
    buttonStatus <- ifelse(exists(status),status,"default")
    collapseIcon <- if (collapsed)
      "plus"
    else "minus"
    collapseTag <- div(class = "box-tools pull-right", tags$button(class = paste0("btn btn-box-tool"),
                                                                   `data-widget` = "collapse", shiny::icon(collapseIcon)))
  }
  headerTag <- NULL
  if (!is.null(titleTag) || !is.null(collapseTag)) {
    headerTag <- div(class = "box-header", titleTag, collapseTag)
  }
  div(class = if (!is.null(width))
    paste0("col-sm-", width), div(class = boxClass, style = if (!is.null(style))
      style, headerTag, div(class = "box-body", ...), if (!is.null(footer))
        div(class = "box-footer", footer)))
}
