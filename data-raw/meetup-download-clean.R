
  ##################################
 # Data Import, Clean, and Format # 
##################################

 # Pass file_path to meetup_list. See`meetup_import` function docs for info.
library(RUGtools)
member_list <- meetup_import()


  #########################
 # write to .Rdata files #
#########################

save(member_list, file = "data/member_list.RData")
