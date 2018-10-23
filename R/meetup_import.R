#' Import Meetup .csv
#' 
#' Import, Clean, and Format of data manually downloaded from meetup.com's 
#' member list page
#' 
#' Assumes manual download of the meetup member list file. For example, the 
#' Chicago R User Group (CRUG) url looks like this: https://www.meetup.com/ChicagoRUG/members/?op=csv
#' Note: One can only download this file if signed into meetup.com as an organizer.
#'
#' The file download from meetup.com is in .xls format. To ensure proper conversion 
#' to .csv, open it with excel and then `save as .csv`. Alternatively, one can 
#' upload the .xls file to google sheets and then export as .csv.
#'   
#' To utilize the Default file path of this function, place the file in the 
#' folder path \strong{`data-raw/meetup`} of the working directory and make sure it is
#' the only file in the folder.
#' 
#' @param file File path to .csv file. Defaults to NULL. Default attempts to 
#' import any .csv file present in the \strong{data-raw/meetup} folder of the 
#' working directory.See \strong{Details} section and file argument of 
#' \code{\link{read.csv}} 
#' 
#' @param format Character vector of Date format. See usage above for default. 
#' Meetup seems to change this frequently, so check your data. 
#' See \code{\link{strptime}} for formating details. 
#' 
#' @param ... arguments passed to \code{\link{read.csv}}
#' 
#' @inheritParams read.csv
#'
#' @seealso \code{\link{read.csv}}
#'
#' @importFrom utils read.csv
#' 
#' @return A \code{\link{data.frame}} formated indentically to 
#'  \code{\link{member_list}}.
#' 
#' @examples
#' \dontrun{ 
#' member_list <- meetup_import()}
#' @export
meetup_import <- function(file = NULL, format = "%d-%b-%y", ...) {

if(is.null(file) == TRUE) {
        
file_path <- paste0(getwd(), "/data-raw/meetup/", list.files("data-raw/meetup", pattern = ".csv$"))

}
        
member_list <- read.csv(file = file_path, stringsAsFactors=FALSE, ...)

####################
# Clean and Format #
#################### 

# Convert dates of charachter type to `Date`.
member_list$Joined.Group.on <- as.Date.character(member_list$Joined.Group.on, format = format)
member_list$Last.visited.group.on <- as.Date.character(member_list$Last.visited.group.on, format = format)
member_list$Last.Attended <- as.Date.character(member_list$Last.Attended, format = format)

# Next, convert reponse oriented variables into factors
member_list$Intro <- as.factor(member_list$Intro)
member_list$Photo <- as.factor(member_list$Photo)
member_list$Assistant.Organizer <- as.factor(member_list$Assistant.Organizer) 
member_list$Mailing.List <- as.factor(member_list$Mailing.List)

# rename length variables
member_list$R.Experience <- member_list$How.long.have.you.been.using.R..or.S..software.
member_list$How.long.have.you.been.using.R..or.S..software. <- NULL

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

return(member_list)

}

