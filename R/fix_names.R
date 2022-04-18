#' A function to remove unwanted characters in a character vector
#'
#'@param x Character vector to be changed
#'@param patterns Character vector of patterns to find given as c("pattern")
#'@param replacements Character vector of replacements for patterns given as c("replacements")
#'@param case Character vector of either "lower" or "upper" for the output case
#'


fix_names <- function(x, patterns, replacements, case){

  x <- stringi::stri_replace_all_fixed(x,
                                       pattern = patterns,
                                       replacement = replacements,
                                       vectorize_all = FALSE)

  if(case == "lower") {
    x <- tolower(x)
  }
  else {
    x <- toupper(x)
  }

}
