#' UTCI2color
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
#' @param UTCI A vector of numerical or nonnumerical UTCI values.
#'
#' @importFrom magrittr %<>%
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
UTCI2color = function(UTCI) {
  if (is.character(UTCI[1])) {
    output = c()
    for (label in UTCI) {
      output %<>% c(ArchiData::UTCI_colors[which(ArchiData::UTCI_labels == label)]) # Can be improved
    }
  } else { # Numeric
    output = cut(
      UTCI,
      breaks = c(-Inf, -40, -27, -12, 0, 9, 26, 28, 32, 38, 46, Inf),
      labels = ArchiData::UTCI_colors,
      right = TRUE
    ) %>%
      as.character()
  }

  return(output)
}
