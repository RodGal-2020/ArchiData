#' inspect_environment
#'
#' @description
#' Inspect the parameters in the working environment.
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param ... Slaanesh knows what.
#'
#' @return Nothing, only prints.
#'
#' @examples
#' x = 1
#' vector_of_items = c("item_1", "item_2")
#' inspect_environment()
#'
#' @title Inspect the environment.
#'
#' @export
inspect_environment <- function(...) {
  source("parameters.R")

  params = ls()
  params = params[!params %in% function_names]
  params = params[!params %in% not_for_printing]
  # Print information about each parameter already in the environment
  for (p in params) {
    ArchiData::glance(p)
  }
}
