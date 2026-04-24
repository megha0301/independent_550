FROM rocker/tidyverse:4.5.1

RUN apt-get update && apt-get install -y pandoc libuv1

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
COPY code code
COPY Makefile .
COPY MP_project_4.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt=FALSE)"
RUN Rscript -e "renv::snapshot(type='all', prompt=FALSE)"

RUN mkdir report

CMD make && mv MP_project_4.html report/