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
#' \dontrun{
#' member_file_path <- system.file("extdata", "ChicagoRUG_Member_List_on_04-09-18.csv", 
#'                                  package = "CRUGtools", mustWork = TRUE)
#' 
#' member_list <- read.csv(member_file_path, stringsAsFactors=FALSE)
#' 
#'  # Convert date columns of type char to type 'Date'.
#'  member_list$Joined.Group.on <- as.Date.character(member_list$Joined.Group.on, format = "%m/%d/%Y")
#'  member_list$Last.Attended <- as.Date.character(member_list$Last.Attended, format = "%m/%d/%Y")
#' 
#'  new_members <- new_mem_counter(member_list)
#'  }
#'  
#' @export
new_mem_counter <- function(data) {
        
        Meetup_dates <- c(sort(unique(data$Last.Attended)), Sys.Date()-1)
        
        data <- data[,c("Joined.Group.on", "count_index")]
        
        #initialize data.frame
        new_df <- data.frame("Date"=Meetup_dates[1], "New"=0)
        
        for(i in (NROW(Meetup_dates)-1):1) {
                
                df <- subset(data, data$Joined.Group.on <= Meetup_dates[NROW(Meetup_dates)-(i-1)] &
                                     data$Joined.Group.on > Meetup_dates[NROW(Meetup_dates)-(i)])
                
                Date <- Meetup_dates[NROW(Meetup_dates)-(i-1)]
                New  <- max(df$count_index) - min(df$count_index)
                
                new_df <- rbind(new_df,data.frame(Date, New))
                
                
        }
        
        return(new_df) 
}
