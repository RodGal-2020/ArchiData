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
#' @param ... `verbose` for now.
#'
#' @importFrom magrittr %<>%
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
auto_cor = function(data, ...) {
  Var1 <- Var2 <- value <- NULL

  ArchiData::three_dots(..., na_action = tidyr::drop_na)

  data %<>% ArchiData::get_numeric(verbose = ArchiData_params$verbose)
  any_numeric = ncol(data) > 0

  if (!any_numeric) {
    warning("No numeric variable found. Returning zero status.")
    return(0)
  }

  if (!is.null(ArchiData_params$na_action)) {
    warning("Applying `na_action`.")
    data %<>% ArchiData_params$na_action()
  }

  # Calcular la matriz de correlación
  cor_matrix <- cor(data, use = "complete.obs")

  # Visualizar la matriz de correlación como un mapa de calor
  # library(reshape2)

  melted_cor_matrix <- reshape2::melt(cor_matrix)
  cor_plot = melted_cor_matrix %>%
    ggplot2::ggplot(ggplot2::aes(x=Var1, y=Var2, fill=value)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1,1), space = "Lab", name="Correlation") +
    ArchiData_params$ggplot_theme +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))

  cor_plot %<>% plotly::ggplotly()

  return(cor_plot)
}
