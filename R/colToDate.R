#' Convert a Character Time Column into a Date and Strip Out Hour and Day
#'
#' This function converts a character column in a data frame to time and then strips out day and hour of the time as new columns.  The output is a new data frame with one modified column (character converted to date) and two new columns (day of week and hour of day).
#' @param dat This is the data source to be converted
#' @param dateColName This is the name of the date column to be converted
#' @param dateFormat This is the format of the date column
#' @keywords data manipulation, datetime conversion
#' @export
#' @examples
#' testDat <- data.frame(stringsAsFactors = FALSE, time = c("2016-10-31","2016-12-25","2016-07-04"),event = c("Halloween","Christmas","US Independence Day"))
#' testDat <- colToDate(testDat,"time","%Y-%m-%d")

colToDate <- function(dat,dateColName,dateFormat){
  require(dplyr)
  require(lubridate)
  require(lazyeval)

  dnames <- c("(1) Monday","(2) Tuesday","(3) Wednesday","(4) Thursday",
              "(5) Friday","(6) Saturday","(7) Sunday")
  dow <- 1:7

  mutate_call1 = lazyeval::interp(~ as.Date(a,format = b), a = as.name(dateColName), b = dateFormat)
  mutate_call2 = lazyeval::interp(~ hour(a), a = as.name(dateColName))
  mutate_call3 = lazyeval::interp(~ wday(a), a = as.name(dateColName))

  dat %>%
    mutate_(.dots = setNames(list(mutate_call1), dateColName)) %>%
    mutate_(.dots = setNames(list(mutate_call2), "hourOfDay")) %>%
    mutate_(.dots = setNames(list(mutate_call3), "dayOfWeek")) %>%
    mutate(dayOfWeek = ifelse(dayOfWeek == 0,7,dayOfWeek)) %>%
    mutate(dayOfWeek = dnames[match(dayOfWeek,dow)])
}
