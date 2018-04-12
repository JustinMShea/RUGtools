# CRUGtools

![](https://github.com/Chicago-R-User-Group/CRUGtools/blob/master/vignettes/images/CRUG-Header.png)

A collection of reports and functions related to the [Chicago R User Group (Chicago RUG, CRUG) Data and Statistics](https://www.meetup.com/ChicagoRUG/).

The `vignettes` folder containts a report on new members and our intro-slides template, along with supporting data and various images. 

**Note:** One will need to place the [meetup member list file](https://www.meetup.com/ChicagoRUG/members/?op=csv) in the `vignettes/data` folder stored locally to run the `new-members` vignette. The file .gitignored from this repo and meant to store locally.

Thus far, we have two functions stored in the `R/` folder:

`new_mem_counter` is used to calculate how many new members have joined between each meetup.

`pizza_quantity` is used to estimate the number of :pizza: :pizza: :pizza: :pizza: :pizza: :pizza: to order for each meetup.

## Installation

Install from the Github master branch, depends on `R` version >= 3.0.0.

```
devtools::install_github("Chicago-R-User-Group/CRUGtools")
```