#' @title Gather details about the forms you have permission to access.
#'
#' @description This API can be used to create a list of all forms belonging to
#' a user and dynamically generate a form embed snippet to use in your application.
#'
#' @param formIdentifier - this will give you information about just one form. 
#' The call without the "formIdentifier" will return all forms.
#' @param includeTodayCount - Will give you today’s entry count for the form.
#' 
#' @inheritParams user_info
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
                      includeTodayCount = "false", showRequestURL = FALSE) {
  
  form_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/forms.json")
  
  query = list(formIdentifier = formIdentifier, includeTodayCount = includeTodayCount)
  
  executedFormGetRst <- doRequest(form_url, apiKey = ApiKey, query, showURL = showRequestURL)
  df_forms <- t(executedFormGetRst$Forms)
  
  return(df_forms)
}


#' Used to gather the data that users have submitted to your form.
#' 
#' @inheritParams form_info
#' @inheritParams user_info
#' 
#' @param systemFields - return system fields. Default: true
#' @param formIdentifier - must be replaced with your form's URL or hash.
#' @param sortID - sort on a single ID, as retrieved from the Fields API.
#' @param sortDirection - choose to sort your entries ASC (lowest to highest) or DESC (highest to lowest).
#' @param showsFieldsOrNames - a MUST: How should be column names be called. Either "Field1", "Field2" etc. or 
#' "First Name", "Last Name". Default to the second option. 
#' 
#' @description If you have 5 submissions to your form, you’ll have 5 elements (rows) in the return.
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
#' @examples
#' fet <- form_entries(ApiKey = "F1QH-Q64B-BSBI-JASJ", formIdentifier = "z5kqx7h1gtvg4g")
#' form_entries(ApiKey = "F1QH-Q64B-BSBI-JASJ", formIdentifier = "z5kqx7h1gtvg4g", systemFields = "false", showRequestURL = TRUE)
#' ## form_entries(ApiKey = "F1QH-Q64B-BSBI-JASJ", formIdentifier = "z5kqx7h1gtvg4g")
#' 
#' @import httr
#' @import jsonlite
#' @import dplyr
#' 
#' @export
form_entries <- function(ApiKey, wufoo_name = auth(NULL), formIdentifier = NULL, 
                         includeTodayCount = NULL, systemFields = "true", sortID = NULL, 
                         sortDirection = NULL, showRequestURL = FALSE, showsFields = FALSE) {
  
  entries_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/forms/", formIdentifier ,"/entries.json")
  
  query = list(includeTodayCount = includeTodayCount, systemFields = systemFields, sort = sortID, sortDirection = sortDirection)
  
  executedEntriesGetRst <- doRequest(entries_url, apiKey = ApiKey, query, showURL = showRequestURL)
  
  df_entries <- executedEntriesGetRst$Entries
  
  if(identical(showsFields, FALSE)) {
    df_entries2 <- data.frame(t(df_entries))
    df_entries2$colNames <- rownames(df_entries2)
    
    df_fields <- fields_info(ApiKey = apiKey, formIdentifier = formIdentifier) 
    df_mergedColNames <- left_join(df_entries2, df_fields, by = c( "colNames" = "ID"))
    
    colnames(df_entries) <- ifelse( !is.null(df_mergedColNames$Title) , df_mergedColNames$Title, df_mergedColNames$colNames)
  }
  
  return(df_entries)
}

#' Entry Count
#' 
#' @inheritParams form_info
#' @inheritParams user_info
#' @inheritParams form_entries
#'   
#' @return EntryCount - number of entries
#' 
#' @examples
#' form_entriesCount(ApiKey = "F1QH-Q64B-BSBI-JASJ", formIdentifier = "z5kqx7h1gtvg4g", showRequestURL = TRUE)
#' 
#' @import httr
#' @import jsonlite
#' 
#' @export
form_entriesCount <- function(ApiKey, wufoo_name = auth(NULL), formIdentifier = NULL, 
                              includeTodayCount = "true", showRequestURL = FALSE) {
  
  entriesCount_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/forms/", formIdentifier ,"/entries/count.json")
  
  query = list(includeTodayCount = includeTodayCount)
  
  executedEntriesCountGetRst <- doRequest(entriesCount_url, apiKey = ApiKey, query, showURL = showRequestURL)
  
  return(executedEntriesCountGetRst$EntryCount)
}







