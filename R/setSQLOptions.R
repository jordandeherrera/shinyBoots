#' Set SQL Options
#'
#' This function sets SQL default options for making database connections
#' @param host Host location (often times localhost)
#' @param port Port where the mysql server is open
#' @param user MySQL username
#' @param password Password used for login for MySQL server
#' @param dbNameStr Database name to use for connections
#' @keywords sql, RMySQL, mysql
#' @export
#' @examples
#'   setSQLOptions("localhost",3306,"user","password")

setSQLOptions <- function(localhoststr, portno, userstr, passwdstr, dbNameStr){
  options(mysql = list(
  "host" = localhoststr,
  "port" = portno,
  "user" = userstr,
  "password" = passwdstr
  ))
  
  databaseName <- dbNameStr
}
