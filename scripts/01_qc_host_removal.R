###############################################
# 01_qc_host_removal.R
# Purpose: Quality control + host-read removal
# for maternal–infant shotgun metagenomics pipeline
###############################################

###############################################
# Reproducibility
###############################################
set.seed(2026)

###############################################
# Load libraries
###############################################
library(tidyverse)
library(stringr)

###############################################
# Directory setup
###############################################
raw_dir <- "data/raw"
intermediate_dir <- "data/intermediate"
qc_dir <- file.path(intermediate_dir, "qc_reports")
host_removed_dir <- file.path(intermediate_dir, "host_removed")

dir.create(qc_dir, showWarnings = FALSE, recursive = TRUE)
dir.create(host_removed_dir, showWarnings = FALSE, recursive = TRUE)

###############################################
# Parameters
###############################################
fastqc_path <- "fastqc"        # assumes FastQC in PATH
bowtie2_path <- "bowtie2"      # assumes Bowtie2 in PATH
host_index <- "data/raw/host_index/hg38/GRCh38_noalt_as" # human genome index

###############################################
# 1. Identify FASTQ files
###############################################
fastq_files <- list.files(raw_dir, pattern = "\\.fastq.gz$", full.names = TRUE)

if(length(fastq_files) == 0){
  stop("No FASTQ files found in data/raw/")
}

message("✔ Found ", length(fastq_files), " FASTQ files")

###############################################
# 2. Run FastQC on all FASTQ files
###############################################
message("Running FastQC...")

for(fq in fastq_files){
  system2(fastqc_path,
          args = c(fq, "--outdir", qc_dir),
          stdout = TRUE, stderr = TRUE)
}

message("✔ FastQC complete. Reports saved to: ", qc_dir)

###############################################
# 3. Host-read removal (Bowtie2)
###############################################
message("Running Bowtie2 host-read removal...")

for(fq in fastq_files){
  
  sample_name <- str_replace(basename(fq), "\\.fastq\\.gz$", "")
  output_clean <- file.path(host_removed_dir, paste0(sample_name, "_clean.fastq"))
  
  system2(bowtie2_path,
          args = c(
            "-x", host_index,
            "-U", fq,
            "--very-sensitive",
            "--threads", "4",
            "-S", file.path(host_removed_dir, paste0(sample_name, ".sam"))
          ))
  
  # Convert SAM → FASTQ (keeping only unaligned reads)
  sam_file <- file.path(host_removed_dir, paste0(sample_name, ".sam"))
  system2("samtools",
          args = c("fastq", "-f", "4", "-0", output_clean, sam_file))
  
  # Remove SAM to save space
  file.remove(sam_file)
  
  message("✔ Host removal complete for: ", sample_name)
}

message("✔ All host-removed FASTQ files saved to: ", host_removed_dir)

###############################################
# Save session info
###############################################
writeLines(capture.output(sessionInfo()),
           "docs/sessionInfo_qc_host_removal.txt")

###############################################
# End of 01_qc_host_removal.R
###############################################
