#' Convert Dataframe from Wide to Long
#'
#' This function converts a data frame from wide format to long.
#' @param data This is the data source to be converted
#' @param colSelections These are the columns (references by column number) that contain the values
#' @keywords data manipulation
#' @export
#' @examples
#' library(dplyr)
#' mtcars2 <- mtcars %>% mutate(Car = row.names(mtcars)) %>% select(Car,mpg,cyl,disp)
#' dat <- wideToLong(mtcars2,c(2:4))
#' })

wideToLong <- function(data,colSelections){
  require(tidyr)

  dat <- gather(data, Category, Value, colSelections)

  return(dat)
}
