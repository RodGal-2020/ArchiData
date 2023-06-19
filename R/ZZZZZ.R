.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Using ArchiData ", utils::packageDescription("ArchiData", fields = "Version"))
  # usethis::use_pipe(export = TRUE) # To use the pipe operator (%>%) from magrittr
}
