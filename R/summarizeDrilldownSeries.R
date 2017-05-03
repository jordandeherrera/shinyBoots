#' Summarizes Data for a Drilldown Series for Use in Highcharter
#'
#' This function converts a data frame to a series for use in highcharter
#' @param df This is the data source to be converted
#' @param idColumnNameAsText This is the name of the column that should be the "id" part of the series
#' @keywords data manipulation
#' @export
#' @examples
#' df <- data.frame(
#' name = c("Toyota", "Ford", "Volkswagen", "Cats", "Dogs", "Cows", "Sheep", "Pigs", "Apple", "Oranges"),
#' value = c(4, 2, 2, 4, 3, 1, 2, 1, 4, 2),
#' id = c(rep("cars",3), rep("animals",5), rep("fruits",2)),
#' stringsAsFactors = FALSE
#' )
#' ds <- summarizeDrilldownSeries(df,"id")
#' datSeries <- changeToDrilldownSeries(df,"id")
#' hc <- createDrilldown(df,"id","Things","Drilldown Test","Some additional text here for subtitle")

summarizeDrilldownSeries <- function(df,idColumnNameAsText){
  require(dplyr)
  require(highcharter)
  
  dat <- df %>% 
    count_(idColumnNameAsText) %>% 
    rename_(id = idColumnNameAsText) %>%
    mutate(drilldown = tolower(id)) %>%
    rename(name = id, y = n) %>%
    list_parse()

  return(dat)
}
