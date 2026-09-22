###############################################
# 00_environment_setup.R
# Purpose: Set up environment, directories, and dependencies
# for maternal–infant shotgun metagenomics pipeline
###############################################

###############################################
# Reproducibility
###############################################
set.seed(2026)

###############################################
# Create directory structure
###############################################
dir.create("data", showWarnings = FALSE)
dir.create("data/raw", showWarnings = FALSE)
dir.create("data/intermediate", showWarnings = FALSE)
dir.create("data/processed", showWarnings = FALSE)

dir.create("results", showWarnings = FALSE)
dir.create("results/figures", showWarnings = FALSE)
dir.create("results/tables", showWarnings = FALSE)

dir.create("scripts", showWarnings = FALSE)
dir.create("docs", showWarnings = FALSE)

###############################################
# Load required R packages
###############################################
required_packages <- c(
  "tidyverse",
  "data.table",
  "phyloseq",
  "vegan",
  "ggplot2",
  "readr",
  "stringr"
)

for(pkg in required_packages){
  if(!requireNamespace(pkg, quietly = TRUE)){
    install.packages(pkg)
  }
  library(pkg, character.only = TRUE)
}

###############################################
# External tool checks (MetaPhlAn, HUMAnN, Bowtie2)
###############################################
check_tool <- function(tool){
  status <- suppressWarnings(system2(tool, "--version", stdout = TRUE, stderr = TRUE))
  if(length(status) == 0){
    message(paste("❗", tool, "not found in PATH"))
  } else {
    message(paste("✔", tool, "available"))
  }
}

check_tool("metaphlan")
check_tool("humann")
check_tool("bowtie2")

###############################################
# Save session info
###############################################
writeLines(capture.output(sessionInfo()),
           "docs/sessionInfo_environment_setup.txt")

###############################################
# End of 00_environment_setup.R
###############################################