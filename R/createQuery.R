#' Create an Atlantis, Warehouse, or Hive QueryRunner function
#'
#' Query a variety of different databases
#' @param dataSourceName Name of data source:  warehouse, hive, atlantis
#' @keywords sql
#' @export
#' @examples
#' qf <- createQuery("warehouse")
#' qf("https://qb.uberinternal.com/querybuilder/builder/dFuvjmAdo5",city_id = c(40,40), vehicle_view = c(1427,2177,3213))

createQuery <- function(dataSourceName){
  require(ubeR)

  loadSecret()
  qf <- genQueryRunnerFunc(qr_datasource = dataSourceName)

  return(qf)
}
