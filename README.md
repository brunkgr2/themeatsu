
<!-- README.md is generated from README.Rmd. Please edit that file -->

# themeatsu

<!-- badges: start -->
<!-- badges: end -->

The goal of themeatsu is to create a standard theme for statistical
analysis reports done at AT Still University department of Research
Support.

## Installation

You can install the development version of themeatsu from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("brunkgr2/themeatsu")
```

## Example

This is a basic example which shows you how to use ATSU colors:

``` r
library(themeatsu)
options(scipen=999)
library(ggplot2)
data("midwest", package = "ggplot2")
theme_set(theme_atsu())
gm <- ggplot(midwest, aes(x=area, y=poptotal)) + 
     geom_point(aes(col=state, size=popdensity)) + 
     geom_smooth(method="loess", se=F) + xlim(c(0, 0.1)) + ylim(c(0, 500000)) + 
     labs(title="Area Vs Population", y="Population", x="Area", caption="Source: midwest") +
 scale_color_atsu(palette = "main", discrete = TRUE, reverse = FALSE)

plot(gm)
#> `geom_smooth()` using formula 'y ~ x'
#> Warning: Removed 15 rows containing non-finite values (stat_smooth).
#> Warning: Removed 15 rows containing missing values (geom_point).
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
gb <- ggplot(midwest, aes(x=area, y=poptotal)) + 
     geom_point(aes(col=state, size=popdensity)) + 
     geom_smooth(method="loess", se=F) + xlim(c(0, 0.1)) + ylim(c(0, 500000)) + 
     labs(title="Area Vs Population", y="Population", x="Area", caption="Source: midwest") +
 scale_color_atsu(palette = "blues", discrete = TRUE, reverse = FALSE)

plot(gb)
#> `geom_smooth()` using formula 'y ~ x'
#> Warning: Removed 15 rows containing non-finite values (stat_smooth).

#> Warning: Removed 15 rows containing missing values (geom_point).
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
     geom_point(aes(col=state, size=popdensity)) + 
     geom_smooth(method="loess", se=F) + xlim(c(0, 0.1)) + ylim(c(0, 500000)) + 
     labs(title="Area Vs Population", y="Population", x="Area", caption="Source: midwest") +
 scale_color_atsu(palette = "grays", discrete = TRUE, reverse = FALSE)

plot(gg)
#> `geom_smooth()` using formula 'y ~ x'
#> Warning: Removed 15 rows containing non-finite values (stat_smooth).

#> Warning: Removed 15 rows containing missing values (geom_point).
```

<img src="man/figures/README-example-3.png" width="100%" />
