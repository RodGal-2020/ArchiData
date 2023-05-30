#' print_tree
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
#' @return Nothing, only prints.
#'
#' @examples
#' tree_model = auto_tree(iris, Species ~ .)
#' print_tree_importance(tree_model)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
print_tree_importance = function(tree_model) {
  importance = tree_model %$% variable.importance

  importance_tib <- tibble::tibble(variable = names(importance), importance = importance) %>%
    dplyr::arrange(desc(importance))

  bar_plot = importance_tib %>%
    ggplot2::ggplot(ggplot2::aes(x = reorder(variable, -importance), y = importance, fill = importance)) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::scale_fill_viridis_c(option = "plasma", direction = -1) +
    ggplot2::labs(x = "Variable", y = "Importance", title = "Variable Importance") +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))

  print(bar_plot)
}
