#' R User Group Introduction Slides
#'
#' This function creates an ioslides rmarkdown template, with default content useful
#' for introducing \strong{Chicago R user group} meetups. Slides can be accessed 
#' from within RStudio using the \strong{New R Markdown} dialog menu, and then 
#' selecting \strong{From Template}. One can also use the `draft` function, 
#' exemplified in the Examples section below.
#' 
#' @param ... Arguments passed to rmarkdown::ioslides_presentation function.
#' 
#' @examples
#' rmarkdown::draft(file="new_meetup.Rmd", template = "inst/rmarkdown/templates/intro_slides")
#' 
#'@export
intro_slides <- function(...) {
  
  # get the locations of resource files located within the package
  logo <- system.file("rmarkdown/templates/intro_slides/skeleton/images/Rlogo436x338.png", package = "CRUGtools")
  
  # call the base html_document function
  rmarkdown::ioslides_presentation(widescreen = TRUE, logo = logo, ...)
  
}