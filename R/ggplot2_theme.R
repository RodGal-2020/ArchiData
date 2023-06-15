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
#' @export
ggplot2_theme = function() {
  ggplot2::theme(
    plot.title = ggplot2::element_text(size = 8, hjust = 0.5),
    axis.title = ggplot2::element_text(size = 6),
    axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 4),
    axis.text.y = ggplot2::element_text(size = 4)
  )
}
