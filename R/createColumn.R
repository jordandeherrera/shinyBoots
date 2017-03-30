#' Create a Column Chart Using Highcharter
#'
#' This function creates a column chart using highcharter.
#' @param seriesName This is the series that will be the data basis of the graph.
#' @param categories These are the names for each category.
#' @param title This is the title of the chart
#' @param subTitle This is the subtitle of the chart
#' @keywords highcharter, column chart
#' @export
#' @examples
#' library(dplyr)
#' dat2 <- prepSeries(mtcars,"cyl","am","mpg") %>% mutate(am = ifelse(am == 1,"Automatic","Manual"))
#' datSeries <- changeToSeries(dat2,"am")
#' createColumn(datSeries,unique(dat2$cyl),"Fuel Efficiency","Miles per Gallon by Transmission and Cylinders")

createColumn <- function(seriesName,categories,title,subTitle){
  require(highcharter)

  hc <- highchart() %>%
    hc_chart(type = "column") %>%
    hc_title(text = title) %>%
    hc_subtitle(text = subTitle) %>%
    hc_xAxis(categories = categories) %>%
    hc_legend(enabled = TRUE) %>%
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
    hc_add_series_list(
      seriesName
    )
  return(hc)
}
