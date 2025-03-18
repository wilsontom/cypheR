#' Parse Query Response
#'
#' @rdname parse_query
#' @param response a `httr2_response` class
#' @return a `tbl_df`
#'
#' @export


parse_query <- function(response)
{
  response_data <- response %>% httr2::resp_body_json(.)

  response_out <- purrr::map(response_data$data$values, data.frame) %>% dplyr::bind_rows()

  return(response_out)
}
