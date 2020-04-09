[![Build Status](https://travis-ci.org/dmpe/WufooR.svg?branch=master)](https://travis-ci.org/dmpe/WufooR)
[![codecov](https://codecov.io/gh/dmpe/WufooR/branch/master/graph/badge.svg)](https://codecov.io/gh/dmpe/WufooR)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/WufooR)](https://cran.r-project.org/package=WufooR)
=======

R package for Wufoo API
=======

**Note:** This package doesn't support creating new forms. 
Thus, it can be only used to retrieve information about your existing forms (entries) and reports. This is due to lacking API support for that. 

As of March 2019, it also supports new Wufoo Frondend experience. [BETA](https://help.wufoo.com/articles/en_US/kb/Beta)

## Not implemented

- <https://wufoo.github.io/docs/#submit-entry>


### Installing

**CRAN:** <https://CRAN.R-project.org/package=WufooR>

**OR**

Use `devtools` to install the latest version from Github:

```
library(devtools)
devtools::install_github("dmpe/wufoor")
```

Tested on Ubuntu 19.04 and Windows 10 (64 bit using latest R)

### Looking for examples and current implementation status ?

Check the vignette in `vignettes` folder.

### How to contribute 

- Fork the repository
- Create and switch to a new branch `git checkout -b [name_of_your_new_branch]`
- Do the changes (i.e. edit files)
- Push remote branch to your github `git remote add -t [name_of_your_remote]` & `git push -u origin [name_of_your_remote]`
- Create a new pull request (to my `master` branch)

Want a direct push access? No problem, just let me know and become a :family:.

### Developed by:

- [@dmpe](https://www.github.com/dmpe) :yum:.

## Meta
- Licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
- Please report bugs in <https://github.com/dmpe/wufoor/issues>.


