#' Load Data from SQL Connection
#'
#' This function returns a data frame that is the output of a SQL Query.
#' @param sqlString This is the query that should be sent to the SQL database.
#' @keywords sql, RMySQL
#' @export
#' @examples
#'   dat <- loadData("SELECT * FROM t_customers")

loadData <- function(sqlString) {
  require(RMySQL)
  # Connect to the database
  db <- dbConnect(MySQL(), dbname = databaseName, host = options()$mysql$host, 
                  port = options()$mysql$port, user = options()$mysql$user, 
                  password = options()$mysql$password)
  # Construct the fetching query
  query <- sprintf(sqlString, table)
  # Submit the fetch query and disconnect
  data <- dbGetQuery(db, query)
  dbDisconnect(db)
  data
}
