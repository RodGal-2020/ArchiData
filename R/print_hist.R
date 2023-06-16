#' print_hist
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
print_hist <- function(data, x_var, fill_color = "skyblue", title = "") {
  # fill_color = "skyblue"; title = ""
  # data = iris; x_var = "Petal.Width"
  gg_hist = data %>%
    ggplot2::ggplot(ggplot2::aes(x = !!dplyr::sym(x_var))) +
    ggplot2::labs(x = x_var, y = "Absolute frequency", title = title) +
    ggplot2::theme_minimal() +
    ArchiData::ggplot2_theme()

  selected_data = data %>%
    dplyr::select(!!dplyr::sym(x_var)) %>%
    magrittr::extract2(1)

  if (is.factor(selected_data) || is.character(selected_data)) {
    gg_hist = gg_hist +
      ggplot2::geom_bar(fill = fill_color, color = "white")
  } else if (is.numeric(selected_data)) {
    gg_hist = gg_hist +
      ggplot2::geom_histogram(fill = fill_color, color = "white", bins = 30)
  }

  return(gg_hist)
}
