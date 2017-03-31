#' Prepare a Data Frame to Be Converted to a Series for Use in Highcharter
#'
#' This function converts a data frame to a summary data frame that can be converted to a series for use in highcharter.  The difference between this funciton and prepSeries is that this function uses sum as an aggregation rather than mean.
#' @param df This is the data source to be converted
#' @param x1 This is the first column to be grouped by
#' @param x2 This is the second column to be grouped by
#' @param y This is the column to summarise by taking the mean
#' @keywords data manipulation
#' @export
#' @examples
#' library(dplyr)
#' dat2 <- prepSeries(mtcars,"cyl","am","mpg") %>% mutate(am = ifelse(am == 1,"Automatic","Manual"))
#' datSeries <- changeToSeries(dat2,"am")
#' createColumn(datSeries,unique(dat2$cyl),"Fuel Efficiency","Miles per Gallon by Transmission and Cylinders")

prepSeries <- function(df,x1,x2,y){
  require(dplyr)
  require(lazyeval)

  dat <- df %>%
    group_by_(x1,x2) %>%
    summarise_(Value = interp(~sum(var, na.rm = TRUE), var = as.name(y))) %>%
    as.data.frame()

  return(dat)
}
