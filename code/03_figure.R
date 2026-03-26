here::i_am("code/03_figure.R")
df <- readRDS(
  file = here::here("output/data_clean.rds")
)


df$phenotype <- ifelse(df$`Phenotype A`==1, 'A', 
                       ifelse(df$`Phenotype B`==1, 'B',
                              ifelse(df$`Phenotype D`==1, 'D', NA)))

png("output/boxplot.png", width = 6, height=6,  units = "in", res = 300)

plot <- boxplot(df$`HOMA-IR`~df$phenotype, ylim = c(0, 20),main="HOMA-IR by PCOS Phenotype",xlab="PCOS Phenotype", ylab="HOMA-IR")
axis(side = 2, 
     at = c(2.5), labels=c("Insulin Resistant"))

dev.off()
