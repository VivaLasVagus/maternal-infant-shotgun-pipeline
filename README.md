# Microbiome Profiling & Analysis Project

This repository contains a fully R‑based microbiome analysis workflow built using **curatedMetagenomicData**, a large, high‑quality collection of 
MetaPhlAn3 and HUMAnN3 outputs from human microbiome studies. This project focuses on **infant gut microbiome analysis**, 
beginning with a cross‑sectional cohort and later expanding to a disease‑focused cohort.

No command‑line tools, preprocessing pipelines, or Ubuntu environments are required. 
All taxonomic and functional profiles are sourced directly from curatedMetagenomicData and analyzed in R using Quarto notebooks.

---

## Repository Structure

maternal-infant-shotgun-pipeline

data/
processed/    # MetaPhlAn3 + HUMAnN3 profiles loaded from curatedMetagenomicData

docs/
project_log.qmd      # Decision journal + pivot documentation
project_plan.qmd     # Project roadmap

notebooks/
02_infant_gut_cross_sectional.qmd   # Main analysis notebook (Project B)
03_infant_gut_disease.qmd           # Future analysis notebook (Project C)

scripts/
analysis/            # R functions for diversity, ordination, visualization

results/
figures/             # Plots generated during analysis
tables/              # Summary tables and exports


---

## Project Goals

- Analyze infant gut microbiome composition using MetaPhlAn3 profiles  
- Analyze functional pathways using HUMAnN3 outputs  
- Compare delivery mode, feeding type, and antibiotic exposure  
- Produce publication‑quality figures and tables  
- Build a portfolio‑ready microbiome project aligned with Tiny Health  
- Expand to a disease‑focused infant cohort 

---

## Project Evolution

This project originally included:

- FastQC / MultiQC
- Trimming
- Host removal
- Environment setup logs
- Intermediate preprocessing scripts

After encountering environment instability and recognizing that curatedMetagenomicData provides clean, ready‑to‑analyze MetaPhlAn3/HUMAnN3 outputs, the project pivoted toward a fully R‑based workflow.


All deprecated preprocessing folders and scripts were removed during the cleanup.

The full pivot reasoning is documented in:

docs/project_log.qmd

---

## Tools & Technologies

### **Data Source**
- curatedMetagenomicData (MetaPhlAn3 + HUMAnN3 outputs)

### **Analysis**
- R / RStudio  
- tidyverse  
- phyloseq  
- mia / TreeSummarizedExperiment  
- ggplot2  
- vegan  

### **Documentation**
- Quarto (.qmd)
- Markdown

---

## Workflow Overview

### **1. Load infant gut cohort from curatedMetagenomicData**
Includes:
- Species-level relative abundance (MetaPhlAn3)  
- Pathway abundance + coverage (HUMAnN3)  
- Rich metadata (delivery mode, feeding type, antibiotics)

### **2. Convert to phyloseq / TSE objects**
For ecological and statistical analysis.

### **3. Perform downstream analysis**
- Alpha diversity  
- Beta diversity  
- Taxonomic composition  
- Functional pathway analysis  
- Early-life factor comparisons  

### **4. Generate publication-quality figures**
Saved to `results/figures`.

### **5. Document everything**
Project log + Quarto notebooks.

---

## Dataset Choice  

This project uses the BackhedF_2015 infant gut shotgun metagenomics dataset, accessed through the curatedMetagenomicData R package. 
Backhed et al. (2015) is a foundational early‑life microbiome study containing well‑annotated stool samples from infants at birth, 4 months, 
and 12 months. Metadata includes delivery mode, feeding practice, antibiotic exposure, and age, making it well‑suited for cross‑sectional 
ecological analysis.

The dataset provides species‑level relative abundances and functional profiles generated using MetaPhlAn3 and HUMAnN3.

---

## Current Status

- Repo cleaned and reorganized  
- Pivot completed  
- curatedMetagenomicData selected as data source  
- Project (cross‑sectional infant gut) ready to begin
- Loaded infant gut cohort (BackhedF_2015)
- Completed Alpha Diversity modeling and plotting

---

## Next Steps

- Complete analysis of alpha diversity results
- Create narrative document with alpha diversity interpretation
- Begin beta diversity modeling, analysis, and interpretation
- Generate ordination plots (PCoA using Bray–Curtis)
- Run PERMANOVA tests for delivery mode, feeding practice, and antibiotics
- Begin taxonomic composition analysis (top taxa by timepoint + metadata group)
- Begin functional profiling analysis (HUMAnN pathways)
- Start drafting beta diversity + composition results
- Update project plan with new milestones as needed

---

## Background

Hello and thanks for being here!

I’m an early-career microbiome data scientist focusing on maternal–infant health, early‑life microbial development, and gut–brain interactions. 
This project represents the first major step in building my maternal–infant microbiome portfolio.

I did not start on this path with deep knowledge and expertise in biological or microbiome functionality. 
I found my way here while exploring the parasympathetic nervous system and the gut-brain connection, as it was a 
topic of interest in my studies within Developmental Psychology. Now that I've started research in this area, it's captivated me and this 
is the start of what I hope is a long journey in this field.

AI‑use disclosure: I use Copilot as a learning and productivity tool to explore concepts quickly, write scripts, and accelerate my understanding of microbiome analysis.

---

## Contact/Portfolio

**GitHub:** VivaLasVagus
**LinkedIn:** www.linkedin.com/in/elizabeth-thatcher-adams-986036250
**Email:** Elizabeth.Thatcher@live.com  
