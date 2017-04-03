R Markdown
----------

The shinyBoots package contains functions that fall into the following general categories:

-   Functions to create boostrap elements

-   Functions to create a reactive app with CRUD functions (create, retrieve, update, and delete)

-   Functions to create charts and visualizations

-   Functions to handle CSV files in a Shiny app

-   Functions to manipulate data.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

Sample Drilldown Chart
----------------------

``` r
df <- data.frame(
 name = c("Toyota", "Ford", "Volkswagen", "Cats", "Dogs", "Cows", "Sheep", "Pigs", "Apple", "Oranges"),
 value = c(4, 2, 2, 4, 3, 1, 2, 1, 4, 2),
 id = c(rep("cars",3), rep("animals",5), rep("fruits",2)),
 stringsAsFactors = FALSE
 )
createDrilldown(df,"id","Drilldown Test","Some additional text here for subtitle")
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-e7ac86f0cd83f1fde922">{"x":{"hc_opts":{"title":{"text":"Drilldown Test"},"yAxis":{"title":{"text":null}},"credits":{"enabled":false},"exporting":{"enabled":false},"plotOptions":{"series":{"turboThreshold":0,"boderWidth":0,"dataLabels":{"enabled":true,"format":"{point.y:,.2f}"}},"treemap":{"layoutAlgorithm":"squarified"},"stacking":"normal"},"chart":{"type":"column"},"subtitle":{"text":"Some additional text here for subtitle"},"xAxis":{"type":"category"},"legend":{"enabled":false},"tooltip":{"crosshairs":true,"borderWidth":2,"pointFormat":"{point.y:,.0f}"},"series":[{"name":"Things","colorByPoint":true,"data":[{"name":"animals","y":5,"drilldown":"animals"},{"name":"cars","y":3,"drilldown":"cars"},{"name":"fruits","y":2,"drilldown":"fruits"}]}],"drilldown":{"allowPointDrilldown":true,"series":[{"id":"animals","data":[["Cats",4],["Dogs",3],["Cows",1],["Sheep",2],["Pigs",1]]},{"id":"cars","data":[["Toyota",4],["Ford",2],["Volkswagen",2]]},{"id":"fruits","data":[["Apple",4],["Oranges",2]]}]}},"theme":{"chart":{"backgroundColor":"transparent"}},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","drillUpText":"Back to {series.name}","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"thousandsSep":" ","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"chart","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
Including Plots
---------------

You can also embed plots, for example:

![](README_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
