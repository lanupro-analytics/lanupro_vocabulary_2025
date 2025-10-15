
# Script to render all R notebooks and code
# based on the specified order of the user

base::remove(list=ls())


library(lanuprodatascience)
#check_renv_r_version_match() # 🛑 Stops if R version is incompatible

renv::activate()

# Install 'pak' if not yet installed
if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

# Install 'lanuprodatascience' if not yet installed
if (!requireNamespace("lanuprodatascience", quietly = TRUE)) {
  pak::pkg_install("lanupro-analytics/lanuprodatascience")
}

# Restore exact package versions (no updates)
renv::restore(prompt = FALSE, repos = NULL)


# Load packages
library("here")

# Make a snaphot of all packages

renv::snapshot()




my_files <- list.files(path = here("notebooks_code"))
my_files <- my_files[order(my_files)]

for (i in my_files)
{
  rmarkdown::render(here(paste0("notebooks_code/", i)), output_options = c("self_contained = TRUE"))

}
