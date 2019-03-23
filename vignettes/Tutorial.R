## ----echo=FALSE----------------------------------------------------------
library(WufooR)
# put here your api key
options(Wufoo_Name = "johnmalc", Wufoo_API = "S6VI-I8UA-BY11-TDHO")

## ---- eval=FALSE, include=T----------------------------------------------
#  auth_name(NULL)
#  auth_key(NULL)

## ---- eval=FALSE, include=T----------------------------------------------
#  t(user_info())

## ---- eval=FALSE, include=T----------------------------------------------
#  t(form_info(formIdentifier = "z5kqx7h1gtvg4g", includeTodayCount="FALSE"))
#  
#  
#  t(form_info(includeTodayCount="FALSE"))
#  
#  # Show responses to the form
#  fe_1 <- form_entries(formIdentifier = "z5kqx7h1gtvg4g")
#  t(fe_1)
#  
#  sapply(fe_1, class)

## ---- eval=FALSE, include=T----------------------------------------------
#  form_entriesCount(formIdentifier = "z5kqx7h1gtvg4g", domain = "wufoo.eu")

## ---- eval=FALSE, include=T----------------------------------------------
#  form_comments(formIdentifier = "z5kqx7h1gtvg4g", domain = "wufoo.eu")
#  form_commentsCount(formIdentifier = "z5kqx7h1gtvg4g")

## ---- eval=FALSE, include=T----------------------------------------------
#  form_entriesFromCSV(reportName = "untitled-report", showRequestURL = F)

## ---- eval=FALSE, include=T----------------------------------------------
#  fields_info(formIdentifier = "z5kqx7h1gtvg4g", showRequestURL = FALSE)

## ---- eval=FALSE, include=T----------------------------------------------
#  # all reports
#  t(reports_info())
#  
#  # only some reports
#  t(report_info(reportName = "untitled-report"))

## ---- eval=FALSE, include=T----------------------------------------------
#  t(report_entries(reportName = "untitled-report"))
#  
#  t(report_widgets(formIdentifier = "z5kqx7h1gtvg4g"))

