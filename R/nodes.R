#' get_total_nodes
#'
#' @param graph a `graph` object
#' @return a numeric value for the total number of nodes in the graph
#' @export

get_total_nodes <- function(graph)
{
  query <- paste0('MATCH (n) RETURN count (n)')
  result <- neo4r::call_neo4j(query, graph)[[1]]
  return(as.numeric(result$value))
}

#' get_node_types
#'
#' @param graph a `graph` object
#' @return a character vector of node types
#' @export

get_node_types <- function(graph)
{
  query <- paste0('MATCH (n) RETURN DISTINCT labels(n)')
  result <- neo4r::call_neo4j(query, graph)[[1]]
  names(result) <- 'NodeType'
  return(result)
}


#' get_nodes
#' @param graph a `graph` object
#' @param node_type a character indicating the type of node to return
#' @return a `tibble` of nodes and their properties
#' @export

get_nodes <- function(graph, node_type)
{
  available_node_types <- get_node_types(graph = graph)$NodeType

  if (!node_type %in% available_node_types) {
    stop(deparse(substitute(node_type)), ' is not valid node type', call. = FALSE)
  } else{
    query <- paste0('MATCH (n:', node_type, ') RETURN (n)')
    result <- neo4r::call_neo4j(query, graph)[[1]]
  }
  return(result)
}
