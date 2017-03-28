#' Filter Data Using Lazy Evaluation
#'
#' This function filters a data frame using lazy evaluation.
#' @param data This is the data source to be filtered
#' @param filterCat1 This is the column name which should be filtered
#' @param value1 This is the value or value list to filter (evaluate to true)
#' @keywords data manipulation
#' @export
#' @examples
#' dat <- filterData(mtcars,"am",c(1,0))
#' })

filterData <- function(data,filterCat1,value1){
  require(dplyr)
  require(lazyeval)

  filter_criteria1 <- interp(~y %in% x, .values=list(y = as.name(filterCat1), x = value1))

  dat <- data %>%
    filter_(filter_criteria1)

  return(dat)
}
