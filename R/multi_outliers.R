#' multi_outliers
#'
#' Template for new functions
#'
#' @title This is a shorter description which appears when the name of the function is recommended.
#'
#' @description
#' This is a template.
#'
#' `r lifecycle::badge("deprecated")` **except for the boxplots**. Try `multi_hist()` instead for the histograms.
#'
#' @param data The dataset.
#' @param plot Do you want to plot the results? Admits "all", "hist", "boxplot".
#'
#' @importFrom magrittr %<>%
#' @importFrom grDevices hcl.colors
#'
#' @return
#' It returns...
#'
#' @examples
#' multi_outliers(iris)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
multi_outliers = function(data, plot = "all") {
  # data = iris; plot = "all"
  # data = ggplot2::mpg
  commands = c("all", "hist", "boxplot")

  if (!plot %in% commands) {
    warning("`plot` command not recognized. Use one of: ", paste0(commands, sep = ", "), "\n\nReturning 0 status.")
    return(0)
  }

  output = list()

  ncols = min(3, ncol(data))
  # numeric_data = data %>% ArchiData::get_numeric(verbose = 0)
  numeric_cols = data %>% dplyr::select_if(is.numeric) %>% colnames()
  # any_numeric = ncol(numeric_data) > 0
  # any_nonnumeric = (n_col(data) - ncol(numeric_data)) > 0

  ### Boxplots + Histograms
  boxplots = list()
  histograms = list()

  for (var in names(data)) {
    fill_color <- hcl.colors(length(names(data)))[match(var, names(data))]
    if (var %in% numeric_cols) {
      if (plot %in% c("all", "boxplot")) {
        boxplots %<>% append(list(ArchiData::print_boxplot(data, var, fill_color = fill_color)))
      }
      if (plot %in% c("all", "hist"))
      histograms %<>% append(list(ArchiData::print_hist(data, var, fill_color = fill_color)))
    } else {
      if (length(unique(data[,var][[1]])) < 8) {
        histograms %<>% append(list(ArchiData::print_hist(data, var, fill_color = fill_color)))
      }
    }
  }

  if (plot %in% c("all", "boxplot")) {
    gridExtra::grid.arrange(grobs = boxplots, ncol = 4)
  }
  if (plot %in% c("all", "hist")) {
    gridExtra::grid.arrange(grobs = histograms, ncol = 4)
  }

  # return(output)

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
}
