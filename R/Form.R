#' @title Gather details about the forms you have permission to access.
#'
#' @description This API can be used to create a list of all forms belonging to
#' a user and dynamically generate a form embed snippet to use in your application.
#'
#' @param wufoo_name - Default: \code{\link{auth}}
#' @param formIdentifier - this will give you information about just one form. 
#' The call without the "formIdentifier" will return all forms.
#' @param includeTodayCount - Will give you today’s entry count for the form.
#'
#' @return \url{http://help.wufoo.com/articles/en_US/SurveyMonkeyArticleType/The-Forms-API}
#' 
#' @import httr
#' @import jsonlite
#' 
#' @examples 
#' View(form_info(ApiKey = "F1QH-Q64B-BSBI-JASJ"))
#' 
#' 
#' @export
form_info <- function(ApiKey, wufoo_name = auth(NULL), formIdentifier = NULL, 
                 includeTodayCount = "false", showRequestURL = "false") {
  
  form_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/forms.json")
  
  query = list(formIdentifier = formIdentifier, includeTodayCount = includeTodayCount)

  executedFormGetRst <- doRequest(form_url, apiKey = ApiKey, query, showURL = showRequestURL)
  df_forms <- t(executedFormGetRst$Forms)
  
  return(df_forms)
}



#' Return Statistics
#' 
#' @inheritParams form_info
#' @param includeTodayCount 
#' @param showRequestURL 
#' @param systemFields 
#' @param formIdentifier - This placeholder must be replaced with your URL or hash.
#'
#' @description If you have 5 submission to your form, you’ll have 5 elements (rows) in the return value from your API call.
#' 
#' @return EntryId - This value is the unique identifier for your entry.
#' @return DateCreated - The date that this entry was submitted.
#' @return Created By - The person who created the entry. If submitted through a 
#' form, the value here will be public. If the submission originated in the Entry 
#' Manager this value will be the user name of the submitting user.
#' @return DateUpdated - The date that this entry was edited through the Entry 
#' Manager. If the submission has never been updated, this value will be blank.
#' @return UpdatedBy - The user name of the person who updated the entry in the 
#' Entry Manager will appear in this element.
#' 
#' @export
#'
#' @examples
#' form_entries(ApiKey = "F1QH-Q64B-BSBI-JASJ")
#' 
#' 
form_entries <- function(ApiKey, wufoo_name = auth(NULL), formIdentifier = NULL, 
                         includeTodayCount = "false", showRequestURL = "false", systemFields = "true") {
  
  entries_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/forms/{formIdentifier}/entries.json")
  
  query = list(formIdentifier = formIdentifier, includeTodayCount = includeTodayCount)
  
  executedEntriesGetRst <- doRequest(entries_url, apiKey = ApiKey, query, showURL = showRequestURL)
  
  df_entries <- t(executedEntriesGetRst$Entries)
  
  return(df_entries)
}









