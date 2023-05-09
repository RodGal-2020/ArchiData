#' Three dots
#'
#' Auxiliary function for the automated definition of the common omitted parameters.
#'
#' @title Read the "..." arguments inside a function.
#'
#' @description
#' Use this function only at the beginning of the function.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param arguments It should have the value `list(...)`
#'
#' @return
#' Nothing, it only exports the values to the environment.
#'
#' @examples
#' f = function(...) {
#'   arguments = list(...)
#'   ArchiData::three_dots(arguments)
#' }
#'
#' @section Warning:
#' The exportation of the values to the environment is done throgh the defition of **global variables**.
#'
#' @export
three_dots = function(arguments) {
  if (is.null(arguments$default)) {
    default <<- 1
  } else {
    default <<- arguments$default
  }

  if (is.null(arguments$verbose)) {
    verbose <<- 1
  } else {
    verbose <<- arguments$verbose
  }

  if (is.null(arguments$debugging)) {
    debugging <<- 0
  } else {
    debugging <<- arguments$debugging
  }
}
