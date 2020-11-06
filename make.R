#!/usr/bin/env Rscript

# ----- clean workspace
rm(list = ls())

# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
devtools::load_all() #package installed and loaded
# tips for LINUX: if you have 'error in configuration' for installing package 'magick' with Ubuntu 20.04.1 LTS
# paste this command in your terminal: sudo apt install libmagick++-dev

#------------run list of fish species in csv and function to select species
espece <- get_fish_name()

#------------run function to extract data for selected species from FishBase
data <- dataextract(espece)

#------------product plot of growth curve using VB model
plots <- fishplot(data)
# saveplot(plots)

#-----------product article in format of Elsevier
rmarkdown::render(here::here("outputs","publication","ElsevierRBertalanffyPackage.Rmd"))

#-----------congratulations for the job!
starwars <- dplyr::tibble(pitch = strsplit(pitch, " ")[[1]],
                          duration = duration)
starwars <- starwars %>%
  dplyr::mutate(octave = substring(pitch, nchar(pitch))  %>%
                  {suppressWarnings(as.numeric(.))} %>%
                  ifelse(is.na(.), 4, .),
                note = notes[substr(pitch, 1, 1)],
                note = note + grepl("#", pitch) -
                  grepl("b", pitch) + octave * 12 +
                  12 * (note < 3),
                freq = 2 ^ ((note - 60) / 12) * 440)

starwars_wave <- mapply(make_sine, starwars$freq, starwars$duration) %>%
  do.call("c", .)
audio::play(starwars_wave) #song
magick::image_read(here::here("outputs","giphy.gif")) #gif

