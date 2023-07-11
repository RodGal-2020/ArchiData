#' MVR
#'
#' Missing Value Ratio out of a tibble.
#'
#' @title This is a shorter description which appears when the name of the function is recommended.
#'
#' @description
#' This is a template.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param data The tibble or data.frame you are working with.
#'
#' @return A tibble with a column for variable names, and another for the MVR, the Missing Value Ratio.
#'
#' @examples
#' set.seed(1974)
#'
#' iris_pierced <- iris
#' index <- sample(1:nrow(iris), 10, replace = FALSE)
#' iris_pierced[index, ] <- NA
#'
#' MVR(iris_pierced)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
MVR = function(data) {
  data %<>%
    dplyr::summarise_all(~ mean(is.na(.))) %>%
    dplyr::mutate_all(prod, 100) %>%
    dplyr::mutate_all(round, 2)

  output = tibble::as_tibble(cbind(
      Variable = names(data),
      t(data) %>% magrittr::set_colnames("MVR")
    ), .name_repair = "check_unique")

  return(output)
}
