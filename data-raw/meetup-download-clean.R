
  ##################################
 # Data Import, Clean, and Format # 
##################################

 # Pass file_path to meetup_list. See`meetup_import` function docs for info.
library(RUGtools)
member_list <- meetup_import()

# Build checks might reveal character issues.
member_list$R.Experience <- stringi::stri_trans_general(member_list$R.Experience, "latin-ascii")
member_list$Location <- stringi::stri_trans_general(member_list$Location, "latin-ascii")


  #########################
 # write to .Rdata files #
#########################

save(member_list, file = "data/member_list.RData")
