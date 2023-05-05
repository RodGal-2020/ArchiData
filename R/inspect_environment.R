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
  # source("config/parameters.R") # Made in .onLoad in zzz.R

  params = ls(envir=.GlobalEnv) # Really important to have the parameter
  params = params[!params %in% get("function_names")] # Avoid functions
  params = params[!params %in% get("not_for_printing")] # Avoid non-printable
  # Print information about each parameter already in the environment
  for (p in params) {
    (p_string = as.symbol(p))
    typeof(p_string)
    (p_string = as.character(as.name(p)))
    typeof(p_string)
    ArchiData::glance(p_string) # glance("x")
  }
}
