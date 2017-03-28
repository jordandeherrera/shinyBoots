#' Convert a Data Frame to a Series for Use in Highcharter
#'
#' This function converts a data frame to a series for use in highcharter
#' @param df This is the data source to be converted
#' @keywords data manipulation
#' @export
#' @examples
#' dataSeries <- changeToSeries(sampleDF,keyColumn)

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
