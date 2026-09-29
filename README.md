# Maternal–Infant Shotgun Metagenomics Pipeline  
Reproducible workflow for maternal–infant microbiome analysis using MetaPhlAn + HUMAnN

This repository contains an end‑to‑end shotgun metagenomics pipeline focused on maternal–infant microbiome development, microbial transfer, and early‑life health insights. The workflow includes host‑read removal, taxonomic profiling (MetaPhlAn), functional pathway analysis (HUMAnN), compositional filtering, longitudinal modeling, and reproducible documentation.

---

## Getting Started
This pipeline is designed to be fully reproducible and easy to run on any system with standard microbiome analysis tools installed. 
Follow the steps below to set up your environment and begin processing maternal–infant shotgun metagenomics data.

1. Install Required Tools
You will need the following software installed and available in your PATH:

Bowtie2 (host‑read removal)

FastQC (quality control)

MetaPhlAn 4 (taxonomic profiling)

HUMAnN 3 (functional profiling)

R ≥ 4.2 with tidyverse, phyloseq, and modeling packages

Python ≥ 3.8 (for MetaPhlAn/HUMAnN dependencies)

Environment setup is handled in:

scripts/00_environment_setup.R
This script installs required R packages and checks for external tools.

2. Prepare Input Data
Place raw FASTQ files and metadata in:

data/raw/
This folder is intentionally excluded from version control.

3. Download Host Genome Index (GRCh38)
Bowtie2 host‑read removal requires the GRCh38_noalt index.
Download and organize it by running:

scripts/01_qc_host_removal.R
This script retrieves the Bowtie2 index files and stores them in:

data/raw/host_index/

These files are large and are not committed to the repository.

4. Run the Pipeline
Execute each step in order:

scripts/01_qc_host_removal.R
scripts/02_metaphlan_taxonomy.R
scripts/03_humann_functional.R
scripts/04_merge_tables.R
scripts/05_compositional_filtering.R
scripts/06_longitudinal_modeling.R
scripts/07_visualizations.R

Intermediate files will be saved in:

data/intermediate/
Final outputs will be saved in:

data/processed/
results/

5. Review Outputs
The pipeline generates:

- taxonomic tables

- functional pathway tables

- host‑removed FASTQs

- longitudinal infant gut trajectories

- maternal → infant transfer summaries

- visualizations (PCoA, heatmaps, temporal plots)

All figures and tables are stored in:

Code
results/

---

## Project Overview

This pipeline is designed for maternal–infant shotgun metagenomics datasets, including:

- **Host‑read removal** (Bowtie2)
- **Taxonomic profiling** (MetaPhlAn)
- **Functional pathway analysis** (HUMAnN)
- **Compositional statistics** (CLR/ALR/ILR)
- **Longitudinal modeling** of infant gut development
- **Maternal → infant microbial transfer analysis**
- **Reproducible workflow structure** with version control

The goal is to provide a transparent, modular, and scientifically rigorous workflow aligned with early‑life microbiome research.

---

## Repository Structure

maternal-infant-shotgun-pipeline/
│
├── data/
│   ├── raw/                # Raw FASTQ, metadata (not committed)
│   ├── intermediate/       # Host-removed reads, HUMAnN intermediates
│   └── processed/          # Final tables, merged outputs
│
├── scripts/
│   ├── 00_environment_setup.R
│   ├── 01_qc_host_removal.R
│   ├── 02_metaphlan_taxonomy.R
│   ├── 03_humann_functional.R
│   ├── 04_merge_tables.R
│   ├── 05_compositional_filtering.R
│   ├── 06_longitudinal_modeling.R
│   └── 07_visualizations.R
│
├── results/
│   ├── figures/
│   └── tables/
│
├── docs/
│   ├── workflow_diagram.png
│   └── notes/
│
└── README.md

---

## Tools & Methods

### **Quality Control & Host Removal**
- FastQC  
- Bowtie2  
- KneadData (optional)

### **Taxonomic Profiling**
- **MetaPhlAn 4**  
  - high‑resolution clade profiling  
  - supports maternal–infant microbial transfer analysis

### **Functional Profiling**
- **HUMAnN 3**  
  - UniRef → pathway reconstruction  
  - stratified outputs for maternal vs infant contributions

### **Statistics & Modeling**
- tidyverse  
- phyloseq  
- compositional transforms (CLR/ALR/ILR)  
- mixed‑effects models  
- longitudinal trajectory visualization  

---

## Outputs

The pipeline generates:

- taxonomic abundance tables  
- functional pathway tables  
- host‑removed FASTQ files  
- longitudinal infant gut trajectories  
- maternal → infant transfer summaries  
- heatmaps, PCoA plots, and temporal visualizations  

All outputs are saved in results/.

---

## Reproducibility

- Version‑controlled scripts  
- Parameter tracking  
- Seed setting for stochastic steps  
- Session information saved per run  
- Modular scripts for easy reuse and extension  

---

## Host Genome Index (GRCh38)

This pipeline uses the GRCh38_noalt human reference genome for host‑read removal during QC. Because Bowtie2 index files are extremely large (often >100MB each), they are not stored in this repository.

Instead, the workflow includes:

- a dedicated script for downloading and organizing the index

- clear instructions for users to obtain the required files

- .gitignore rules to prevent committing large binaries

## Download Instructions

Run the following script to download and prepare the host genome index:

scripts/01_qc_host_removal.R

This script retrieves the GRCh38_noalt Bowtie2 index files and places them in:

data/raw/host_index/

These files are required for the host‑read removal step but are intentionally excluded from version control.

---

## Background

I’m an early-career microbiome data scientist focusing on maternal–infant health, early‑life microbial development, and gut–brain interactions. This pipeline reflects my ongoing work to build transparent, reproducible workflows aligned with real‑world maternal–infant microbiome datasets.

---

## Contact

**LinkedIn:** www.linkedin.com/in/elizabeth-thatcher-adams-986036250
**Email:** Elizabeth.Thatcher@live.com  
