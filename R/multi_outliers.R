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

  # data = ggplot2::mpg
  ncols = min(3, ncol(data))
  numeric_data = data %>% ArchiData::get_numeric()

  ### Boxplots
  print_boxplot = function(var) {
    # var = "Sepal.Length"
    fill_color <- hcl.colors(length(names(numeric_data)))[match(var, names(numeric_data))]
    gg_boxplot = numeric_data %>%
      ggplot2::ggplot(ggplot2::aes(y = !!dplyr::sym(var))) +
        ggplot2::geom_boxplot(fill = fill_color, color = "#9900CC",
                              outlier.color = "red", outlier.shape = 18, outlier.size = 2) +
        ggplot2::theme_minimal() +
        ggplot2::labs(x = var, y = NULL)

    return(gg_boxplot)
  }
  boxplots <- lapply(names(numeric_data), print_boxplot)
  output$boxplots = boxplots
  if (plot) {
    gridExtra::grid.arrange(grobs = boxplots, ncol = 4)
  }

  ### Histograms
  print_hist = function(var) {
    color <- rainbow(length(names(data)))[match(var, names(data))]
    gg_hist = data %>%
      ggplot2::ggplot(ggplot2::aes(x = !!dplyr::sym(var))) +
      ggplot2::labs(title = var, x = var, y = "Absolute frequency") +
      ggplot2::theme_minimal() +
      ggplot2::theme(
        plot.title = ggplot2::element_text(size = 8, hjust = 0.5),
        axis.title = ggplot2::element_text(size = 6),
        axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 4),
        axis.text.y = ggplot2::element_text(size = 4)
      )

    selected_data = data %>%
      dplyr::select(dplyr::all_of(var)) %>%
      magrittr::extract2(1)

    if (is.factor(selected_data) || is.character(selected_data)) {
      gg_hist = gg_hist +
        ggplot2::geom_bar(fill = color, color = "white")
    } else if (is.numeric(selected_data)) {
      gg_hist = gg_hist +
        ggplot2::geom_histogram(fill = color, color = "white", bins = 30)
    }

    return(gg_hist)
  }
  histograms <- lapply(names(data), print_hist)
  output$histograms = histograms
  if (plot) {
    gridExtra::grid.arrange(grobs = histograms, ncol = 4)
  }

  ### k-neighboors
  # # library(dbscan)
  #
  # # Calcular la matriz de distancias
  # dist_matrix <- dist(data)
  #
  # # Definir el número de vecinos más cercanos (k)
  # k <- 5
  #
  # # Calcular la distancia promedio a los k vecinos más cercanos para cada punto
  # tic()
  # avg_dist <- apply(as.matrix(dist_matrix), 1, function(row) {
  #   sorted_indices <- order(row)
  #   mean(row[sorted_indices[2:(k + 1)]]) # Excluye la distancia al propio punto (valor mínimo)
  # })
  # toc()
  #
  # # 1 min 30 s para 11 elementos.
  #
  # # Calcular los límites para identificar outliers
  # q1 <- quantile(avg_dist, 0.25)
  # q3 <- quantile(avg_dist, 0.75)
  # iqr <- q3 - q1
  # lower_limit <- q1 - 1.5 * iqr
  # upper_limit <- q3 + 1.5 * iqr
  #
  # # Identificar outliers
  # outliers <- which(avg_dist < lower_limit | avg_dist > upper_limit)
  #
  # # Imprimir los índices de los outliers identificados
  # print(outliers)
  #
  # ### Z-score
  # # Calcular el z-score para cada variable
  # z_scores <- apply(data, 2, function(x) (x - mean(x)) / sd(x))
  #
  # # Definir umbrales basados en el z-score
  # z_score_threshold <- 3
  #
  # # Identificar outliers utilizando el z-score
  # outliers_z_score <- apply(z_scores, 2, function(x) abs(x) > z_score_threshold)
  #
  # # Calcular los límites del rango intercuartílico (IQR) para cada variable
  # q1 <- apply(data, 2, quantile, probs = 0.25)
  # q3 <- apply(data, 2, quantile, probs = 0.75)
  # iqr <- q3 - q1
  #
  # # Definir umbrales basados en el rango intercuartílico (IQR)
  # iqr_threshold <- 1.5
  #
  # # Identificar outliers utilizando el rango intercuartílico (IQR)
  # outliers_iqr <- apply(data, 2, function(x) x < (q1 - iqr_threshold * iqr) | x > (q3 + iqr_threshold * iqr))
  #
  # # Combinar los resultados de ambos métodos
  # outliers <- outliers_z_score | outliers_iqr
  #
  # # Imprimir los índices de los outliers identificados para cada variable
  # for (i in 1:ncol(data)) {
  #   print(paste("Variable:", names(data)[i]))
  #   print(which(outliers[, i]))
  # }
  #
  # ## z-scores
  # # Calcular el z-score para cada variable
  # z_scores <- apply(data, 2, function(x) (x - mean(x)) / sd(x))
  #
  # # Definir umbrales basados en el z-score
  # z_score_threshold <- 3
  #
  # # Identificar outliers utilizando el z-score
  # outliers_z_score <- apply(z_scores, 2, function(x) abs(x) > z_score_threshold)
  #
  # # Calcular los límites del rango intercuartílico (IQR) para cada variable
  # q1 <- apply(data, 2, quantile, probs = 0.25)
  # q3 <- apply(data, 2, quantile, probs = 0.75)
  # iqr <- q3 - q1
  #
  # # Definir umbrales basados en el rango intercuartílico (IQR)
  # iqr_threshold <- 1.5
  #
  # # Identificar outliers utilizando el rango intercuartílico (IQR)
  # outliers_iqr <- apply(data, 2, function(x) x < (q1 - iqr_threshold * iqr) | x > (q3 + iqr_threshold * iqr))
  #
  # # Combinar los resultados de ambos métodos
  # outliers <- outliers_z_score | outliers_iqr
  #
  # # Imprimir los índices de los outliers identificados para cada variable
  # ## CUIDADO! Que todos sean outliers suena como mínimo sospechoso
  # for (i in 1:ncol(data)) {
  #   print(paste("Variable:", names(data)[i]))
  #   print(which(outliers[, i]))
  # }

  return(output)
}
