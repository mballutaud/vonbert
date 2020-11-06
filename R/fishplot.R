
#' Save plot
#'
#' @param plot ggplot2 object
#' @param name character
#' @param width
#' @param height
#' @param ext png, pdf, tiff,... (default is png)
#' @param ...
#'
#' @return
#' @export
#' @import ggplot2
#'
#' @examples
#'
saveplot <- function(plot, name, ext = "png",
                      width = 8, height = 6,
                      ...) {
  ggplot2::ggsave(plot = plot,
                  filename = here::here("output", "plots", paste0(name, ".", ext)),
                  width = width,
                  height = height,
                  ...)
}


#' Do plot by groups of fish with similar lengths
#'
#' @param data
#'
#' @return
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
fishplot <- function(data) {
  data <- dplyr::mutate(data, specie = as.factor(specie))
  # repartition des poissons en groupes selon leur taille maximale
    Echelle <- aggregate(data = data, length ~ specie, FUN = "max")
    Echelle <- dplyr::rename(Echelle, maxi = "length")
    Echelle$Class <- (Echelle$maxi - min(Echelle$maxi))/10
    Echelle <- dplyr::mutate(Echelle, Class = as.factor(Class))
    levels(Echelle$Class) <- 1:length(levels(Echelle$Class))
    data <- dplyr::left_join(data, Echelle, by= "specie")
    cust_labeller <- function(x) paste0("Size group:", levels(Echelle$Class))

  plots <- ggplot2::ggplot(data, aes(x = age,
        y = length,
        color = specie )) +
    geom_line() +
    facet_wrap(~Class, scales= "free_y", labeller = as_labeller(cust_labeller))+
       theme_bw() +
        xlab("Age of fish (years)")
       ylab("Estimated length (cm)")
  print(plots)
}
