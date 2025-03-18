#' Create Graph Object
#'
#'
#' @param db a character string for the database name
#' @param host a character string for the database host address. Default is `NULL`. If `neo4j_host` environment variable is set, this value willn be used.
#' @param user a character string for the database username Default is `NULL`. If `neo4j_user` environment variable is set, this value willn be used.
#' @param password a character string for the user password Default is `NULL`. If `neo4j_password` environment variable is set, this value willn be used.
#' @return a S4 `graphdb` object
#'
#' @export

graph_connect <- function(db,
                          user = NULL,
                          password = NULL,
                          host = NULL)
{
  graph_object <- methods::new('graphdb')

  graph_object@dbname <- db

  if (length(graph_object@host) == 0) {
    graph_object@host <- host
  }

  if (length(graph_object@user) == 0) {
    graph_object@user <- user
  }


  if (length(graph_object@password) == 0) {
    graph_object@password <- password
  }


  return(graph_object)

}
