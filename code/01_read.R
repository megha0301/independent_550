here::i_am("code/01_read.R")

library(dataverse)
library(readxl)
library(httr)


Sys.setenv("DATAVERSE_SERVER" = "dataverse.harvard.edu")
file_raw <- get_file_by_name(
  filename = "PCOS-HPOD-AMH.xlsx", 
  dataset  = "10.7910/DVN/ZFSUOO"
)

temp_file <- tempfile(fileext = ".xlsx")
writeBin(as.vector(file_raw), temp_file)

df <- read_excel(temp_file)
unlink(temp_file)


saveRDS(
  df,
  file = here::here("output/data_clean.rds")
)
