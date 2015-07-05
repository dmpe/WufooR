#' Used to gather details about the reports you have permission to view.
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
#' 
#' @examples
#' reports_info(ApiKey = "F1QH-Q64B-BSBI-JASJ", showRequestURL = TRUE)
#' 
#' @import httr
#' @import jsonlite
#' 
#' @export
reports_info <- function(ApiKey, wufoo_name = auth(NULL), showRequestURL = FALSE) {
  
  reports_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/reports.json")
  
  executedReportsGetRst <- doRequest(reports_url, apiKey = ApiKey, showURL = showRequestURL)
  
  return(executedReportsGetRst$Reports)
}











