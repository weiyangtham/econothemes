# NBER blue shades
# "#0079C2" "#7AABDB"

nber_pal <- c("#0079C2", "#7AABDB")

scale_color_nber <- function(){
  scale_colour_manual(values = nber_pal)
}

scale_colour_nber <- scale_color_stata

scale_fill_nber <- function(){
  scale_fill_manual(values = nber_pal)
}

