#' Run Cypher Query
#'
#' @rdname run_query
#' @param graphdb a S4 graphdb object
#' @param cypher_query a cypher query in the form of a character stringr
#' @return a `httr2_response`
#'
#' @export


setMethod('run_query', signature = 'graphdb', function(graphdb, cypher_query)
{
  req <- httr2::request(glue::glue("http://{graphdb@host}/db/{graphdb@dbname}/query/v2")) %>%
    httr2::req_auth_basic(user = graphdb@user, password = graphdb@password) %>%
    httr2::req_headers("Accept" = graphdb@headers) %>%
    httr2::req_body_json(list("statement" = cypher_query))

  resp <- req %>% httr2::req_perform()

  return(resp)

})
