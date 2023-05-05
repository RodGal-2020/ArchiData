#' setup
#'
#' Template for new functions
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
#' @title This is a shorter description which appears then the name of the function is recommended.
#'
#' @export
setup = function() {
  ##########################################
  # Aux functions
  # get_depth = function(this,thisdepth=0){
  #   if(!is.list(this)){
  #     return(thisdepth)
  #   }else{
  #     return(max(unlist(lapply(this,get_depth,thisdepth=thisdepth+1))))
  #   }
  # }
  ##########################################

  default <- readline("Do you want to use the default parameters' path (config/parameters.R)? (1/0): \n")
  default %<>% as.numeric()

  if (default) {
    p_path = "config/parameters.R"
  } else {
    p_path <- readline(paste0("Write the path to the ", crayon::silver("parameters.R"), " file: \n"))
  }

  if (!file.exists(p_path)) {
    stop("😟 chosen path doesn't exist. Aborting session.")
    cat("🐛 You we're working in the following directory:", crayon::cyan(getwd()))
  } else {
    source(p_path)
    # params = ls(envir=.GlobalEnv)
  }
}
