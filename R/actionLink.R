#' Action Link
#'
#' This function creates a link that acts as an action button (useful for creating an action button in a dropdown list)
#' @param inputId This is the id of the link that you are creating.
#' @param label This is the label of the link that is visible to the user.
#' @param icon This is optional and adds an icon to the link.
#' @keywords modal, actionButton, link, dropdown menu
#' @export
#' @examples
#'   actionLink("sample-id","ID Form", icon("id-card-o"))

actionLink <- function (inputId, label, icon = NULL, ...) {
  value <- restoreInput(id = inputId, default = NULL)
  tags$li(
    tags$a(id = inputId, href = "#", class = "action-button",
           `data-val` = value, list(icon, label),
           ...)
  )
}
