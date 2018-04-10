  ############### 
 # Data Import #
############### 
 
  # assumes manual download of .xls file to the data folder of your working directory
 # also assumes you saved it as .csv, not the default .xls
member_file_path <- paste0(getwd(),"/data/ChicagoRUG_Member_List_on_04-09-18.csv")

member_list <- read.csv(member_file_path, stringsAsFactors=FALSE)

  #########################
 # Data Clean and Format #
#########################

 # Convert dates of charachter type to Date
member_list$Joined.Group.on <- as.Date.character(member_list$Joined.Group.on, format = "%m/%d/%Y")
member_list$Last.visited.group.on <- as.Date.character(member_list$Last.visited.group.on, format = "%m/%d/%Y")
member_list$Last.Attended <- as.Date.character(member_list$Last.Attended, format = "%m/%d/%Y")

# convert binary responses into factors
member_list$Intro <- as.factor(member_list$Intro)
member_list$Photo <- as.factor(member_list$Photo)
member_list$Assistant.Organizer <- as.factor(member_list$Assistant.Organizer) 
member_list$Mailing.List <- as.factor(member_list$Mailing.List)

  ####################################################
 # Question: How many joined since the last meetup? #
###################################################
  
# sort member list by "Joined.Group.on" variable
member_list <- member_list[order(member_list$Joined.Group.on),]

# add cumalitive sum aka "count_index"
member_list$count_index <- seq(from =1, to = NROW(member_list), by = 1)

# lets plot it!
plot(y = member_list$count_index, x = member_list$Joined.Group.on, type = "l", col = "red")


  # Get a unique ordered list of Meetup dates
Meetup_dates <- sort(unique(member_list$Last.Attended))

  # number of new member since last meetup?
new_members <- subset(member_list, Joined.Group.on > Meetup_dates[NROW(Meetup_dates)])
  # how many?
  NROW(new_members)

 # How about number of new members between last meetup and the one prior to that?
new_members2 <- subset(member_list, Joined.Group.on <= Meetup_dates[NROW(Meetup_dates)] &
                                    Joined.Group.on > Meetup_dates[NROW(Meetup_dates)-1])
  # how many?
  NROW(new_members2)

  #######################################   
 # Letiteration over more all meetups! #
####################################### 
  
 ## First, get a unique ordered list of Meetup dates
  Meetup_dates <- c(sort(unique(data$Last.Attended)), Sys.Date())

  # initialize data.frame to save memory
  new_df <- data.frame("Date"=NULL, "count_index"=NULL)
  
  # start the for loop
  for(i in 1:NROW(Meetup_dates)-1) {
          
   df <- subset(member_list, Joined.Group.on <= Meetup_dates[NROW(Meetup_dates)-(i-1)] &
                             Joined.Group.on > Meetup_dates[NROW(Meetup_dates)-(i)])
        
        Date <- Meetup_dates[NROW(Meetup_dates)-(i-1)]
        New  <- max(df$count_index) - min(df$count_index)
        
        new_df <- rbind(new_df,data.frame(Date, New))
        
        
        }
 

 ## That works, lets turn it into a function!
 
 new_mem_counter <- function(data) {
         
         Meetup_dates <- c(sort(unique(data$Last.Attended)), Sys.Date())
         
         data <- data[,c("Joined.Group.on", "count_index")]
         
         #initialize data.frame
         new_df <- data.frame("Date"=Meetup_dates[1], "New"=0)
         
         for(i in (NROW(Meetup_dates)-1):1) {
                 
                 df <- subset(data, Joined.Group.on <= Meetup_dates[NROW(Meetup_dates)-(i-1)] &
                                      Joined.Group.on > Meetup_dates[NROW(Meetup_dates)-(i)])
                 
                 Date <- Meetup_dates[NROW(Meetup_dates)-(i-1)]
                 New  <- max(df$count_index) - min(df$count_index)
                 
                 new_df <- rbind(new_df,data.frame(Date, New))
                 
                 
         }
         
       return(new_df) 
}
 
 ## now we can call the function whenever we need to.
 new_members <- new_mem_counter(member_list)
 
 # how's the plot look?
 plot(new_members, type="l", col = "blue") 
 
 # what gap between meetups saw the most new members?
 new_members[new_members$New==max(new_members$New),]
 
 
 
 