#!/usr/bin/env Rscript

# ----- clean workspace
rm(list = ls())

# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
devtools::load_all() #package installed and loaded

#------------load data

#test <- "Please first choose a latin names or a vector containing latin names"
# espece <- c("Sphyrna lewini", "Thunnus albacares", "Mola mola")

espece <- get_fish_name()

#------------run model

data <- dataextract(espece)

#------------product plot
plots <- fishplot(data)
# saveplot(plots)

#-----------product article

rmarkdown::render(here::here("outputs","publication","ElsevierRBertalanffyPackage.Rmd"))

#-----------congratulations
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

gif<- magick::image_read(here::here("outputs","giphy.gif")) #gif

magick::image_read(here::here("outputs","giphy.gif")) #gif

