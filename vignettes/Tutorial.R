## ----echo=TRUE-----------------------------------------------------------
library(WufooR)
# put here your api key
options(Wufoo_Name = "johnmalc", Wufoo_API = "S6VI-I8UA-BY11-TDHO")

## ---- eval=TRUE, include=T-----------------------------------------------
auth_name(NULL)
auth_key(NULL)

## ---- eval=TRUE, include=T-----------------------------------------------
t(user_info())

## ---- eval=TRUE, include=T-----------------------------------------------

t(form_info(formIdentifier = "z5kqx7h1gtvg4g", includeTodayCount="true"))


t(form_info(includeTodayCount="true"))

# Show responses to the form
fe_1 <- form_entries(formIdentifier = "z5kqx7h1gtvg4g")
t(fe_1)

sapply(fe_1, class)

## ---- eval=TRUE, include=T-----------------------------------------------
form_entriesCount(formIdentifier = "z5kqx7h1gtvg4g", domain = "wufoo.eu")

## ---- eval=TRUE, include=T-----------------------------------------------
form_comments(formIdentifier = "z5kqx7h1gtvg4g", domain = "wufoo.eu")
form_commentsCount(formIdentifier = "z5kqx7h1gtvg4g")

## ---- eval=TRUE, include=T-----------------------------------------------
form_entriesFromCSV(reportName = "untitled-report", showRequestURL = F)

## ---- eval=TRUE, include=T-----------------------------------------------
fields_info(formIdentifier = "z5kqx7h1gtvg4g", showRequestURL = TRUE)

## ---- eval=TRUE, include=T-----------------------------------------------
# all reports
t(reports_info())

# only some reports
t(report_info(reportName = "untitled-report"))

## ---- eval=TRUE, include=T-----------------------------------------------
t(report_entries(reportName = "untitled-report"))

t(report_widgets(formIdentifier = "z5kqx7h1gtvg4g"))

