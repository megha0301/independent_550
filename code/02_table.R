here::i_am("code/02_table.R")

df <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(dplyr)
library(gtsummary)
vars <- c("Age [years]","Weight [kg]", "Height [cm]","HOMA-IR", "Phenotype A", "Phenotype B", "Phenotype D", "HPOD")
cat_vars <- c("Phenotype A", "Phenotype B", "Phenotype D", "HPOD")

cols_to_fix <- c("HPOD", "Phenotype A", "Phenotype B", "Phenotype D")

df_table <- df %>%
  mutate(across(all_of(cols_to_fix), 
                ~factor(.x, levels = c(0, 1), labels = c("No", "Yes")))) %>%
  select(all_of(vars))

t1 <- df_table %>%
  tbl_summary(
    type = list(all_of(cat_vars) ~ "categorical"),
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",   
      all_categorical() ~ "{n} ({p}%)"
    ),
    digits = all_continuous() ~ 2,          
    missing = "ifany"                     
  ) %>%
  bold_labels() %>%
  modify_header(label = "**Table 1**")

saveRDS(
  t1,
  file = here::here("output/table_one.rds")
)
