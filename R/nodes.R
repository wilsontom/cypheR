#' get_total_nodes
#'
#' @param graph a `graph` object
#' @return a numeric value for the total number of nodes in the graph
#' @export

get_total_nodes <- function(graph)
{
  query <- paste0('MATCH (n) RETURN count (n)')
  return(as.numeric(RNeo4j::cypher(graph, query)[[1]]))
}

#' get_node_types
#'
#' @param graph a `graph` object
#' @return a character vector of node types
#' @export

get_node_types <- function(graph)
{
  query <- paste0('MATCH (n) RETURN DISTINCT labels(n)')
  return(RNeo4j::cypher(graph, query)[[1]])
}

#' get_node_labels
#' @param graph a `graph` object
#' @param node_type a character indicating the type of node to query
#' @return a character vector of node labels
#' @importFrom magritte %>%
#' @export

get_node_labels <- function(graph, node_type)
{
  available_node_types <- get_node_types(graph = graph)

  if (!node_type %in% available_node_types) {
    stop(deparse(substitute(node_type)), ' is not valid node type', call. = FALSE)
  } else{
    query <- paste0('MATCH (n:', node_type, ') RETURN keys(n)')
    return(RNeo4j::cypher(graph, query) %>% unlist() %>% unique())
  }
}

#' delete_nodes
#'
#' @param graph a `graph` object
#' @param node_type a character indicating the type of node to delete
#' @export


delete_nodes <- function(graph, node_type)
{
  available_node_types <- get_node_types(graph = graph)

  if (!node_type %in% available_node_types) {
    stop(deparse(substitute(node_type)), ' is not valid node type', call. = FALSE)
  } else{
    nnodes_a <- get_total_nodes(graph = graph)

    query <- paste0('MATCH (n:', node_type, ') DELETE (n)')
    RNeo4j::cypher(graph, query)
    nnodes_b <- get_total_nodes(graph = graph)
    message(paste0(nnodes_a - nnodes_b, ' nodes deleted'))
    return(invisible(NULL))
  }
}
