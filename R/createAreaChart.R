#' Create an Area Chart in Highcharter
#'
#' This function creates an area chart in highcharter
#' @param dat This is the data source to be graphed
#' @param title This is the title of the chart
#' @param qbSource This is the source html link
#' @param nameLabel This is the name of the column that contains the "names" of the data series
#' @param valueLabel This is the name of the column that contains the "data" of the data series
#' @param categoryLabel This is the name of the column that contains the "categories" or x axis of the data series
#' @keywords data manipulation, datetime conversion
#' @export
#' @examples
#' createAreaChart("Iris Data Set Area Chart Example","https://en.wikipedia.org/wiki/Iris_flower_data_set",iris,"Species","Sepal.Length","Petal.Length")

createAreaChart <- function(title,qbSource,dat,nameLabel,valueLabel,categoryLabel){
  require(highcharter)
  require(dplyr)

  datSeries <- changeToSeries(dat,nameLabel,valueLabel)

  categoryList <- dat %>% collect %>% .[[categoryLabel]] %>% unique()

  highchart() %>%
    hc_chart(type = "area") %>%
    hc_title(text = title) %>%
    hc_subtitle(text = paste0("Source: ",qbSource)) %>%
    hc_xAxis(categories = categoryList,
             tickmarkPlacement = "on",
             title = list(enabled = FALSE)) %>%
    hc_yAxis(title = list(text = "Percent")) %>%
    hc_tooltip(pointFormat = "<span style=\"color:{series.color}\">{series.name}</span>:
               <b>{point.percentage:.1f}%</b> ({point.y:,.2f})<br/>",
               shared = TRUE) %>%
    hc_plotOptions(area = list(
      stacking = "normal", # or "percent"
      lineColor = "#ffffff",
      lineWidth = 1,
      marker = list(
        lineWidth = 1,
        lineColor = "#ffffff"
      ),
      dataLabels = list(enabled = TRUE, format = "<b>{point.percentage:.1f}%</b> ({point.y:,.2f})<br/>")
    )) %>%
    hc_add_series_list(datSeries)
}
