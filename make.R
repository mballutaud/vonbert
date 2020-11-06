#!/usr/bin/env Rscript

# ----- clean workspace
rm(list = ls())


# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
devtools::load_all() #package installed and loaded


#------------load data
<<<<<<< HEAD
#test <- "Please first choose a latin names or a vector containing latin names"
#writeLines(text)
espece <- c("Sphyrna lewini", "Thunnus albacares", "Mola mola")

#------------run model
test <- dataextract(espece)
plotfish(test)
=======
espece <- "Salmo salar"
data <- dataextract(espece)

#------------product plot
fishplot(data)


>>>>>>> 1d18e94f00bae12b25390c9b5f1bde41c36c033d
#-----------product article

rmarkdown::render(here::here("outputs","publication","ElsevierRBertalanffyPackage.Rmd"))

