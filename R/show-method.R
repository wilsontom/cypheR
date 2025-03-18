#' show-graphdb
#' @rdname show
#' @param object a `graphdb` object
#' @return NULL
#' @importFrom methods show function
#' @export


setMethod('show', signature = 'graphdb', function(object) {
  cat(cli::rule(
    left = crayon::bold('graphdb'),
    right = paste0('cypheR v', utils::packageVersion('cypheR'))
  ), '\n')

  cat('\t', cli::cat_bullet(paste0('Database Host:', object@host)), '\n')
  cat('\t', cli::cat_bullet(paste0('User Name: ', object@user)), '\n')
  cat('\t', cli::cat_bullet(paste0('Database Name: ', object@dbname)), '\n')
})
