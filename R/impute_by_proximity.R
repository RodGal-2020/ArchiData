#' impute_by_proximity
#'
#' Imputes missing values using nearby observations based on geographic proximity.
#'
#' @title Impute missing values using spatial proximity
#'
#' @description
#' This function imputes missing values in selected variables by using values from nearby
#' observations, based on a distance threshold. It supports both numeric and categorical variables.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param data A data frame containing the data to be imputed. It must include the columns `Longitudinal.coord` and `Latitudinal.coord`.
#' @param vars_to_impute A character vector with the names of the variables to impute.
#' @param threshold A numeric value indicating the maximum distance for considering neighbors (default is 0.0015).
#'
#' @return
#' A data frame with the same structure as the input, but with missing values imputed where possible.
#'
#' @examples
#' df <- data.frame(
#'   Longitudinal.coord = c(1, 1.001, 1.002, 1.1),
#'   Latitudinal.coord = c(2, 2.001, 2.002, 2.2),
#'   value = c(NA, 10, 15, 20)
#' )
#' impute_by_proximity(df, vars_to_impute = "value", threshold = 0.005)
#'
#' @section Warning:
#' This function assumes spatial coordinates are in the same units and scale, and that nearby observations have similar values.
#'
#' @export
impute_by_proximity <- function(data, vars_to_impute, threshold = 0.0015) {
  distancia_2d <- function(x1, y1, x2, y2) {
    sqrt((x2 - x1)^2 + (y2 - y1)^2)
  }
  
  data_imputed <- data
  
  for (i in seq_len(nrow(data))) {
    row <- data[i, ]
    
    if (!any(is.na(row[vars_to_impute]))) next
    
    data$distance <- distancia_2d(
      row$Longitudinal.coord, row$Latitudinal.coord,
      data$Longitudinal.coord, data$Latitudinal.coord
    )
    
    neighbors <- data %>%
      dplyr::filter(distance > 0, distance <= threshold)
    
    if (nrow(neighbors) == 0) next
    
    for (var in vars_to_impute) {
      if (is.na(row[[var]])) {
        valid_neighbors <- neighbors %>% dplyr::filter(!is.na(.data[[var]]))
        if (nrow(valid_neighbors) == 0) next
        
        imputed_value <- if (is.numeric(data[[var]])) {
          mean(valid_neighbors[[var]], na.rm = TRUE)
        } else {
          names(sort(table(valid_neighbors[[var]]), decreasing = TRUE))[1]
        }
        
        data_imputed[i, var] <- imputed_value
      }
    }
  }
  
  return(data_imputed)
}

