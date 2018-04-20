#' member_list
#' 
#' Chicago R User Group Data downloaded from meetup.com/ChicagoRUG. PII removed, 
#' data formated and ready for analysis.
#' 
#' @docType data
#' 
#' @usage data(member_list)
#' 
#' @format A data.frame with 3101 observations on 17 variables:
#' \itemize{
#'  \item \strong{Member.ID: }{Integer. Original Member.ID overwritten with a sequence 
#'  of numbers beginning with 1 (not zero). Used as count index to sum new members.}
#'  \item \strong{Location: }{Character string, format by "City, State"}
#'  \item \strong{Joined.Group.on: }{Date, format YYYY-MM-DD}
#'  \item \strong{Last.visited.group.on: }{Date, format YYYY-MM-DD}
#'  \item \strong{Last.Attended: }{Date, format YYYY-MM-DD}
#'  \item \strong{Total.RSVPs: }{Integer}
#'  \item \strong{RSVPed.Yes: }{Integer}
#'  \item \strong{RSVPed.Maybe: }{Integer}
#'  \item \strong{RSVPed.No: }{Integer}
#'  \item \strong{Meetups.attended: }{Integer}
#'  \item \strong{No.shows: }{Integer}
#'  \item \strong{Intro: }{Factor with 2 levels. "Yes","No"}
#'  \item \strong{Photo: }{Factor with 2 levels. "Yes","No"}
#'  \item \strong{Assistant.Organizer: }{Factor with 2 levels. "Yes","No"}
#'  \item \strong{Mailing.List: }{Factor with 3 levels. "Yes","No", "Digest"}
#'  \item \strong{R.Experience: }{Character string, member input on signup.}
#'  }
#'  
#' @source \url{https://www.meetup.com/ChicagoRUG/members/?op=csv}
#' 
#' @examples  str(member_list)
#' 
#' plot(y = member_list$Member.ID, x = member_list$Joined.Group.on, type = "l", col = "blue",
#'  main = "Cumulative CRUG members", ylab = "Members", xlab = "")
#' 
"member_list"