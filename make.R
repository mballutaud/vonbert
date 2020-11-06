#!/usr/bin/env Rscript

# ----- clean workspace
rm(list = ls())

# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
devtools::load_all() #package installed and loaded



#------------load data


#------------run model


#-----------product article

rmarkdown::render(here::here("output","publication","ElsevierRBertalanffyPackage.Rmd"))

