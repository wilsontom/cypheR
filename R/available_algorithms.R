#' List available graph algorithms
#'
#' List the algorithms available for the graph database instance
#'
#' @param graph a `graph` object
#' @return a `tbl_df` of the Graph algorithms available
#' @export

available_algorithms <- function(graph)
{
  algo_query <- paste0('CALL algo.list()')
  apoc_query <- paste0('CALL apoc.help(', "'", 'apoc', "'", ')')


  algo_result <- neo4r::call_neo4j(algo_query, graph)
  apoc_result <- neo4r::call_neo4j(apoc_query, graph)


  algo_tibble <-
    tibble::tibble(
      name = algo_result$name,
      description = algo_result$description,
      signature = algo_result$signature,
      type = algo_result$type
    )

  apoc_tibble <-
    tibble::tibble(
      name = apoc_result$name,
      description = apoc_result$text,
      signature = apoc_result$signature,
      type = apoc_result$type
    )



  all_tibble <-  dplyr::bind_rows(algo_tibble, apoc_tibble)


  return(all_tibble)



}
