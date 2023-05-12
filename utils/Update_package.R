# Arranque
{
  renv::activate(project = '~/GitHub/ArchiData', profile = NULL)
  synchronized = renv::status()$synchronized
  if (!synchronized) {
    renv::restore()
  }
}

# Guardado
renv::snapshot()

# Update documentation & installation
cat("Change version manually in the DESCRIPTION file")
devtools::document() # To update the documentation
devtools::install() # To install as local package
# If "internal error -3" just restart R
library(ArchiData)

# Check if everything is as it should be
devtools::check(error_on = "error")
devtools::check(error_on = "warning")
# Remember that the @examples section is checked.
