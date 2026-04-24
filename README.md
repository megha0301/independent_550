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

## Building the Report: Via Docker or Manually

`Makefile`
  Rules for Docker automation
  - `make project_image` will build the project image from the hub [https://hub.docker.com/layers/megha0301/project_image/individual/images/sha256:260584b8b4998154d45dd6dd0740a86526da75419e24c829de12f3f66853f8d4?uuid=C3260065-F3E5-435A-B43D-F9BFF60FABC7]
  - `make report/MP_project_4.html` will run the automated version of the report and hold it in the report folder
    - this will run on Windows file paths
  Manual build without using Docker
  - contains rules for report building
  - `make install` will update your packages 
  - `make ` will generate the two `.rds` files needed for the report and house the report in the general folder
