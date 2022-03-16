#' get_total relatioships
#'
#' @param graph a `graph` object
#' @return a numeric value for the total number of relationships (edges) in the graph
#' @export
#' @importFrom magrittr %>%

get_total_relationships <- function(graph)
{
  query <- paste0('MATCH ()-->() RETURN count(*)')
  result <- neo4r::call_neo4j(query, graph)[[1]]
  return(as.numeric(result))
}

#' get_relationship_types
#'
#' @param graph a `graph` object
#' @return a character vector of relationship types
#' @export

get_relationship_types <- function(graph)
{
  query <- paste0('MATCH ()-[r]-() RETURN DISTINCT type(r)')
  result <- neo4r::call_neo4j(query, graph)[[1]]$value
  return(result)
}

#' get_relationship_labels
#' @param graph a `graph` object
#' @param rel a character indicating the type of relationship to query
#' @return a character vector of relationship labels
#' @export

get_relationship_labels <- function(graph, rel)
{
  query <- paste('MATCH ()-[r:', rel, ']-() RETURN keys(r)')
  result <- neo4r::call_neo4j(query, graph)[[1]] %>% unique()
  if (nrow(result) == 0) {
    message(paste0('No labels for relationship: ', deparse(substitute(rel))))
    return(invisible(NULL))
  }
  names(result) <- 'label'
  return(result)
}


