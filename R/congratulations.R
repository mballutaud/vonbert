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

make_sine <- function(freq, duration) {
  wave <- sin(seq(0, duration / tempo * 60, 1 / sample_rate) *
                freq * 2 * pi)
  fade <- seq(0, 1, 50 / sample_rate)
  wave * c(fade, rep(1, length(wave) - 2 * length(fade)), rev(fade))
}
starwars_wave <- mapply(make_sine, starwars$freq, starwars$duration) %>%
  do.call("c", .)
audio::play(starwars_wave) #song
magick::image_read("giphy.gif") #gif
