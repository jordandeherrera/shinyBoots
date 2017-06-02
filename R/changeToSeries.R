#' Convert a Data Frame to a Series for Use in Highcharter
#'
#' This function converts a data frame to a series for use in highcharter
#' @param dat This is the data source to be converted
#' @param nameLabel This is the name of the column that should be the "name" part of the series
#' @param valueLabel This is the name of the column that contains the values that will be the "data" in the series
#' @keywords data manipulation, highcharter, series
#' @export
#' @examples
#' library(dplyr)
#' mtcars <- mtcars %>% mutate(vehicle_name = row.names(.))
#' datSeries <- changeToSeries(mtcars,"vehicle_name","mpg")

changeToSeries <- function(dat,nameLabel,valueLabel){
  require(highcharter)
  require(dplyr)

  dat <- dat %>%
    group_by_(name = nameLabel) %>%
    do(data = .[[valueLabel]])

  series <- list_parse(dat)
  return(series)
}
