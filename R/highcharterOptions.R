#' Highcharter Options
#'
#' Sets highcharter options
#' @keywords highcharter, options
#' @export
#' @examples
#' highcharterOptions()

highcharterOptions <- function() {
  hcoptslang <- getOption("highcharter.lang")
  hcoptslang$thousandsSep <- ","
  options(highcharter.lang = hcoptslang)
}
