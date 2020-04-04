#' Return details about the reports you have permission to view.
#'
#' @inheritParams form_info
#' @inheritParams user_info
#'
#' @return Name - This is the friendly name you chose when creating this form.
#' @return IsPublic - Indicates whether or not the report is accessible through
#' the Url by the general public. This value is binary (1 = true, 0 = false).
#' @return Url - This is the URL for your form. Beware using the URL for API or
#' linking purposes because it changes with the report title.
#' @return Description - Your description of the report.
#' @return DateCreated - A timestamp of when the report was created.
#' @return DateUpdated - A timestamp of when the report was lasted edited in the Wufoo Report Builder.
#' @return Hash - An unchanging hashed value unique to this report on this user's account.
#' @return \url{https://wufoo.github.io/docs/#all-reports}
#'
#' @examples
#' \dontrun{
#' reports_info(showRequestURL = TRUE)
#' }
#' 
#' @export
reports_info <- function(wufoo_name = auth_name(NULL), domain = "wufoo.com",
                         showRequestURL = FALSE, debugConnection = 0L) {
  reports_url <- paste0("https://", wufoo_name, ".", domain, "/api/v3/reports.json")

  executedReportsGetRst <- doRequest(reports_url, showURL = showRequestURL, debugConnection = debugConnection)

  return(executedReportsGetRst$Reports)
}


#' Returns a specific report.
#'
#' To identify the desired report, you can either use the report hash or the report title.
#' The Report properties are the same as in the All Reporst request.
#' The only difference is that this request will only return the identified report.
#'
#' @param reportName - the name of your report as displayed in the csv export
#' URL (which is in lowercase with hyphens replacing spaces of your report name). The report should be also public.
#'
#' @inheritParams form_info
#' @inheritParams user_info
#' @inheritParams reports_info
#'
#'
#' @examples
#' \dontrun{
#' report_info(reportName = "untitled-report")
#' }
#' 
#' @export
report_info <- function(wufoo_name = auth_name(NULL), domain = "wufoo.com",
                        reportName = NULL, showRequestURL = FALSE, debugConnection = 0L) {
  reports_url <- paste0("https://", wufoo_name, ".", domain, "/api/v3/reports/", reportName, ".json")

  query <- list(reportName = reportName)

  executedReportsGetRst <- doRequest(reports_url, query, showURL = showRequestURL, debugConnection = debugConnection)

  return(executedReportsGetRst$Reports)
}

#' Returns the entries that make up a specific report.
#'
#' This is essentially an equivalent of the data that would show up in a
#' datagrid widget on the report, or in an exported copy of the report entry data
#'
#' @inheritParams form_info
#' @inheritParams user_info
#' @inheritParams report_info
#' @inheritParams form_entries
#'
#' @seealso [form_entries()]
#'
#' @examples
#' \dontrun{
#' report_entries(reportName = "untitled-report")
#' }
#' 
#' @export
report_entries <- function(wufoo_name = auth_name(NULL), domain = "wufoo.com", systemFields = "true",
                           reportName = NULL, showRequestURL = FALSE, debugConnection = 0L) {
  reports_url <- paste0("https://", wufoo_name, ".", domain, "/api/v3/reports/", reportName, "/entries.json")
  query <- list(system = systemFields)
  executedReportEntriesGetRst <- doRequest(reports_url, query, showURL = showRequestURL, debugConnection = debugConnection)

  return(executedReportEntriesGetRst$Entries)
}


#' Returns a count of the entries stored for a specific report.
#'
#' This can help with determining the number of elements you have to display.
#'
#' @inheritParams form_info
#' @inheritParams user_info
#' @inheritParams report_info
#' @inheritParams form_entries
#'
#' @seealso [report_entries()]
#'
#' @examples
#' \dontrun{
#' report_entriesCount(reportName = "untitled-report")
#' }
#' 
#' @export
report_entriesCount <- function(wufoo_name = auth_name(NULL), domain = "wufoo.com",
                                reportName = NULL, showRequestURL = FALSE, debugConnection = 0L) {
  reports_url <- paste0("https://", wufoo_name, ".", domain, "/api/v3/reports/", reportName, "/entries/count.json")

  executedReportEntriesCountGetRst <- doRequest(reports_url, showURL = showRequestURL, debugConnection = debugConnection)

  return(executedReportEntriesCountGetRst)
}

#' Returns the field structure for the report's corresponding form.
#'
#' @inheritParams form_info
#' @inheritParams user_info
#' @inheritParams report_info
#' @inheritParams form_entries
#'
#' @seealso [fields_info()]
#'
#' @examples
#' \dontrun{
#' report_fields(reportName = "untitled-report")
#' }
#' 
#' @export
report_fields <- function(wufoo_name = auth_name(NULL), domain = "wufoo.com", systemFields = "true",
                          reportName = NULL, showRequestURL = FALSE, debugConnection = 0L) {
  reports_url <- paste0("https://", wufoo_name, ".", domain, "/api/v3/reports/", reportName, "/fields.json")
  query <- list(system = systemFields)
  executedReportFieldsGetRst <- doRequest(reports_url, query, showURL = showRequestURL, debugConnection = debugConnection)

  return(executedReportFieldsGetRst$Fields)
}
