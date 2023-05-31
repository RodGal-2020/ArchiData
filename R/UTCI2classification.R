#' UTCI2classification
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
UTCI2classification = function(UTCI) {
  # UTCI = seq(-40,50,10)

  classification = cut(
    UTCI,
    breaks = c(-Inf, -40, -27, -12, 0, 9, 26, 28, 32, 38, 46, Inf),
    labels = ArchiData::UTCI_labels,
    right = TRUE
  ) %>% ordered(levels = ArchiData::UTCI_labels)

  return(classification)
}
