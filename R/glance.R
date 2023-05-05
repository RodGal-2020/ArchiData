#' glance
#'
#' This function is used to print information about a given parameter.
#'
#' @param p_name The name of the parameter
#'
#' @return Nothing, only prints.
#'
#' @examples
#' x = 1
#' glance("x")
#'
#' @title This function is used to print information about a given parameter
#'
#' @export
glance <- function(p_name) {
  # message("🔎 p_name = ", p_name)
  p_value <- eval(as.name(p_name))
  l_p_value = length(p_value)
  if (l_p_value > 1) {
    # Print a general message and then, for each value, a new subline with the value
    message(paste0("🔎 ", crayon::cyan(p_name), " = "))
    if (is.list(p_value)) {
      for (i in 1:l_p_value) {
        message(paste0("\t", p_value[[i]]))
      }
    } else {
      for (i in 1:l_p_value) {
        message(paste0("\t", p_value[i]))
      }
    }
  } else {
    message(paste0("🔎 ", crayon::cyan(p_name), " =\n\t", p_value))
  }
}
