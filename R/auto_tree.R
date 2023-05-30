#' auto_tree
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
#' @return The fit engine for a tree model, the result of applying `extract_fit_engine()` to the trained model.
#'
#' @examples
#' data = iris
#' formula = Species ~ .
#' auto_tree(data, formula)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
auto_tree = function(data, formula, model_mode = "classification", model_depth = 3) {
  ####################
  model_min_n = dim(data)[1] / 10
  ####################

  tree_recipe <- recipes::recipe(formula, data)

  tree_model <- parsnip::decision_tree() %>%
    parsnip::set_engine("rpart") %>%
    parsnip::set_args(tree_depth = !!model_depth, min_n = !!model_min_n) %>%
    parsnip::set_mode(model_mode)

  tree_workflow <- workflows::workflow() %>%
    workflows::add_model(tree_model) %>%
    workflows::add_recipe(tree_recipe)

  trained_model <- tree_workflow %>%
    parsnip::fit(data)

  fit_engine <- trained_model %>%
    workflows::extract_fit_engine()

  return(fit_engine)
}
