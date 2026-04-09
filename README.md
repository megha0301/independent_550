---
title: "PCOS-HPOD-AMH Project"
author: "Megha Patel"
date: "03-25-26"
---


## Initial Code Description
This dataset looks at ovarian function measures in normogonadotropic anovulation and subclinical hypothyroidism. 

`code/01_read.R`
  - reading and cleaning of dataset

`code/02_table.R`
  - creates table 1
  - saves table 1 as `.rds` in `output/` folder

`code/03_figure.R`
  - creates boxplot
  - saves boxplot as `.rds` in `output/`
  
`code/04_render.R`
  - renders `MP_project_4.Rmd`
  
`MP_project_4.Rmd`
  - reads data table and figure in 
  - compiles a readable report with table and figure descriptions

`Makefile`
  - contains rules for report building
  - `make ` will generate the two `.rds` files needed for the report
  - `make install` will update your packages 