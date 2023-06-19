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
#' @param ... It should have the value `list(...)`
#'
#' @return
#' Nothing, it only exports the values to the environment.
#'
#' @examples
#' \dontrun{
#' f = function(...) {
#'   arguments = list(...)
#'   ArchiData::three_dots(arguments)
#' }
#' }
#'
#' @section Warning:
#' The exportation of the values to the environment is done throgh the definition of **global variables**.
#'
#' @export
three_dots = function(...) {
  arguments = list(...)
  ArchiData_params <<- list()

  ######### DEFAULT
  if (is.null(arguments$default)) {
    ArchiData_params$default <<- 1
  } else {
    ArchiData_params$default <<- arguments$default
  }

  ######### VERBOSE
  if (is.null(arguments$verbose)) {
    ArchiData_params$verbose <<- 1
  } else {
    ArchiData_params$verbose <<- arguments$verbose
  }

  ######### DEBUGGING
  if (is.null(arguments$debugging)) {
    ArchiData_params$debugging <<- 0
  } else {
    ArchiData_params$debugging <<- arguments$debugging
  }

  ######### THEME
  if (is.null(arguments$ggplot_theme)) {
    ArchiData_params$ggplot_theme <<- ggplot2::theme_dark()
    # ggplot_theme = ggplot2::theme_minimal()
  } else {
    ArchiData_params$ggplot_theme <<- arguments$ggplot_theme
  }

  ######### NA
  if (is.null(arguments$na_action)) {
    ArchiData_params$na_action <<- NULL
  } else {
    ArchiData_params$na_action <<- arguments$na_action
  }

}
