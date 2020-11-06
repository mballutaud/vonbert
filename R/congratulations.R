#' Function to play the song and gif
#'
#' @param freq
#' @param duration
#' @param make_sine
#' @param starwars
#'
#' @return
#' @export
#'
#' @examples

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
