---
title: "NEWS"
output: github_document
---

# RUGtools 0.3-0 (in Development)

Added a new function, `meetup_import`, which contains most all of the script
preiously contained in the "data-raw/meetup-download-clean.R" file, used to produce 
the "member_list" data.frame. Now, we just call this function after downloading 
data from meetup.com and it cleans and formats the data for us.

Additional content added to the `Introduction-RUGtools` vignette. These include a better pizza graphic, and additional exploration of time series of membership.


# RUGtools 0.2-0

In the spirit of open source, droped the `C` and now its `RUGtools`, which will hopefully encourage others to use the work and perhaps contribute.
Chicago R User group listed as the motivation in the DESCRIPTION file.

Created a formal R markdown template of `intro-slides` which can be called using the `draft` function or from the Rstudio r markdown template selection.
Function `intro_slides` and supporting scaffolding in the `inst` folder.

Now included, a data object, `member_list`, which contains member data stripped of PII. One can now explore and analyze the data easily by downloading the package and loading the data set with `data(member_list)`


# CRUGtools 0.1-0

First release contains functions for `pizza_estimator` and `new_mem_counter`.

Vignette `new-members` displays plots and counts of how many members join the Chicago R User Group between meetups. 

An `ioslides` template `intro-slides` used for introducing the meetup has been temporarily parked in the vignettes folder along with supporting images and data.
