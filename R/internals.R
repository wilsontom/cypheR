#' is.graph
#' @param x an object to test
#' @keywords internal

is.graph <- function(x)
{
  if (!isTRUE(inherits(x, 'graph'))) {
    stop(deparse(substitute(x)), ' is not a graph object', call. = FALSE)
  }
  return(invisible(NULL))
}


#' is.active
#' @keywords internal

is.active <- function()
{
  check_docker <-
    paste0('docker inspect -f ', "'", "{{.State.Running}}", "' ", "neo4j")
  if (system(check_docker, intern = FALSE) != 'true') {
    docker <- FALSE
  }

  check_service <- paste0('systemctl is-active neo4j.service')
  if (system(check_service, intern = FALSE) != 'active') {
    service <- FALSE
  }

  if (docker == FALSE & service == FALSE) {
    message('neo4j does not appear to be running as either a service or in a docker container')
  }

  return(invisible(NULL))
}
