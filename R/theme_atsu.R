atsu_colors <- c("ATSU Blue" = "#3487B7",
                 "Dark Blue" = "#172940",
                 "Light Blue" = "#63BEF2",
                 "Cool Gray 1" = "#f0f0f3",
                 "Cool Gray 9" = "#505053",
                 "Cool Gray 11" = "#303234")

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

atsu_palettes <- list(
  `main`  = atsu_cols("ATSU Blue", "Dark Blue", "Light Blue", "Cool Gray 1", "Cool Gray 9", "Cool Gray 11"),
  `blues` = atsu_cols("ATSU Blue", "Dark Blue", "Light Blue"),
  `grays` = atsu_cols("Cool Gray 1", "Cool Gray 9", "Cool Gray 11")
)

#' Return function to interpolate a atsu color palette
#'
#' @param palette Character name of palette in atsu_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
atsu_pal <- function(palette, reverse, ...) {
  pal <- atsu_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale constructor for atsu colors
#'
#' @param palette Character name of palette in atsu_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'

scale_color_atsu <- function(palette, discrete, reverse, ...) {
  pal <- atsu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("atsu_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
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
scale_fill_atsu <- function(palette, discrete, reverse , ...) {
  pal <- atsu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("atsu_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
