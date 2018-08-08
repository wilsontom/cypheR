#' get_total relatioships
#'
#' @param graph a `graph` object
#' @return a numeric value for the total number of relationships (edges) in the graph
#' @export

get_total_relationships <- function(graph)
{
  query <- paste0('MATCH ()-->() RETURN count(*)')
  return(as.numeric(RNeo4j::cypher(graph, query)[[1]]))
}

#' get_relationship_types
#'
#' @param graph a `graph` object
#' @return a character vector of relationship types
#' @export

get_relationship_types <- function(graph)
{
  query <- paste0('MATCH ()-[r]-() RETURN DISTINCT type(r)')
  return(RNeo4j::cypher(graph, query)[[1]])

}

#' get_relationship_labels
#' @param graph a `graph` object
#' @param rel a character indicating the type of relationship to query
#' @return a character vector of relationship labels
#' @export

get_relationship_labels <- function(graph, rel)
{
  query <- paste('MATCH ()-[r:',rel,']-() RETURN keys(r)')
  return(RNeo4j::cypher(graph, query) %>% unlist() %>% unique())
}


