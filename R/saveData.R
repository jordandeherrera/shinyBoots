#' Append Data from Data Frame to MySQL Table
#'
#' This function appends data from a data frame to a table in a MySQL database.
#' @param data This is the data frame which has the data to be appended.
#' @param table This is the name of the table in MySQL to which you are appending data.
#' @keywords sql, RMySQL
#' @export
#' @examples
#'   dat <- formData()
#'   saveData(dat,"t_customers")

saveData <- function(data, table) {
  require(RMySQL)
  # Connect to the database
  db <- dbConnect(MySQL(), dbname = options()$mysql$database, host = options()$mysql$host, 
                  port = options()$mysql$port, user = options()$mysql$user, 
                  password = options()$mysql$password)
  # Submit the update query and disconnect
  dbWriteTable(db, table, data, append = F, overwrite = T, row.names = F)
  dbDisconnect(db)
}
