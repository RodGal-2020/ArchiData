#' print_boxplot
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
#' print_boxplot(iris, "Petal.Width")
#'
#' @section Warning:
#' This is a warning
#'
#' @export
print_boxplot <- function(data, x_var, fill_color = "skyblue", title = "") {
  # fill_color = "skyblue"; title = ""
  # data = iris; x_var = "Petal.Width"

  # ggplot(data, aes(x = .data[[x_var]])) +
  gg_boxplot = ggplot2::ggplot(data, ggplot2::aes(y = !!dplyr::sym(x_var))) +
    ggplot2::labs(x = x_var, y = NULL, title = title) +
    ggplot2::theme_minimal() +
    ArchiData::ggplot2_theme() +
    ggplot2::geom_boxplot(width = 0.2, color = "black", fill = fill_color, outlier.color = "red", outlier.shape = 18, outlier.size = 2)

  return(gg_boxplot)
}
