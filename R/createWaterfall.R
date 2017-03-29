#' Create a Waterfall Chart Using Highcharter
#'
#' This function creates a waterfall chart using highcharter.  It automatically converts entered values into percentages (percentages are calculated relative to the first value entered).  It also automatically converts entered values into a series for plotting and also automatically chooses the color for a given category based on the category's value (positive or negative).
#' @param dfNames These are the names of the categories
#' @param dfValues These are the values for each category.  Intermediate and sum categories should be left as NA.
#' @param isIntermediateSum This is a boolean list of whether the names and values represent an intermediate sum in the waterfall chart.
#' @param isSum This is a boolean list of whether the names and values represent a sum in the waterfall chart.
#' @param title This is the title of the chart
#' @param subTitle This is the subtitle of the chart
#' @param xTitle This is the title of the x axis.
#' @param yTitle This is the title of the y axis.
#' @keywords highcharter, waterfall
#' @export
#' @examples
#' dfNames <- c("Trips where passengers paid a surcharge",
#' "Double counted trips (pickup AND dropoff in special venue)",
#' "Trips where Uber paid a surcharge and didn't charge the rider",
#' "Trips where the dropoff did not occur in the current month",
#' "'Line' trips","Trips where Uber paid a $5 fee to the city")
#' dfValues <- c(416468,2338,140,72,-1773,NA)
#' isIntermediateSum = c(0,0,0,0,0,0)
#' isSum = c(0,0,0,0,0,1)
#' output$heatmap <- highcharter::renderHighchart({
#' createWaterfall(dfNames, dfValues, isSum, isIntermediateSum,"Line Trip Reconciliation",
#' "Cumulative Effect of Adjustments","Adjustment Type","Percent Effect")
#' })

createWaterfall <- function(dfNames,dfValues,isSum,isIntermediateSum,title,subTitle,xTitle,yTitle){
  # Load required libraries
  require(highcharter)
  require(dplyr)

  dfValues <- dfValues/dfValues[1]*100

  df <- data.frame(name = dfNames,y = dfValues,stringsAsFactors = FALSE,
                   isSum = as.logical(isSum),
                   isIntermediateSum = as.logical(isIntermediateSum))

  df <- df %>%
    mutate(color = ifelse(y>=0,"green",ifelse(y<0,"red",NA)))

  maxY = sum(na.omit(dfValues[dfValues > 0])) + 1
  minY = sum(na.omit(dfValues[dfValues < 0])) +100 - 1

  datSeries <- list_parse(df)

  highchart() %>%
    hc_chart(type = "waterfall") %>%
    hc_title(text = title) %>%
    hc_subtitle(text = subTitle) %>%
    hc_xAxis(categories = df$name,
             title=list(text=xTitle)) %>%
    hc_yAxis(title=list(text=yTitle), max = maxY, min = minY) %>%
    hc_legend(enabled=FALSE) %>%
    hc_tooltip(pointFormat="<b>{point.y:,.2f}%") %>%
    hc_series(list(color="grey",
                   data=datSeries,
                   dataLabels=list(
                     enabled=TRUE,
                     format = '{point.y:,.2f}%',
                     style=list(
                       color="#FFFFFF",
                       fontWeight="bold",
                       textShadow="0px 0px 3px black"
                     )
                   ),
                   pointPadding=0
    ))
}
