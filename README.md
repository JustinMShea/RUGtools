# RUGtools

[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/JustinMShea/RUGtools?branch=master&svg=true)](https://ci.appveyor.com/project/JustinMShea/RUGtools) [![Travis-CI Build Status](https://travis-ci.org/JustinMShea/RUGtools.svg?branch=master)](https://travis-ci.org/JustinMShea/RUGtools)


A collection of data, functions, reports, and a custom r markdown template related to the [Chicago R User Group (Chicago RUG, CRUG) Data and Statistics](https://www.meetup.com/ChicagoRUG/). These include:

- **`pizza_estimate`**: Function to estimate your meetup pizza order.


- **`intro_slides`**: Function to creates an ioslides R Markdown template, with default CRUG content.

- **`meetup_import`**: Function to import, clean, and format data manually downloaded from meetup.com's member list page.

- **`member_list`**: RData file downloaded from [meetup.com/ChicagoRUG](https://www.meetup.com/Chicago-R-User-Group/) and cleaned with `meetup_import`. Personally identifiable information (PII) removed, data formated and ready for analysis.

- **`new_mem_counter`**: Function generates sum of new members joined between each meetup. Works with `data.frame` created by `meetup_import` function.


Please see the [package companion site](https://justinmshea.github.io/RUGtools/) 
for full documentation and the [`Introduction to RUGtools`](https://justinmshea.github.io/RUGtools/articles/Introduction-RUGtools.html) vignette.

## Installation

Install from the Github master branch.

```
devtools::install_github("Chicago-R-User-Group/RUGtools")
```