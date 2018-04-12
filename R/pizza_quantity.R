#' Estimate pizza order
#' 
#' Function to compute how many pizzas we should order based on arguements provided.
#' 
#' @return \code{pizza_quantity} returns a \code{\link{data.frame}} containing 4 variables. 
#' These are \code{registered, estimated_attendance, people_per_pizza, and the pizza_estimate}.
#' 
#' @param registered Integer. The number of people registered on Meetup.com
#' @param attend_rate Numeric of type double. The percentage estimate of attendance. 
#' Defaults to 60 percent attendance rate, expressed as \strong{0.60}.
#' @param pizza_diameter Integer. Diameter of the largest pizza available in inches. 
#' Defaults to 18 inches for an extra large pizza.
#' @param serving Integer or Numeric. Number of servings per person. 
#' Default is 2 and does not have to be a whole number. See references for methodology.
#' 
#' @references Lisa R. Young, Ph.D., R.D. \href{https://www.nestleusa.com/enjoypizza}{Nestle USA Site: Enjoy Pizza}
#' and \href{https://www.nestleusa.com/asset-library/documents/nutritionhealthwellness/pizza/pizzaportionguide_full.pdf}{PDF: The Fun of Pizza, the Balance of Good Nutrition, page 5.}
#' 
#' @examples
#' pizza_quantity(registered=150, pizza_diameter=18, attend_rate=0.65, serving = 2)
#' 
#' @export
pizza_quantity <- 
function(registered=120, pizza_diameter=18, attend_rate=0.60, serving = 2) {
        
        if(registered %% 1 != 0) {
        
        stop(paste("Argument 'registered' must be a whole number.", registered, "is not a whole number."))

  } else if(pizza_diameter %% 1 != 0) {
                
        stop(paste("Argument 'pizza_diameter' must be a whole number.", pizza_diameter, " is not a whole number."))
                
  } else if(attend_rate %% 1 == 0) {
        
        stop(paste("Argument 'attend_rate' must be a percentage expressed in decimal point form.", attend_rate, " is incorrect."))
        
        } else {
        
        estimated_attendance <- ceiling(registered * attend_rate)
        
        # Area of a circle
        pizza_area <- pi * (pizza_diameter/2)^2
        
        
        # 1 portion roughly the area of one's hand: https://www.nestleusa.com/enjoypizza
        # Calculate average hand area for men and women, then average them by attendance. 
        # multiply by how many servings. Default serving is 2.
        male_size <- 7.44 * 3.3
        female_size <- 6.77 * 2.91
        pizza_eat <- serving * (0.85*male_size + 0.15*female_size)
        
        # Area/divided by square inches of pizza eaten per person
        people_per_pizza <- pizza_area / pizza_eat
        
        # return the number of pizza, rounded up
        pizza_estimate <- ceiling(estimated_attendance/people_per_pizza)
        
   }
        
        return(data.frame(registered, estimated_attendance, people_per_pizza, pizza_estimate))
        
}