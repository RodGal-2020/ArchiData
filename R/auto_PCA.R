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
#' @return
#' A list of three elements:
#'
#' - `loadings`.
#' - `loadings_plot`.
#' - `var_explained_plot`.
#'
#' @examples
#' data(iris)
#' iris_pca = auto_PCA(iris)
#' iris_pca$loadings
#' iris_pca$loadings_plot
#' iris_pca$var_explained_plot
#'
#' @section Warning:
#' This is a warning
#'
#' @export
auto_PCA = function(data) {

  data %<>% ArchiData::get_numeric()

  data_scaled <- scale(data)

  # Aplicar el análisis de componentes principales
  pca <- prcomp(data_scaled, center = TRUE, scale. = TRUE)

  # Varianza explicada por cada componente principal
  var_explained <- pca$sdev^2 / sum(pca$sdev^2) * 100

  # Coeficientes de carga de las variables en cada componente
  loadings <- pca$rotation

  # Gráfico de varianza explicada por cada componente
  var_explained_plot <- ggplot2::ggplot(data.frame(PC = 1:length(var_explained), VarExplained = var_explained), ggplot2::aes(x = PC, y = VarExplained)) +
    ggplot2::geom_bar(stat = "identity", fill = "violet") +
    ggplot2::labs(x = "Componente Principal", y = "Varianza Explicada (%)") +
    ggplot2::theme_minimal()

  # Gráfico de coeficientes de carga
  loadings_plot <- ggplot2::ggplot(data.frame(variables = colnames(data), PC1 = loadings[, 1], PC2 = loadings[, 2]), ggplot2::aes(x = PC1, y = PC2, label = variables)) +
    ggplot2::geom_text() +
    ggplot2::labs(x = "Componente Principal 1", y = "Componente Principal 2") +
    ggplot2::theme_minimal()

  # Imprimir los gráficos
  return(
    list(
      "loadings" = loadings,
      "loadings_plot" = loadings_plot,
      "var_explained_plot" = var_explained_plot
    )
  )
  print(var_explained_plot)
  print(loadings_plot)
}
