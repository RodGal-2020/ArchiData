.onLoad <- function() {
  ArchiData::package_info()

  default <- readline("Do you want to use the default parameters' path (config/parameters.R)? (1/0): \n")
  default %<>% as.numeric()

  if (default) {
    p_path = "config/parameters.R"
  } else {
    p_path <- readline(paste0("Write the path to the ", crayon::silver("parameters.R"), " file: \n"))
  }

  source(p_path)

  # message("Welcome to my package! :)")
}
