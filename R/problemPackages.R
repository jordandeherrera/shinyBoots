#' Remove problematic functions
#'
#' This function removes and then loads known problematic packages from a shiny server instance.
#' @keywords package handling
#' @export
#' @examples
#' # input fields are treated as a group
#' problemPackages()

problemPackages <- function() {
  require(R.utils)

  if(isPackageLoaded("shiny")){
    detach("package:shiny", unload=T, force = T)
  } else
  { print("Shiny not loaded")}

  if(isPackageLoaded("htmltools")){
    detach("package:htmltools", unload=T, force = T)
  } else
  { print("HtmlTools not loaded")}

  if(isPackageLoaded("htmlwidgets")){
    detach("package:htmlwidgets", unload=T, force = T)
  } else
  { print("HtmlWidgets not loaded")}

  if(isPackageLoaded("httpuv")){
    detach("package:httpuv", unload=T, force = T)
  } else
  { print("Httpuv not loaded")}

  if(isPackageLoaded("Rcpp")){
    detach("package:Rcpp", unload=T, force = T)
  } else
  { print("Rcpp not loaded")}

  unloadNamespace("htmltools")
  unloadNamespace("httpuv")
  library("Rcpp", lib = "/mnt/apps/shiny/apps/geoMsg")
  library("htmltools", lib = "/mnt/apps/shiny/apps/geoMsg")
  library("htmlwidgets", lib = "/mnt/apps/shiny/apps/geoMsg")
  library("httpuv", lib = "/mnt/apps/shiny/apps/geoMsg")
  library("shiny", lib = "/mnt/apps/shiny/apps/geoMsg")
}
