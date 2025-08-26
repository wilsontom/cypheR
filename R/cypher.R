#' Default Cypher Queries


#' Get Total Nodes
#' @export
get_total_nodes <- function()
{
  return(paste0('MATCH (n) RETURN count (n)'))
}

#' Get Node Types
#' @export
get_node_types <- function()
{
  return(paste0('MATCH (n) RETURN DISTINCT labels(n)'))
}


#' Get Nodes by Type
#' @param node_type a character string of the node type description
#' @export
get_nodes <- function(node_type)
{
  return(paste0('MATCH (n:', node_type, ') RETURN (n)'))
}

#' Get Total Number of Relationship
#' @export
get_total_relationships <- function()
{
  return(paste0('MATCH ()-->() RETURN count(*)'))
}

#' Get Relationship Types
#' #' @export
get_relationship_types <- function()
{
  return(paste0('MATCH ()-->() RETURN count(*)'))
}

#' Get Relationship Labels
#' @param rel a character string of the relationship to query
#' @export
get_relationship_labels <- function(rel)
{
  return(paste('MATCH ()-[r:', rel, ']-() RETURN keys(r)'))
}

#' Delete Nodes
#' @param node_type a character string of the node type description
#' @export
delete_nodes <- function(node_type)
{
  return(paste0('MATCH (n:', node_type, ') DELETE (n)'))
}



