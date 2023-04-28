#' package_info
#'
#' Template for new functions
#'
#' @description
#' This is a template.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param my_param Yep, it's a parameter.
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
#' @title This is a shorter description which appears then the name of the function is recommended.
#'
#' @export
package_info = function() {
  cat("Using ArchiData", packageDescription("ArchiData", fields = "Version"), "\n")
}


