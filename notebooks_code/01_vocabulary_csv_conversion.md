Reading and saving of the vocabulary files
================
2025-10-15

- [Packages](#packages)
- [Read the vocabulary data](#read-the-vocabulary-data)
- [Processing](#processing)
- [Save the vocabulary data to .cvs](#save-the-vocabulary-data-to-cvs)

``` r
base::remove(list=ls())
```

Set-up and packages

``` r
library(lanuprodatascience)
check_renv_r_version_match() # 🛑 Stops if R version is incompatible
```

    ## ✅ R version matches renv.lock: 4.5.1

``` r
#renv::activate()

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
```

    ## - The library is already synchronized with the lockfile.

# Packages

``` r
options("install.lock"=FALSE)

#If we are working in our project, we can simply use the following to load our packages
library("here")
```

    ## here() starts at D:/my_github_projects/lanupro_vocabulary_2025

``` r
library("readxl")
library("writexl")
```

Make a snaphot of all packages

``` r
renv::snapshot()
```

    ## The following package(s) will be updated in the lockfile:
    ## 
    ## # CRAN -----------------------------------------------------------------------
    ## - bookdown   [0.45 -> *]
    ## 
    ## - Lockfile written to "D:/my_github_projects/lanupro_vocabulary_2025/renv.lock".

# Read the vocabulary data

Directly from the server

``` r
df_vocabulary_general <- read_excel(path = here("data/raw_results/lanupro_vocabulary_general.xlsx"))
df_vocabulary_fatty_acids <- read_excel(path = here("data/raw_results/lanupro_vocabulary_fatty_acids.xlsx"))
df_vocabulary_incubations <- read_excel(path = here("data/raw_results/lanupro_vocabulary_incubations.xlsx"))
```

# Processing

If needed

# Save the vocabulary data to .cvs

For excel power query and For version control

``` r
write.csv(df_vocabulary_general, file = here("data/processed/lanupro_vocabulary_general.csv"))
write.csv(df_vocabulary_fatty_acids, file = here("data/processed/lanupro_vocabulary_fatty_acids.csv"))
write.csv(df_vocabulary_incubations, file = here("data/processed/lanupro_vocabulary_incubations.csv"))
```
