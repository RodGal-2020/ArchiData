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
#' @param data The tibble or data frame containing the data.
#'
#' @return A correlation heatmap.
#'
#' @examples
#' data(iris)
#' iris_cor = auto_cor(iris)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
auto_cor = function(data) {
  data %<>% ArchiData::get_numeric()

  # Calcular la matriz de correlación
  cor_matrix <- cor(data)

  # Visualizar la matriz de correlación como un mapa de calor
  # library(reshape2)

  melted_cor_matrix <- reshape2::melt(cor_matrix)
  cor_plot = melted_cor_matrix %>%
    ggplot2::ggplot(ggplot2::aes(x=Var1, y=Var2, fill=value)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1,1), space = "Lab", name="Correlation") +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))

  return(cor_plot)
}
