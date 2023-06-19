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
#' @param only_date Do you want to print only the date of the last version?
#'
#' @importFrom utils packageVersion packageDescription
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
    date_part <- parts[4]
    # date <- substr(date_part, start = 1, stop = 6)
    dateObj <- as.Date(date_part, format = "%y%m%d")
    return(dateObj)
  } else {
    cat("Using ArchiData", packageDescription("ArchiData", fields = "Version"), "\n")
  }
}


