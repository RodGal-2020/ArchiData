#' MRT
#'
#' Get Mean Radiant Temperature
#'
#' @title Get the Mean Radiant Temperature (MRT)
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param GT Globe temperature (ºC).
#' @param T_a Air temperature (ºC).
#' @param V Wind speed (m/s).
#' @param E Emissivity of the goble. Defaults to 0.95.
#' @param D Diameter of the globe. Defaults to 0.05
#' @param units Should the output be given in Kelvin (K) or centigrades (C) degrees? Defaults to centigrades.
#'
#' @return
#' Mean Radiant Temperature
#'
#' @examples
#' GT = 40
#' T_a = 40
#' V = 2
#'
#' RT(GT, T_a, V)
#'
#' @export
MRT = function(T_a, GT, V, E = 0.95, D = 0.05, units = "C") {

  t1 = (GT + 273)^4
  t2 = (1.1e8 * V^0.6) * (GT - T_a) / (E * D^0.4)

  MRT_K = (t1 + t2)^0.25

  if (units == "K") {
    return(MRT_K)
  }

  MRT_C = MRT_K - 273

  if (units == "C") {
    return(MRT_C)
  }

  warning("Reached end of function without returning value. Returning 0 status.")
  return(0)
}
