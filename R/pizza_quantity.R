#' Estimate pizza quantity to order
#' 
#' How many pizzas should we order?
#' 
#' @return \code{pizza_quantity} returns a \code{\link{data.frame}} containing 4 variables. 
#' These are \code{registered, estimated_attendance, people_per_pizza, pizza_estimate}.
#' 
#' @param registered Integer of the number of people registered on Meetup.com
#' @param attend_rate Numeric of type double representing a percentage estimate 
#' of attendance. Defaults to 55 percent attendance, input 0.60.
#' @param pizza_diameter Interger representing diameter in inches of the largest 
#' pizza available. Defaults to 18 or 18 inces for an extra large
#' @param pizza_eat Integer representing square inches a member consumers.Defaults to 49 or 7 by 7 inches.
#' 
#' @examples
#' 
#' pizza_quantity(130, pizza_diameter=18, attend_rate=0.65)
#' 
#' @export
pizza_quantity <- 
function(registered, pizza_diameter=18, attend_rate=0.55, pizza_eat=49) {
        
        if(registered %% 1 != 0) {
        
        stop(paste("Argument 'registered' must be a whole number.", registered, "is not a whole number."))

  } else if(pizza_diameter %% 1 != 0) {
                
        stop(paste("Argument 'pizza_diameter' must be a whole number.", pizza_diameter, " is not a whole number."))
                
  } else if(attend_rate %% 1 == 0) {
        
        stop(paste("Argument 'attend_rate' must be a percentage expressed in decimal point form.", attend_rate, " is incorrect."))
        
        } else {
        
        estimated_attendance <- registered * attend_rate
        
        # Area of a circle
        pizza_area <- pi * (pizza_diameter/2)^2
        
        # Area/divided by square inches of pizza eaten per person
        people_per_pizza <- pizza_area / pizza_eat
        
        # return the number of pizza, rounded up
        pizza_estimate <- ceiling(estimated_attendance/people_per_pizza)
        
   }
        
        return(data.frame(registered, estimated_attendance, people_per_pizza, pizza_estimate))
        
}