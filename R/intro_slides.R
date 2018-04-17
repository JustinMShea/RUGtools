#' Intro Slides
#'
#' Creates introductino slides markdown template
#' 
#' @param ... Arguments passed to \code{\link{ioslides_presentation}}.
#'
#'
#'@export
intro_slides <- function(...) {
  
  # get the locations of resource files located within the package
  logo <- system.file("rmarkdown/templates/intro_slides/skeleton/images/Rlogo436x338.png", package = "CRUGtools")
  
  # call the base html_document function
  rmarkdown::ioslides_presentation(widescreen = TRUE, logo = logo, ...)
  
}