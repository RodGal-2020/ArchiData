#' package_info
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
package_info = function(only_date = FALSE) {
  if (only_date) {
    version = as.character(packageVersion("ArchiData"))
    parts <- strsplit(version, ".", fixed = TRUE)[[1]]
    lastPart <- parts[length(parts)]
    date <- substr(lastPart, start = 1, stop = 6)
    dateObj <- as.Date(date, format = "%y%m%d")
    return(dateObj)
  } else {
    cat("Using ArchiData", packageDescription("ArchiData", fields = "Version"), "\n")
  }
}


