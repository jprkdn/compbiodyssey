# ~/.Rprofile — safe version for computational biology + ML

options(
  repos = c(CRAN = "https://cloud.r-project.org"),
  scipen = 999,
  stringsAsFactors = FALSE,
  width = 100
)

message("✅ .Rprofile loaded. R is ready for computational biology.")

# Helper function to load core lightweight packages
cbcore <- function() {
  pkgs <- c("tidyverse", "data.table", "janitor", "glue")
  
  for (pkg in pkgs) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      install.packages(pkg)
    }
    library(pkg, character.only = TRUE)
  }
  
  message("🚀 Core tidyverse + utility packages are loaded.")
}

# Full session loader (bioinformatics, ML, etc.)
cbsession <- function() {
  message("🔬 Setting up your comp bio + ML session...")
  
  bio_pkgs <- c("Seurat", "SingleCellExperiment", "scran", "scater", "DESeq2", "edgeR", "limma")
  omics_pkgs <- c("biomaRt", "AnnotationDbi", "org.Hs.eg.db", "GenomicRanges", "SummarizedExperiment")
  prot_pkgs <- c("MSnbase", "DEP")
  rwd_pkgs <- c("lubridate", "survival", "survminer")
  ml_pkgs  <- c("caret", "tidymodels", "xgboost", "randomForest", "ranger", "keras")
  
  all_pkgs <- c(bio_pkgs, omics_pkgs, prot_pkgs, rwd_pkgs, ml_pkgs)
  
  for (pkg in all_pkgs) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      message(glue::glue("Installing {pkg}..."))
      tryCatch({
        BiocManager::install(pkg, ask = FALSE)
      }, error = function(e) {
        install.packages(pkg)
      })
    }
    library(pkg, character.only = TRUE)
  }
  
  message("✅ All major packages loaded.")
}

## Custom prompt for fun
if (interactive()) options(prompt = "🧬> ")
