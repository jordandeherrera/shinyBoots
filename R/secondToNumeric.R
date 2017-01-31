#' Second to Numeric
#'
#' This function converts a list to numeric for use with highcharter drilldown charts.
#' @param ls List to convert to numeric.
#' @keywords highcharter, numeric
#' @export
#' @examples
#' for (i in 1:length(monthNames)){
#'   x <- lineData() %>%
#'     filter(MonthName == monthNames[i]) %>%
#'     group_by(AccountDescription) %>%
#'     summarise(value = round(sum(Actual) - sum(Budget),2)) %>%
#'     mutate(name = AccountDescription) %>%
#'     arrange(-value) %>%
#'     select(name, value) %>%
#'     list_parse2() %>%
#'     second_el_to_numeric()
#'
#'   assign(paste0("ds",tolower(monthNames[i])),x)
#'
#'   newList <- list(
#'     id = tolower(monthNames[i]),
#'     data = get(paste0("ds",tolower(monthNames[i]))),
#'     name = "Amount"
#'   )
#'
#'   assign(paste0("list",i),newList)
#' }

second_el_to_numeric <- function(ls){
  map(ls, function(x){
    x[[2]] <- as.numeric(x[[2]])
    x
  })
}
