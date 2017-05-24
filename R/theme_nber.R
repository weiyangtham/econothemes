#' A ggplot theme based on the NBER's Digest and Reporter graphs

theme_nber <- function(base_size = 11, base_family = ""){
  half_line <- base_size/2
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    theme(
      rect = element_rect(fill = "#F7F8FC", colour = "#F7F8FC", size = 0.5, linetype = 1),
      text =
        element_text(family = base_family, face = "plain", colour = "#4C4D4F",
                     size = base_size, lineheight = 0.9,
                     hjust = 0.5, vjust = 0.5, angle = 0, margin = margin(), debug = FALSE),
      panel.background = element_rect(fill = "#F7F8FC", colour = NA),
      panel.border = element_blank(),
      plot.background = element_rect(fill = "#F7F8FC"),
      # panel.border = element_rect(fill = NA, colour = "grey20"),
      panel.grid.major.y = element_line(colour = "grey92"),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      legend.key = element_rect(colour = NA),
      axis.line.x = element_line(colour = "black", size = 0.5, linetype = 1, lineend = "butt"),
      plot.title = element_text(colour = "grey30", face = "bold", size = rel(1.2), hjust = 0,
                                vjust = 1, margin = margin(b = half_line * 1.2)),
      plot.subtitle = element_text(size = rel(0.9), hjust = 0, vjust = 1,
                                   margin = margin(b = half_line * 0.9)))
}
