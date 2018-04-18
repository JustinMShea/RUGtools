#' New Member Counter
#' 
#' Generates totals of new members between each meetup
#'
#' @return\code{new_mem_counter} returns a \code{\link{data.frame}} containing 2 variables. 
#' These are the `Date` of each meetup, and how many `New` members joined leading up to each 
#' meetup.
#' 
#' @param data A \code{\link{data.frame}} created by exporting the members list from meetup.com.
#'  Note: All date fields must by coverted to class \code{\link{Date}}.
#'
#' @examples
#'  data(member_list)
#' 
#'  new_members <- new_mem_counter(member_list)
#'  
#'  tail(new_members)
#'  
#' @export
new_mem_counter <- function(data) {
        
        Meetup_dates <- c(sort(unique(data$Last.Attended)), Sys.Date()-1)
        
        data <- data[,c("Joined.Group.on", "Count.Index")]
        
        #initialize data.frame
        new_df <- data.frame("Date"=Meetup_dates[1], "New"=0)
        
        for(i in (NROW(Meetup_dates)-1):1) {
                
                df <- subset(data, data$Joined.Group.on <= Meetup_dates[NROW(Meetup_dates)-(i-1)] &
                                     data$Joined.Group.on > Meetup_dates[NROW(Meetup_dates)-(i)])
                
                Date <- Meetup_dates[NROW(Meetup_dates)-(i-1)]
                New  <- max(df$Count.Index) - min(df$Count.Index)
                
                new_df <- rbind(new_df,data.frame(Date, New))
                
                
        }
        
        return(new_df) 
}
