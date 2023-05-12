.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Using ArchiData ", utils::packageDescription("ArchiData", fields = "Version"))
}
