  ###############
 # Data Import # 
###############

 # This assumes manual download of the meetup member list file from:
 # https://www.meetup.com/ChicagoRUG/members/?op=csv
 
 # Place the file in the`data-raw/meetup` folder of the package working directory 
 # and save it as `.csv`, not the meetup default of `.xls`.
 # NOTE: this script assumes only one file present in the meetup folder

file_name <- list.files("data-raw/meetup", pattern = ".csv$")
file_path <- paste0(getwd(), "/data-raw/meetup/", file_name)
member_list <- read.csv(file_path, stringsAsFactors=FALSE)


  ####################
 # Clean and Format #
#################### 

 # Convert dates of charachter type to `Date`.
member_list$Joined.Group.on <- as.Date.character(member_list$Joined.Group.on, format = "%m/%d/%Y")
member_list$Last.visited.group.on <- as.Date.character(member_list$Last.visited.group.on, format = "%m/%d/%Y")
member_list$Last.Attended <- as.Date.character(member_list$Last.Attended, format = "%m/%d/%Y")

 # Next, convert reponse oriented variables into factors
member_list$Intro <- as.factor(member_list$Intro)
member_list$Photo <- as.factor(member_list$Photo)
member_list$Assistant.Organizer <- as.factor(member_list$Assistant.Organizer) 
member_list$Mailing.List <- as.factor(member_list$Mailing.List)

# rename length variables
member_list$R.Experience <- member_list$How.long.have.you.been.using.R..or.S..software.
member_list$How.long.have.you.been.using.R..or.S..software. <- NULL

# clean character 
member_list$R.Experience <- stringi::stri_trans_general(member_list$R.Experience, "latin-ascii")
member_list$Location <- stringi::stri_trans_general(member_list$Location, "latin-ascii")

# order by date joined
member_list <- member_list[with(member_list, order(Joined.Group.on)),]
# OR order by date joined AND then meetup.id
member_list <- member_list[with(member_list, order(Joined.Group.on, Member.ID)),]

# Overwrite current Member.ID with a sequence of integers starting with 1.
# Acts as a count index
member_list$Member.ID <- seq(from = 1, to = NROW(member_list), by = 1)
# set row.names to integer of count index.
row.names(member_list) <- as.integer(member_list$Member.ID)


# Drop name, User.ID, and title columns
id <- c("Name", "User.ID", "Title", "URL.of.Member.Profile")
noid <- !names(member_list) %in% id
member_list <- member_list[ ,noid]

  #########################
 # write to .Rdata files #
#########################

save(member_list, file = "data/member_list.RData")

# Document
devtools::document()

