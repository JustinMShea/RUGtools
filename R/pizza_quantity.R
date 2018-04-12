#' Estimate pizza quantity to order
#' 
#' How many pizzas should we order?
#' 
#' @param registered Integer of the number of people registered on Meetup.com
#' 
#' @param attend_rate Numeric of type double representing a percentage 
#'  estimate of attedance. Defaults to 60% attendance, input 0.60.
#'  
#' @param pizza_diameter Interger representing diameter in inches of the largest pizza available.
#'  Defaults to 18 or 18 inces for an extra large
#'  
#' @param pizza_eat Integer representing square inches a member consumers.
#'  Deafults to 49 or 7 x 7 inches of square pizza which is roughly two traditional slices 
#'  of an extra-large pizza cut in 10 slices each with a sector area of (5.65 x 9). 
#' 
#' @example 
#' 
#' pizza_estimate(registered = 120, pizza_diamter = 18)
#' 
#' @export
pizza_quantity <- function(registered, pizza_diameter = 18, attend_rate = 0.50, pizza_eat = 49){
        
        # check to make sure registered and pizza_diamter are entered as whole numbers.
        if(registered %% 1 != 0) {
        
        stop(paste("Argument 'registered' must be a whole number.", registered, " is not a whole number."))

} else if(pizza_diameter %% 1 != 0) {
                
        stop(paste("Argument 'pizza_diameter' must be a whole number.", pizza_diameter, " is not a whole number."))
                
        # check to make sure registered and attend_rate is not entered as a whole numbers.
} else if(attend_rate %% 1 == 0) {
        
        stop(paste("Argument 'attend_rate' must be a percentage expressed in decimal point form.", attend_rate, " is incorrect."))
        
        } else {
        
        estimated_attendance <- registered * attend_rate
        
        # Area of a circle
        pizza_area <- pi * (pizza_diameter/2)^2
        
        # Area/divided by square inches of pizza eaten per person
        people_per_pizza <- pizza_area/pizza_eat
        
        # return the number of pizza, rounded up
        pizza_estimate <- ceiling(estimated_attendance/people_per_pizza)
        
        }
        
        return(data.frame(registered, estimated_attendance, people_per_pizza, pizza_estimate))
        
}

        