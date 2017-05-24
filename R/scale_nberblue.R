# NBER blue shades
# "#0079C2" "#7AABDB"

nber_pal <- c("#0079C2", "#7AABDB")

pal_message = c("theme_nber: This scale only supports 2 values. If you have more than 2 values,
          I recommend against using the NBER's usual monochrome palette")

scale_color_nber <- function(){
  message(pal_message)
  scale_colour_manual(values = nber_pal)
}

scale_colour_nber <- scale_color_nber

scale_fill_nber <- function(){
  message(pal_message)
  scale_fill_manual(values = nber_pal)
}

