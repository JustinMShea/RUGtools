#' New Member Counter
#' 
#' Generates sum of new members between each meetup.
#'
#' @return \code{new_mem_counter} returns a \code{\link{data.frame}} containing 2 variables. 
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
#'  # Plot the new members data since 2017.
#'  
#'  # Create Date Range Index
#'  Range <- new_members[new_members$Date > "2017-01-01" & new_members$Date <= Sys.Date(),]
#'  Date_Index <- as.numeric(row.names(Range))
#'  
#'  # Create x-axis labels, using year-month date format
#'  x_labels <- format(new_members$Date[Date_Index], "%Y-%m")
#'  
#'  # Plot
#'  barplot(new_members$New[Date_Index], names.arg = x_labels, las=2,
#'          main = "CRUG members, joined between meetups",  
#'          ylab = "New Members", xlab = "")
#'          
#' @export
new_mem_counter <- function(data) {
        
        Meetup_dates <- c(sort(unique(data$Last.Attended)), Sys.Date()-1)
        
        data <- data[,c("Joined.Group.on", "Member.ID")]
        
        #initialize data.frame
        new_df <- data.frame("Date"=Meetup_dates[1], "New"=0)
        
        for(i in (NROW(Meetup_dates)-1):1) {
                
                df <- subset(data, data$Joined.Group.on <= Meetup_dates[NROW(Meetup_dates)-(i-1)] &
                                     data$Joined.Group.on > Meetup_dates[NROW(Meetup_dates)-(i)])
                
                Date <- Meetup_dates[NROW(Meetup_dates)-(i-1)]
                New  <- max(df$Member.ID) - min(df$Member.ID)
                
                new_df <- rbind(new_df,data.frame(Date, New))
                
                
        }
        
        return(new_df) 
}
