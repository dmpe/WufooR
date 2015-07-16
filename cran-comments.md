## Test environments
* Ubuntu 15.04 (+ travis-ci), R 3.1.2
* Windows 10 (3.2.1-patched)

## R CMD check results
Dear Mr.Hornik,

This is my first release of [WufooR](https://github.com/dmpe/WufooR) - another API package wrapper for the form/survey building service.

There were no ERRORs or WARNINGs. 

There were 2 NOTEs:

* New submission
Found the following (possibly) invalid URLs:
  URL: http://cran.r-project.org/package=WufooR
    From: README.md
    Status: 404
    Message: Not Found

* No repository set, so cyclic dependency check skipped


## This is resubmission

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: form_entriesFromCSV
> ### Title: Return number of responses to your form, from CSV format
> ### Aliases: form_entriesFromCSV
>
> ### ** Examples
>
> form_entriesFromCSV(reportName = "untitled-report", showRequestURL = TRUE)

This has been addressed (hopefully) by adding `donotrun{}` and deleting (quite) unnecessary `readr` dependency.


## Downstream dependencies
There are no downstream dependencies because this is the first release. 

