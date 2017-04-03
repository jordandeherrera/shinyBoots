#' Create a Drilldown Chart Using Highcharter
#'
#' This function creates a column chart using highcharter.
#' @param df This is the data frame that provides data for the graph.
#' @param idColumnNameAsText This is the name of the column that should be the "id" part of the series
#' @param title This is the title of the chart
#' @param subTitle This is the subtitle of the chart
#' @keywords highcharter, drilldown chart
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

createDrilldown <- function(df,idColumnNameAsText,title,subTitle){
  require(highcharter)

  ds <- summarizeDrilldownSeries(df,idColumnNameAsText)
  
  datSeries <- changeToDrilldownSeries(df,idColumnNameAsText)
  
  hc <- highchart() %>%
    hc_chart(type = "column") %>%
    hc_title(text = title) %>%
    hc_subtitle(text = subTitle) %>%
    hc_xAxis(type = "category") %>%
    hc_legend(enabled = FALSE) %>%
    hc_plotOptions(
      series = list(
        boderWidth = 0,
        dataLabels = list(enabled = TRUE,
                          format = '{point.y:,.2f}')
      ),
      stacking = "normal"
    ) %>%
    hc_tooltip(crosshairs = TRUE,
               borderWidth = 2,
               pointFormat = '{point.y:,.0f}') %>%
    hc_add_series(
      name = "Things",
      colorByPoint = TRUE,
      data = ds
    ) %>% 
    hc_drilldown(
      allowPointDrilldown = TRUE,
      series = datSeries
    )
  
  return(hc)
}
