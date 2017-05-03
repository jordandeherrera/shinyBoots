#' Load Packages
#'
#' This function loads a list of packages from a specified location.
#' @param pkgList Package list to load
#' @param lib_path Library path from which to load packages
#' @keywords package handling
#' @export
#' @examples
#' other.pkgs1 <- c("shiny","tidyr","dplyr","shinydashboard.uber","highcharter",
#'                  "ggplot2","purrr","scales","tidytext","stringr")
#' loadPkgs(other.pkgs1, lib_path)
#' print("All other packages loaded")

loadPkgs <- function(pkgList, libPath){
  libraryFn <- function(p){
    library(p, lib.loc = libPath, character.only = TRUE)
  }
  lapply(pkgList, function(p) {libraryFn(p)})
}
