#report rules
MP_project_4.html: code/04_render.R MP_project_4.Rmd components
	Rscript code/04_render.R


output/data_clean.rds: code/01_read.R
	Rscript code/01_read.R

output/table_one.rds: code/01_read.R output/data_clean.rds
	Rscript code/02_table.R
	
output/boxplot.png: code/01_read.R output/data_clean.rds code/03_figure.R
	Rscript code/03_figure.R
	
.PHONY: components
components: output/table_one.rds output/boxplot.png

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
#docker rules
project_image:
	docker build -t project_image .
	touch $@

report/MP_project_4.html:
	mkdir -p report
	docker run -v "/$$(pwd)/report:/project/report" project_image