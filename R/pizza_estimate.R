#' Estimate pizza order
#' 
#' Function to compute how many pizzas to order based on arguments provided. 
#' Defaults to \strong{thin-crust} style.
#' 
#' 
#' @return \code{pizza_estimate} returns a \code{\link{data.frame}} containing 5 variables. 
#' These are \code{registered, est_attend, eaters_per_pizza, style, and the pizza_estimate}.
#' 
#' @param registered Integer. The number of people registered on Meetup.com
#' @param attend_rate Numeric of type double. The percentage estimate of attendance. 
#' Defaults to 60 percent attendance rate, expressed as \strong{0.60}.
#' @param pizza_diameter Integer. Diameter of the largest pizza available in inches. 
#' Defaults to 18 inches for an extra large pizza.
#' @param serving Integer or Numeric. Number of servings per person. 
#' Default is 2 and does not have to be a whole number. See references for methodology.
#' @param style Character vector of either "thincrust", "pan", or "deepdish". 
#' Defaults to Chicago "thincrust".
#' 
#' @references Lisa R. Young, Ph.D., R.D. \href{https://www.nestleusa.com/enjoypizza}{Nestle USA Site: Enjoy Pizza}
#' and \href{https://www.nestleusa.com/asset-library/documents/nutritionhealthwellness/pizza/pizzaportionguide_full.pdf}{PDF: The Fun of Pizza, the Balance of Good Nutrition, page 5.}
#' 
#' @examples
#' pizza_estimate(registered=150, pizza_diameter=18, attend_rate=0.60, serving = 2, 
#' style = "thincrust")
#' 
#' @export
pizza_estimate <- 
function(registered=120, pizza_diameter=18, attend_rate=0.60, serving = 2, style = "thincrust") {
        
        if(registered %% 1 != 0) {
        
        stop(paste("Argument 'registered' must be a whole number.", registered, "is not a whole number."))

  } else if(pizza_diameter %% 1 != 0) {
                
        stop(paste("Argument 'pizza_diameter' must be a whole number.", pizza_diameter, " is not a whole number."))
                
  } else if(attend_rate %% 1 == 0) {
        
        stop(paste("Argument 'attend_rate' must be a percentage expressed in decimal point form.", attend_rate, " is incorrect."))
        
  } else if(!style %in% c("thincrust", "pan", "deepdish")) {  
          
          stop(paste("Pizza 'style' must be either 'thincrust', 'pan', or 'deepdish'. ", "You input ",style))  
          
        } else {
        
        est_attend <- ceiling(registered * attend_rate)
        
        # Calculate area of a pizza
        pizza_area <- pi * (pizza_diameter/2)^2
        
        # 1 portion roughly the area of one's hand: 
        # https://www.nestleusa.com/enjoypizza
        # https://choosehandsafety.com/choosing-hand-tools/hand-tool-size 
        y <- 7.44 * 3.3
        x <- 6.77 * 2.9
        
        # Weight hand sizes by participation rate and multiply by number servings, 
        portion <- serving*(0.85*y + 0.15*x)
        
        # style grid, to adjust for style
        style_grid <- data.frame(style = c("thincrust", "pan", "deepdish"), mult = c(1, 0.77, 0.55))
 
        # Pizza Area/divided portion in square inches per person
        eaters_per_pizza <- (pizza_area / portion) / (style_grid[style_grid$style==style,2])
        
        # return the number of pizza, rounded up
        pizza_estimate <- ceiling(est_attend / eaters_per_pizza)
        
        }

        return(data.frame(registered, est_attend, eaters_per_pizza, style, pizza_estimate))

}        