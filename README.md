# CRUGtools

![](https://github.com/Chicago-R-User-Group/CRUGtools/blob/master/vignettes/images/CRUG-Header.png)

A collection of reports and functions related to the [Chicago R User Group (Chicago RUG, CRUG) Data and Statistics](https://www.meetup.com/ChicagoRUG/).

The `vignettes` folder containts a report to track growth titled `new-members` as well as our `intro-slides.Rmd` template. **Note:** One will need to place the [meetup member list file](https://www.meetup.com/ChicagoRUG/members/?op=csv) in the `inst/extdata` folder stored locally to run the `new-members` report. The file is `.gitignored` from this repo and should be stored locally.

Currently, we have two functions stored in the `R/` folder:

`new_mem_counter` is used to calculate how many new members have joined between each meetup.

`pizza_quantity` is used to estimate the number of :pizza: :pizza: :pizza: :pizza: :pizza: :pizza: to order for each meetup!

## Installation

Install from the Github master branch, depends on `R` version >= 3.0.0.

```
devtools::install_github("Chicago-R-User-Group/CRUGtools")
```