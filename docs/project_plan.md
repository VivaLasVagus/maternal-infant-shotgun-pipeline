---
title: "Project Plan — Infant Gut Microbiome Analysis"
author: "Beth"
format:
  html:
    toc: true
    toc-depth: 3
---

# Overview

This project plan outlines the goals, structure, milestones, and deliverables for a maternal–infant microbiome analysis pipeline built entirely in R using curatedMetagenomicData. The project focuses on early‑life factors shaping the infant gut microbiome, including delivery mode, feeding type, and antibiotic exposure. A second project will extend this workflow to a disease‑focused infant cohort.

This plan reflects the pivot away from command‑line preprocessing and toward a stable, reproducible, profiling‑first workflow using MetaPhlAn3 and HUMAnN3 outputs provided by curatedMetagenomicData.

# 1. Scientific Motivation

Early‑life microbial development is shaped by multiple factors:

- Delivery mode (vaginal vs. C‑section)  
- Feeding type (breastfed vs. formula)  
- Antibiotic exposure  
- Environmental and maternal influences  

Understanding how these factors influence taxonomic composition, functional pathways, and ecological diversity is essential for maternal–infant health research and aligns closely with Tiny Health’s clinical interpretation framework.

This project aims to build a transparent, reproducible analysis pipeline that can be applied to multiple infant cohorts.

# 2. Dataset Description

The project uses curatedMetagenomicData, which provides:

- **MetaPhlAn3** species‑level relative abundance  
- **HUMAnN3** pathway abundance and coverage  
- Rich sample metadata  
- TreeSummarizedExperiment and SummarizedExperiment objects  

For Project B, we will select a **cross‑sectional infant gut cohort** with metadata covering:

- Delivery mode  
- Feeding type  
- Antibiotic exposure  

For Project C, we will select a **disease‑focused infant cohort** (e.g., NEC, allergies, eczema) to perform differential abundance and functional pathway comparisons.

# 3. Analysis Goals

## 3.1 Primary Goals (Project B)
- Characterize infant gut taxonomic composition  
- Compare diversity across early‑life factors  
- Visualize species‑level differences  
- Analyze functional pathways (HUMAnN3)  
- Build interpretable, publication‑style figures  
- Create a narrative aligned with maternal–infant health  

## 3.2 Secondary Goals (Project C)
- Identify taxonomic biomarkers associated with disease  
- Compare functional pathways between cases and controls  
- Perform differential abundance analysis  
- Build a clinical interpretation narrative  

# 4. Milestones

## 4.1 Project Setup
- Update README  
- Update project log  
- Finalize project plan  
- Create analysis notebooks  

## 4.2 Data Acquisition
- Load curatedMetagenomicData  
- Select infant cohort for Project B  
- Extract taxonomic and functional profiles  
- Convert to phyloseq/TSE objects  

## 4.3 Analysis Pipeline
- Metadata exploration  
- Alpha diversity  
- Beta diversity  
- Taxonomic composition  
- Functional pathway analysis  
- Early‑life factor comparisons  

## 4.4 Visualization
- Stacked barplots  
- Diversity boxplots  
- Ordination plots (PCoA/UMAP)  
- Heatmaps of functional pathways  
- Delivery/feeding/antibiotic comparison figures  

## 4.5 Interpretation & Reporting
- Summaries of findings  
- Biological interpretation  
- Clinical relevance  
- Final report or dashboard  

## 4.6 Expansion (Project C)
- Select disease cohort  
- Repeat pipeline  
- Differential abundance  
- Functional pathway contrasts  
- Clinical interpretation  

# 5. Deliverables

- Clean, reproducible R‑based pipeline  
- Quarto notebooks documenting analysis  
- Publication‑style figures and tables  
- Final report summarizing Project B  
- Second report for Project C  
- Portfolio‑ready GitHub repository  

# 6. Timeline

- **Week 1:** Documentation updates, dataset selection, notebook setup  
- **Week 2:** Taxonomic analysis + diversity metrics  
- **Week 3:** Functional pathway analysis + visualizations  
- **Week 4:** Interpretation + final report for Project B  
- **Week 5:** Begin Project C (disease cohort)  
- **Week 6:** Differential abundance + functional contrasts  
- **Week 7:** Final report for Project C  

# 7. Notes

- curatedMetagenomicData simplifies the workflow dramatically — no command‑line tools needed.  
- Keep metadata exploration early; it shapes the entire narrative.  
- Save intermediate objects (phyloseq/TSE) for reuse across projects.  
- Document decisions as you go in `project_log.qmd`.  
- Build reusable plotting functions to streamline Project C.  

