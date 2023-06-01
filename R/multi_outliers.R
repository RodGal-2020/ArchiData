#' multi_outliers
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
multi_outliers = function(data, plot = TRUE) {
  output = list()

  # data = iris
  ncols = min(3, ncol(data))
  numeric_data = data %>% ArchiData::get_numeric()

  ### Boxplots
  print_boxplot = function(var) {
    # var = "Sepal.Length"
    fill_color <- hcl.colors(length(names(numeric_data)))[match(var, names(numeric_data))]
    gg_hist = numeric_data %>%
      ggplot2::ggplot(ggplot2::aes(y = !!dplyr::sym(var))) +
        ggplot2::geom_boxplot(fill = fill_color, color = "#9900CC",
                              outlier.color = "red", outlier.shape = 18, outlier.size = 2) +
        ggplot2::theme_minimal() +
        ggplot2::labs(x = var, y = NULL)

    return(gg_hist)
  }
  boxplots <- lapply(names(numeric_data), print_boxplot)
  output$boxplots = boxplots
  if (plot) {
    gridExtra::grid.arrange(grobs = boxplots, ncol = 4)
  }

  ### Histograms
  print_hist = function(var) {
    color <- rainbow(length(names(numeric_data)))[match(var, names(numeric_data))]
    numeric_data %>%
      ggplot(aes(x = !!sym(var))) +
      geom_histogram(fill = color, color = "white", bins = 30) +
      labs(title = var, x = var, y = "Absolute frequency") +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 8, hjust = 0.5),
        axis.title = element_text(size = 6),
        axis.text.x = element_text(angle = 45, hjust = 1, size = 4),
        axis.text.y = element_text(size = 4)
      )
  }
  histograms <- lapply(names(numeric_data), print_hist)
  output$histograms = histograms
  if (plot) {
    gridExtra::grid.arrange(grobs = histograms, ncol = 4)
  }

  return(output)
}
