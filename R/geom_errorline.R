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

GeomErrorline <- ggproto("GeomErrorline", Geom,
                         default_aes = aes(colour = "black", size = 0.5, linetype = 1, width = 0.5,
                                           alpha = NA),

                         draw_key = draw_key_path,

                         required_aes = c("x", "ymin", "ymax"),

                         setup_data = function(data, params) {
                           data[order(data$PANEL, data$group, data$x), ]
                         },

                         draw_panel = function(data, panel_params, coord, width = NULL) {

                           d = tidyr::gather(select(data, -y), key = "minmax", value = "y", c(ymin, ymax)) %>%
                             dplyr::mutate(group = group * 2L, group = group - stringr::str_detect(minmax, "min"))

                           GeomPath$draw_panel(d,panel_params, coord)
                         }
)
