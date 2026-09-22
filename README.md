# Maternal–Infant Shotgun Metagenomics Pipeline  
Reproducible workflow for maternal–infant microbiome analysis using MetaPhlAn + HUMAnN

This repository contains an end‑to‑end shotgun metagenomics pipeline focused on maternal–infant microbiome development, microbial transfer, and early‑life health insights. The workflow includes host‑read removal, taxonomic profiling (MetaPhlAn), functional pathway analysis (HUMAnN), compositional filtering, longitudinal modeling, and reproducible documentation.

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

## Background

I’m an early-career microbiome data scientist focusing on maternal–infant health, early‑life microbial development, and gut–brain interactions. This pipeline reflects my ongoing work to build transparent, reproducible workflows aligned with real‑world maternal–infant microbiome datasets.

---

## Contact

**LinkedIn:** www.linkedin.com/in/elizabeth-thatcher-adams-986036250
**Email:** Elizabeth.Thatcher@live.com  
