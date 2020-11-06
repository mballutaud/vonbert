#' Function to play the song and gif
#'
#' @param freq
#' @param duration
#'
#' @return
#' @export
#' @import dplyr
#' @import magick
#'
#' @examples

make_sine <- function(freq, duration) {
  wave <- sin(seq(0, duration / tempo * 60, 1 / sample_rate) *
                freq * 2 * pi)
  fade <- seq(0, 1, 50 / sample_rate)
  wave * c(fade, rep(1, length(wave) - 2 * length(fade)), rev(fade))
}
