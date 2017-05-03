#' Launch a Modal on Shiny Page Load Function
#'
#' This function loads a modal after a page is loaded in Shiny.
#' @param modalTag This is the id of the modal that you want launched on page load.
#' @keywords modal
#' @export
#' @examples
#' createLoadModalScript("testModalName")

createLoadModalScript <- function(modalTag){
  modalID <- paste0("#",modalTag,"-modal")
  script <- paste0("$(window).load(function(){$('",modalID,"').modal('show');});")
  
  tags$head(tags$script(type="text/javascript", script))
}
