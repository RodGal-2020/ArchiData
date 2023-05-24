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
#' print("TODO:")
#'
#' @section Warning:
#' This is a warning
#'
#' @export
print_boxplot <- function(data, x_var, x_label, title) {
  ggplot(data, aes(x = .data[[x_var]])) +
    geom_boxplot(width = 0.2, color = "black", fill = "grey", outlier.color = "red", outlier.shape = 18, outlier.size = 3) +
    theme_minimal() +
    labs(x = x_label, title = title)
}
