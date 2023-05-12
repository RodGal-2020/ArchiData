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
#' @param x The independant variable (TODO: "variables").
#' @param y The dependant variable.
#'
#' @return A dendogram plot.
#'
#' @examples
#' data(iris)
#' iris_clustering = auto_clustering(iris, x = "Sepal.Length", y = "Sepal.Width")
#'
#' @section Warning:
#' This is a warning
#'
#' @export
auto_clustering = function(data, x, y) {
  data %<>% ArchiData::get_numeric()

  data_scaled <- scale(data)

  ## k-medias
  # Aplicar el algoritmo k-means
  k <- 3  # Número de clusters
  kmeans_result <- kmeans(data_scaled, centers = k)

  # Obtener las etiquetas de los clusters asignados a cada punto
  cluster_labels <- kmeans_result$cluster

  # Agregar las etiquetas de los clusters al dataframe original
  data_clustered <- data
  data_clustered$cluster <- as.factor(cluster_labels)

  # Gráfico de dispersión de los clusters
  data_clustered %>%
    ggplot2::ggplot(ggplot2::aes(x, y, color = cluster)) +
    ggplot2::geom_point() +
    # ggplot2::labs(x = "Temperatura del aire (°C)", y = "Temperatura radiante (°C)", color = "Cluster") +
    ggplot2::theme_minimal()

  ## Agrupamiento jerárquico
  # Aplicar el agrupamiento jerárquico
  hclust_result <- hclust(dist(data_scaled))

  # Obtener los grupos a partir del corte del dendrograma
  cut_dendrogram <- cutree(hclust_result, k)

  # Obtener las etiquetas de los clusters asignados a cada punto
  cluster_labels <- as.factor(cut_dendrogram)

  # Agregar las etiquetas de los clusters al dataframe original
  data_clustered <- data
  data_clustered$cluster <- cluster_labels
  n_data_points = dim(data_clustered)[1]

  # Gráfico de dendrograma
  dendrogram = data.frame(
    x = 1:length(hclust_result$height),
    y = hclust_result$height
  ) %>%
    ggplot2::ggplot() +
    ggplot2::geom_segment(
      ggplot2::aes(
        x = x,
        y = y,
        xend = x,
        yend = y - 1,
        color = as.factor(cluster_labels[-n_data_points])) # Eliminamos el último
    ) +
    ggplot2::labs(x = "\u00CDndice de observaciones", y = "Altura del dendrograma", color = "Cluster") +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "none")

  print(dendrogram)

  return(dendrogram)
}
