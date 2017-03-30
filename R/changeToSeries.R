#' Convert a Data Frame to a Series for Use in Highcharter
#'
#' This function converts a data frame to a series for use in highcharter
#' @param df This is the data source to be converted
#' @param keyColumnNameAsText This is the name of the column that should be the "name" part of the series
#' @keywords data manipulation
#' @export
#' @examples
#' library(dplyr)
#' dat2 <- prepSeries(mtcars,"cyl","am","mpg") %>% mutate(am = ifelse(am == 1,"Automatic","Manual"))
#' datSeries <- changeToSeries(dat2,"am")
#' createColumn(datSeries,unique(dat2$cyl),"Fuel Efficiency","Miles per Gallon by Transmission and Cylinders")

changeToSeries <- function(df,keyColumnNameAsText){
  require(tidyr)
  require(dplyr)
  require(highcharter)

  dat <- df %>%
    group_by_(name = keyColumnNameAsText) %>%
    do(data=.$Value)

  series <- list_parse(dat)
  return(series)
}
