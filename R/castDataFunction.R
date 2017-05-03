#' Cast Data Function (CRUD)
#'
#' This function casts data as part of a CRUD series of functions.
#' @param data Data to be cast.
#' @keywords CRUD, cast
#' @export
#' @examples
#' CreateDefaultRecord <- function() {
#' mydefault <- CastData(list(id = "0",
#'                            propertyForm = "",
#'                            yearForm = strftime(Sys.Date(), "%Y"),
#'                            monthForm = strftime(Sys.Date(), "%B"),
#'                            categoryForm = "",
#'                            notes = "",
#'                            requesterName = userInfo()$Name))
#' return (mydefault)
#' }

CastData <- function(data) {
  datar <- data.frame(
    requesterName = data["requesterName"],
    propertyForm = data["propertyForm"],
    yearForm = data["yearForm"],
    monthForm = data["monthForm"],
    categoryForm = data["categoryForm"],
    notes = data["notes"],
    stringsAsFactors = FALSE)

  rownames(datar) <- data["id"]
  return (datar)
}
