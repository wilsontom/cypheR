#' graphdb
#'
#' S4 class to store neo4j database connection details
#'
#' @slot host a character string for the database host address (IP:PORT)
#' @slot user a character string for the database username
#' @slot password a character string for the user password
#' @slot dbname a character string for the database name
#' @slot headers a character string for request headers


setClass(
  Class = 'graphdb',
  representation = representation (
    host = 'character',
    user = 'character',
    password = 'character',
    dbname = 'character',
    headers = 'character'
  ),
  prototype =  list(
    host = Sys.getenv('neo4j_host'),
    user = Sys.getenv('neo4j_user'),
    password = Sys.getenv('neo4j_password'),
    headers = 'application/json'
  )
)
