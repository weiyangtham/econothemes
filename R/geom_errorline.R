#' Intervals with upper and lower bounds as separate lines
#'
#' Intervals are defined by `x`, `ymin`, and `ymax`.
#'
#' @inheritParams layer
#'
#' @export
#'
#' @examples
#'
#' df = data.frame(year = 2001:2003, upper = c(1, 1.5, 1.6), lower = c(1, 0.9, 0.8))
#'
#' ggplot(df, aes(x = year, ymin = lower, ymax = upper)) + geom_errorline()


geom_errorline <- function(mapping = NULL, data = NULL,
                           stat = "identity", position = "identity",
                           ...,
                           na.rm = FALSE,
                           show.legend = NA,
                           inherit.aes = TRUE) {
  layer(
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

#' @rdname ggplot2-ggproto
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
                             data = select(data, -y)
                           }

                           d = tidyr::gather(data, key = "minmax", value = "y", c(ymin, ymax)) %>%
                             mutate(group = group * 2L, group = group - stringr::str_detect(minmax, "min"))


                           ggplot2::GeomPath$draw_panel(d,panel_params, coord)
                         }
)
