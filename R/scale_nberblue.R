nber_palette <- c("#0079C2", "#7AABDB")

#' NBER blue shades
#'
#' Color palette with 2 shades of blue if you want to be consistent with NBER's style.
#' @export

nber_pal <- function() { scales::manual_pal(nber_palette) }

#' Discrete color scale based on the NBER palette
#'
#' @inheritParams ggplot2::scale_colour_hue
#'
#' @return None
#'
#' @export
#' @rdname scale_nber

scale_color_nber <- function(...){
  discrete_scale("colour", "nber", nber_pal(), ...)
  }

#' @export
#' @rdname scale_nber

scale_colour_nber <- scale_color_nber

#' @export
#' @rdname scale_nber

scale_fill_nber <- function(...){
  discrete_scale("colour", "nber", nber_pal(), ...)
}

