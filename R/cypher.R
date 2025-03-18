#' Default Cypher Queries
#'

#' @export
get_total_nodes <- function()
{
  return(paste0('MATCH (n) RETURN count (n)'))
}

#' @export
get_node_types <- function()
{
  return(paste0('MATCH (n) RETURN DISTINCT labels(n)'))
}

#' @export
get_nodes <- function(node_type)
{
  return(paste0('MATCH (n:', node_type, ') RETURN (n)'))
}

#' @export
get_total_relationships <- function()
{
  return(paste0('MATCH ()-->() RETURN count(*)'))
}

#' #' @export
#' get_relationship_types <- function()
#' {
#'   return(paste0('MATCH ()-->() RETURN count(*)'))
#' }

#' @export
get_relationship_labels <- function(rel)
{
  return(paste('MATCH ()-[r:', rel, ']-() RETURN keys(r)'))
}
