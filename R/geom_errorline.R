#' Intervals with upper and lower bounds as separate lines
#'
#' Intervals are defined by `x`, `ymin`, and `ymax`.
#'
#' @inheritParams ggplot2::layer
#'
#' @export
#'
#' @examples
#' df = data.frame(x = 0:2, y = c(0, 0.5, 1), lower = c(0.1, 0.7, 1.3), upper = c(-0.1, 0.4, 0.9))
#'
#' ggplot(df, aes(x, y, ymin = lower, ymax = upper)) +
#' geom_line() + geom_errorline(linetype = 2)

geom_errorline <- function(mapping = NULL, data = NULL,
                           stat = "identity", position = "identity",
                           ...,
                           na.rm = FALSE,
                           show.legend = NA,
                           inherit.aes = TRUE) {
  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomErrorline,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}

#' Geom Proto
#'
#' @format NULL
#' @usage NULL
#' @export

GeomErrorline <- ggplot2::ggproto("GeomErrorline", ggplot2::Geom,
                         default_aes = ggplot2::aes(colour = "black", size = 0.5, linetype = 1, width = 0.5,
                                           alpha = NA),

                         draw_key = ggplot2::draw_key_path,

                         required_aes = c("x", "ymin", "ymax"),

                         setup_data = function(data, params) {
                           data[order(data$PANEL, data$group, data$x), ]
                         },

                         draw_panel = function(data, panel_params, coord, width = NULL) {

                           if ("y" %in% names(data)){
                             data = data[!names(data) %in% "y"]
                           }

                           d = tidyr::gather(data, key = "minmax", value = "y", c(ymin, ymax)) %>%
                             dplyr::mutate(group = group * 2L, group = group - stringr::str_detect(minmax, "min"))


                           ggplot2::GeomPath$draw_panel(d,panel_params, coord)
                         }
)
