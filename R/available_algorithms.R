#' List available graph algorithms
#'
#' List the algorithms available for the graph database instance from either the `aglo` or `apoc` plugin
#'
#' @param graph a `graph` object
#' @return a `tibble` of the Graph algorithms available
#' @export

available_algorithms <- function(graph, plugin)
{
  if (plugin == 'algo') {
    query <- paste0('CALL algo.list()')
  }

  if (plugin == 'apoc') {
    query <- paste0('CALL apoc.help(', "'", 'apoc', "'", ')')

  }


  result <- neo4r::call_neo4j(query, graph)

  if (plugin == 'algo') {
    algo_tibble <-
      tibble::tibble(
        name = result$name,
        description = result$description,
        signature = result$signature,
        type = result$type
      )

    return(algo_tibble)
  }

  if (plugin == 'apoc') {
    apoc_tibble <-
      tibble::tibble(
        name = result$name,
        description = result$text,
        signature = result$signature,
        type = result$type
      )


    return(apoc_tibble)

  }

}
