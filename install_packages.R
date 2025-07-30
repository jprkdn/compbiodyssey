# install_packages.R

# -------- 1. Define Required Packages --------
cran_packages <- c(
  "tidyverse",
  "data.table",
  "ggplot2",
  "ragg",
  "httr",
  "rvest",
  "xml2",
  "googlesheets4",
  "googledrive",
  "devtools",     # if you install GitHub packages
  "renv"          # optional, for reproducible environments
)

github_packages <- c(
  "cbcore",
  "cbsession"
)

# -------- 2. Install Missing CRAN Packages --------
install_if_missing <- function(pkgs) {
  for (pkg in pkgs) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      message("Installing: ", pkg)
      install.packages(pkg)
    }
  }
}

install_if_missing(cran_packages)

# -------- 3. Install GitHub Packages --------
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")
library(devtools)

for (repo in github_packages) {
  pkg_name <- basename(repo)
  if (!requireNamespace(pkg_name, quietly = TRUE)) {
    message("Installing GitHub pkg: ", repo)
    install_github(repo)
  }
}

# -------- 4. Optional: Load Setup Functions --------
# Only if you want these loaded by default for this session
if ("cbcore" %in% .packages(all.available = TRUE)) {
  cbcore::cbcore()
}
if ("cbsession" %in% .packages(all.available = TRUE)) {
  cbsession::cbsession()
}

message("✅ All packages installed and setup complete.")