#!/usr/bin/env Rscript

# ----- clean workspace
rm(list = ls())

# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
devtools::load_all() #package installed and loaded

#------------load data
espece <- "Salmo salar"
data <- dataextract(espece)

#------------product plot
fishplot(data)


#-----------product article

rmarkdown::render(here::here("outputs","publication","ElsevierRBertalanffyPackage.Rmd"))

