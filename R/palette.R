#' Create atsu colors from hex codes
atsu_colors <- c("ATSU Blue" = "#3487B7",
                 "Dark Blue" = "#172940",
                 "Light Blue" = "#63BEF2",
                 "Cool Gray 1" = "#f0f0f3",
                 "Cool Gray 9" = "#505053",
                 "Cool Gray 11" = "#303234",
                 "Royal Purple" = "#512888",
                 "Cat Light Gray" = "#D1D1D1",
                 "Cat Gray" = "#A7A7A7",
                 "White" = "#FFFFFF",
                 "Black" = "#000000",
                 "Good Land Green" = "#00471B",
                 "Cream City Cream" = "#EEE1C6",
                 "Great Lakes Blue" = "#0077C0",
                 "Red" = "#AC1A2F",
                 "Hunter Green" = "#274E37",
                 "Gray" = "#95999D",
                 "MKE Purple" = "#702F8A",
                 "Silver" = "#8A8D8F",
                 "Retro Green" = "#009429",
                 "Retro Brown" = "#F7A500",
                 "Royal Blue" = "#004687",
                 "Royal Gold" = "#BD9B60",
                 "Blue" = "#001489",
                 "Dark Gold" = "#85714D",
                 "Wheat" = "#FFD451",
                 "CK Red" = "#E31837",
                 "CK Gold" = "#FFB81C",
                 "Packer Green" = "#203731",
                 "Packer Gold" = "#FFB612",
                 "Sporting Blue" = "#91B0D5",
                 "Dark Indigo" = "#002F65",
                 "Lead" = "#999999",
                 "Pens Gold" = "#CFC493",
                 "Yellow" = "#FCB514",
                 "Burgundy" = "#6F263D",
                 "Avs Blue" = "#236192"
                 )

#' Function to extract atsu colors as hex codes
#'
#' @param ... Character names of atsu_colors
#'
atsu_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (atsu_colors)

  atsu_colors[cols]
}

#' Create custom palettes using ATSU colors
atsu_palettes <- list(
  `atsu`  = atsu_cols("ATSU Blue", "Dark Blue", "Light Blue", "Cool Gray 1", "Cool Gray 9", "Cool Gray 11"),
  `blues` = atsu_cols("ATSU Blue", "Dark Blue", "Light Blue", "Royal Blue",
                      "Sporting Blue", "Dark Indigo", "Avs Blue", "Blue", "Great Lakes Blue"),
  `grays` = atsu_cols("Cool Gray 1", "Cool Gray 9", "Cool Gray 11", "Cat Light Gray",
                      "Cat Gray", "White", "Black", "Gray", "Silver", "Lead"),
  `mke` = atsu_cols("Good Land Green", "Cream City Cream",
                    "Great Lakes Blue", "Red", "Hunter Green", "Gray",
                    "MKE Purple", "Silver", "Retro Green", "Retro Brown", "Blue",
                    "Dark Gold", "Wheat", "Packer Green", "Packer Gold"),
  `kc` = atsu_cols("Royal Purple", "Cats Light Gray", "Cat Gray", "RK Red", "RK Gold",
                   "Royal Blue", "Royal Gold", "Sporting Blue", "Dark Indigo", "Lead"),
  `main` = atsu_cols("ATSU Blue", "Dark Blue", "Light Blue", "Cool Gray1", "Cool Gray 9", "Cool Gray 11",
                     "Royal Purple", "Cat Light Gray", "Cat Gray", "White", "Black", "Good Land Green",
                     "Cream City Cream", "Great Lakes Blue", "Red", "Hunter Green", "Gray", "MKE Purple",
                     "Silver", "Retro Green", "Retro Brown", "Royal Blue", "Royal Gold", "Blue", "Dark Gold",
                     "Wheat", "CK Red", "CK Gold", "Packer Green", "Packer Gold", "Sporting Blue",
                     "Dark Indigo", "Lead", "Pens Gold", "Yellow", "Burgundy", "Avs Blue")
)

#' Return function to interpolate a atsu color palette
#'
#' @param palette Character name of palette in atsu_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
atsu_pal <- function(palette, discrete, reverse, ...) {
  pal <- atsu_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

#' Function to randomly select n colors from atsu_cols
#'
#' @param n Numeric value of length of colors to sample
#'

rand_pal <- function(n) {
  sample(as.data.frame(atsu_cols)[,1], n, replace = F)
}

#' Color scale constructor for atsu colors
#'
#' @param palette Character name of palette in atsu_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'

scale_color_atsu <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- atsu_pal(palette = palette, discrete = discrete, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("atsu_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}


#' Fill scale constructor for atsu colors
#'
#' @param palette Character name of palette in atsu_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_atsu <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- atsu_pal(palette = palette, discrete = discrete, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("atsu_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
