#' setup
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
#' @param ... Common parameters of the package, such as `default`, `verbose` and `debugging`.
#'
#' @return
#' It returns...
#'
#' @examples
#' ArchiData::setup(default = 1)
#'
#' @section Warning:
#' This is a warning
#'
#' @export
setup = function(...) {
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
  ArchiData::three_dots(list(...))

  if (is.null(ArchiData_params$default)) {
    default <- readline("Do you want to use the default parameters' path (config/parameters.R)? (1/0): \n") %>% as.numeric()
  }

  if (ArchiData_params$default) {
    p_path = "config/parameters.R"
  } else {
    p_path <- readline(paste0("Write the path to the ", crayon::silver("parameters.R"), " file: \n"))
  }

  if (!file.exists(p_path)) {
    warning("\u1F61F Chosen path '", crayon::italic(p_path), "' doesn't exist. Be sure to have a '", crayon::italic("config/Parameters.R"),  "' file")
    warning("\t\u1F41B You we're working in the following directory: ", crayon::italic(getwd()))
  } else {
    source(p_path)
    # params = ls(envir=.GlobalEnv)
  }

  message("\u1F60A Setup done.")
}
