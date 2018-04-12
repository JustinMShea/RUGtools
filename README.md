# CRUGtools

![](https://github.com/Chicago-R-User-Group/CRUGtools/blob/master/vignettes/images/CRUG-Header.png)

A collection of reports and functions related to the [Chicago R User Group (Chicago RUG, CRUG) Data and Statistics](https://www.meetup.com/ChicagoRUG/).

The `vignettes` folder containts a report on new members and our intro-slides template, along with supporting data and various images. The `data` folder is meant to be stored locally and is .gitignored from this repo.

Thus far, we have two functions stored in the `R/` folder:

`new_mem_counter` is used to calculate how many new members have joined between each meetup.

`pizza_quantity` is used to estimate the number of :pizza: :pizza: :pizza: :pizza: :pizza: :pizza: to order for each meetup.

## Installation

Install from the Github master branch, depends on `R` version >= 3.0.0.

```
devtools::install_github("Chicago-R-User-Group/CRUGtools")
```