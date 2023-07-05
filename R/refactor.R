#' refactor
#'
#' Change the values of the levels of a factor.
#'
#' @title This is a shorter description which appears when the name of the function is recommended.
#'
#' @description
#' This is a template.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param factor_string A vector with factor structure.
#' @param old_names Vector of old names.
#' @param new_names Vector of new names.
#' @param ordered Do you want it ordered as in `new_names`?
#'
#' @return
#' It returns...
#'
#' @examples
#' print("TODO:")
#'
#' @section Warning:
#' This is a warning
#'
#' @export
refactor = function(factor_string, old_names, new_names, ordered = FALSE) {
  n_names = length(old_names)
  factor_string %<>% as.character()

  for (i in 1:n_names) {
    old_name = old_names[i]; new_name = new_names[i]
    factor_string[factor_string == old_name] = new_name
  }

  factor_string %<>% as.factor()

  if (ordered) {
    factor_string %<>% ordered(levels = new_names)
  }

  return(factor_string)
}
