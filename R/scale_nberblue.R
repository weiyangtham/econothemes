#' NBER blue shades

nber_palette = c("#0079C2", "#7AABDB")

nber_pal <- function() { scales::manual_pal(nber_palette) }

# pal_message = c("theme_nber: This scale only supports 2 values. If you have more than 2 values,
          # I recommend against using the NBER's usual monochrome palette")

scale_color_nber <- function(...){
  # message(pal_message)
  discrete_scale("colour", "nber", nber_pal(), ...)
  }

scale_colour_nber <- scale_color_nber

scale_fill_nber <- function(){
  # message(pal_message)
  discrete_scale("colour", "nber", nber_pal(), ...)
}

