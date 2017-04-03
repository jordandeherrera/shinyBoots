#' Convert a Data Frame to a Drilldown Series for Use in Highcharter
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
#' ds <- summarizeDrilldownSeries(df,idColumnNameAsText)
#' datSeries <- changeToDrilldownSeries(df,idColumnNameAsText)
#' hc <- createDrilldown(df,idColumnNameAsText,"Drilldown Test","Some additional text here for subtitle")

changeToDrilldownSeries <- function(df,idColumnNameAsText){
  require(dplyr)
  require(highcharter)
  
  second_el_to_numeric <- function(ls){
    
    map(ls, function(x){
      x[[2]] <- as.numeric(x[[2]])
      x
    })
    
  }

  dat <- df %>%
    group_by_(id = idColumnNameAsText) %>%
    do(data=second_el_to_numeric(list_parse2(data.frame(name = .$name,value = .$value,stringsAsFactors = FALSE))))

  series <- list_parse(dat)
  return(series)
}
