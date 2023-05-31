#' function_name
#'
#' Template for new functions
#'
#' @title This is a shorter description which appears when the name of the function is recommended.
#'
#' @description
#' This is a template.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param data The tibble or data frame containing the data.
#' @param ... `verbose` for now.
#'
#' @return
#' It returns...
#'
#' @examples
#' data(iris)
#' get_numeric(iris)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
get_numeric = function(data, verbose = 1) {
  old_dim = dim(data)
  data %<>% dplyr::select_if(is.numeric)
  if (any(dim(data) != old_dim) & verbose) {
    warning("There are non-numeric columns in the tibble. Omitting them.")
  }
  return(data)
}
