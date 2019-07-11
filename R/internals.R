#' is.graph
#' @param x an object to test
#' @keywords internal

is.graph <- function(x)
{
  if (!isTRUE(inherits(x, 'Neo4JAPI'))) {
    stop(deparse(substitute(x)), ' is not a neo4r graph object', call. = FALSE)
  }
  return(invisible(NULL))
}


