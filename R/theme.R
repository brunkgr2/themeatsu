#'Publication ready theme from ggpubr
#'@param base_size base font size given in pts
#'@param base_family base family
#'@param border logical if a border should be used
#'@param margin logical if margin should be used
#'@param legend location of legend placement
#'@param x.text.angle angle of x axis text
#'@param flip logical if x and y axis should be flipped
#'Basic theme for ATSU
#'@name theme_atsu
#'@rdname theme_atsu
#'@export
theme_atsu <- function (base_size = 15, base_family = "",
                        border = FALSE, margin = TRUE,
                        legend = c("top", "bottom", "left", "right", "none"),
                        x.text.angle = 0)
{
  half_line <- base_size/2
  if(!is.numeric(legend)) legend <- match.arg(legend)
  if(x.text.angle > 5) xhjust <- 1 else xhjust <- NULL

  if(border){
    panel.border <- ggplot2::element_rect(fill = NA, colour = "black", size = 0.7)
    axis.line <- ggplot2::element_blank()
  }
  else{
    panel.border <- ggplot2::element_blank()
    axis.line = ggplot2::element_line(colour = "black", size = 0.5)
  }


  if(margin)
    plot.margin <- margin(half_line, half_line, half_line,
                          half_line)
  else plot.margin <- ggplot2::unit(c(0.5,0.3,0.3,0.3),"mm")

  .theme <- ggplot2::theme_bw(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(panel.border = panel.border,
          panel.grid.major = ggplot2::element_blank(),
          panel.grid.minor = ggplot2::element_blank(),
          axis.line = axis.line,
          axis.text = ggplot2::element_text(color = "black"),
          legend.key = ggplot2::element_blank(),
          strip.background = ggplot2::element_rect(fill = atsu_cols("Light Blue"), color = "black", size = 0.7),
          plot.margin = plot.margin,
          legend.position = legend,
          complete = TRUE)

  if(x.text.angle!=0)
    .theme <- .theme + ggplot2::theme(axis.text.x = ggplot2::element_text(angle = x.text.angle, hjust = xhjust))

  .theme
}

#' ATSU clean theme
#' @rdname theme_atsu
#' @export
theme_atsu_clean <- function (base_size = 15, base_family = "", flip = FALSE)
{
  res <- ggplot2::theme_grey(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(fill = "white"),
      legend.background = ggplot2::element_rect(fill = "white"),
      legend.position = "top"

    )
  if(flip){
    res <- res + ggplot2::theme(
      panel.grid.major.x = ggplot2::element_line(linetype = "dotted", color = atsu_cols("Cool Gray 9")),
      axis.line.y = ggplot2::element_line(color = "black")
    )
  }
  else{
    res <- res + ggplot2::theme(
      panel.grid.major.y = ggplot2::element_line(linetype = "dotted", color = atsu_cols("Cool Gray 9"))
    )
  }
  res
}

#' Label theme
#' @rdname theme_atsu
#' @export
labs_atsu <- function(base_size = 15, base_family = ""){
  ggplot2::theme(
    text = ggplot2::element_text(family = base_family,
                        face = "plain", colour = "black", size = base_size, lineheight = 0.9,
                        hjust = 0.5, vjust = 0.5, angle = 0, margin = ggplot2::margin(),
                        debug = FALSE),
    # Tick labels
    axis.text.x = ggplot2::element_text(size = ggplot2::rel(0.86), colour = "black", face = "bold"),
    axis.text.y = ggplot2::element_text(size = ggplot2::rel(0.86), colour = "black", face = "bold"),

    # Axis labels
    axis.title = ggplot2::element_text(size = ggplot2::rel(1), colour = "black", face = "bold"),

    # Main title
    plot.title = ggplot2::element_text(size = ggplot2::rel(1), colour = "black" ,
                              lineheight=1.0, face = "bold"),
    legend.title = ggplot2::element_text(size = rel(0.7), face = "bold", colour = "black"),
    legend.text = ggplot2::element_text(size = rel(0.7), face = "plain", colour = "black")
  )
}

#' Add a clean theme
#' @export
#' @rdname theme_atsu
clean_theme <- function()
{
  ggplot2::theme(
    axis.line.x = ggplot2::element_blank(),
    axis.line.y = ggplot2::element_blank(),
    axis.text.x = ggplot2::element_blank(),
    axis.text.y = ggplot2::element_blank(),
    axis.ticks.x = ggplot2::element_blank(),
    axis.ticks.y = ggplot2::element_blank(),
    axis.title.x = ggplot2::element_blank(),
    axis.title.y = ggplot2::element_blank()
  )
}

#' Add clean table theme
#' @export
#' @rdname theme_atsu
clean_table_theme <- function ()
{
  ggplot2::theme(axis.line.x = ggplot2::element_blank(), axis.line.y = element_blank(),
        axis.text.x = ggplot2::element_blank(), axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank(), axis.title.x = ggplot2::element_blank(),
        axis.title.y = ggplot2::element_blank())
}
