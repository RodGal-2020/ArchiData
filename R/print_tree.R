#' print_tree
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
#' @return Nothing, only prints.
#'
#' @examples
#' tree_model = auto_tree(iris, Species ~ .)
#' print_tree(tree_model)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
print_tree = function(tree_model) {
  tree_model %>%
    rpart.plot::rpart.plot(
      type = 4, # Etiquetas, separadores
      extra = "auto",
      under = FALSE, fallen.leaves = TRUE,
      digits = 2, varlen = 0, faclen = 0, roundint = TRUE,
      cex = NULL, tweak = 1,
      clip.facs = FALSE, clip.right.labs = TRUE,
      snip = FALSE,
      box.palette = "auto", shadow.col = 0
    )
}
