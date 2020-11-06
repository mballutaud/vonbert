#!/usr/bin/env Rscript

# ----- clean workspace
rm(list = ls())


# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
devtools::load_all() #package installed and loaded


#------------load data
#test <- "Please first choose a latin names or a vector containing latin names"
#writeLines(text)
espece <- c("Sphyrna lewini", "Thunnus albacares", "Mola mola")

#------------run model
test <- dataextract(espece)
plotfish(test)
#-----------product article
