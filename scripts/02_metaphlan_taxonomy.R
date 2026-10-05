#!/usr/bin/env Rscript

# ============================================================
# 02_metaphlan_taxonomy.R
# Run MetaPhlAn on host-removed FASTQ files
# ============================================================

library(tidyverse)

# ---- Directories ----
clean_fastq_dir <- "data/intermediate/host_removed"
metaphlan_out_dir <- "data/intermediate/metaphlan"
dir.create(metaphlan_out_dir, showWarnings = FALSE, recursive = TRUE)

# ---- Paths to tools ----
metaphlan_path <- "metaphlan"   # assuming micromamba env has metaphlan in PATH

# ---- List clean FASTQ files ----
fastq_files <- list.files(clean_fastq_dir, pattern = "_clean.fastq$", full.names = TRUE)

# ---- Run MetaPhlAn for each sample ----
for (fq in fastq_files) {
  
  sample_name <- basename(fq) %>% str_replace("_clean.fastq", "")
  
  output_file <- file.path(metaphlan_out_dir, paste0(sample_name, "_profile.txt"))
  
  message("Running MetaPhlAn for: ", sample_name)
  
  system2(
    metaphlan_path,
    args = c(
      fq,
      "--input_type", "fastq",
      "--nproc", "4",
      "--bowtie2db", "data/raw/metaphlan_db",   # update if your DB is elsewhere
      "-o", output_file
    )
  )
  
  message("✔ MetaPhlAn complete for: ", sample_name)
}

message("✔ All MetaPhlAn profiles saved to: ", metaphlan_out_dir)

# ---- Merge profiles into a single table ----
message("Merging MetaPhlAn profiles...")

profile_files <- list.files(metaphlan_out_dir, pattern = "_profile.txt$", full.names = TRUE)

merged_output <- file.path(metaphlan_out_dir, "merged_abundance_table.tsv")

system2(
  metaphlan_path,
  args = c(
    "--merge",
    paste(profile_files, collapse = ","),
    "-o", merged_output
  )
)

message("✔ Merged abundance table created at: ", merged_output)

# ---- Save session info ----
writeLines(capture.output(sessionInfo()), "logs/02_metaphlan_sessionInfo.txt")

message("✔ MetaPhlAn taxonomy profiling complete.")
