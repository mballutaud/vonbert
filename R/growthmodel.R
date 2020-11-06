#' VB growth model
#'
#' @param Linf
#' @param K
#' @param t0
#'
#' @return
#' @export
#'
#' @examples
growthmodel <- function(Linf, K, t0, a){
  Linf * (1 - exp(-K *(a - t0)))
}
