#' check_path
#'
#' Check if a given path (file or directory) exists
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
check_path = function(path, print_ok = FALSE) {
  if (!(file.exists(path) | dir.exists(path))) {
    cat("\u2639 save_path doesn't exist. Aborting session.\n")
    stop()
    cat("You we're working in the following directory:", crayon::cyan(getwd()), "\n")
  } else {
    if (print_ok) {
      cat("\u2705 File ", crayon::cyan(getwd()), " found.\n")
    }
  }
}
