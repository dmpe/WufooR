#' @title Shows User's Information
#' 
#' @description Shows information about the user. 
#' 
#' @param ApiKey - User's API key. Go to "https://yourName.wufoo.com/api/code/1/
#' @param wufoo_name - Default: \code{\link{auth}}
#' @param showRequestURL - for debug purposes
#' 
#' @return \url{http://help.wufoo.com/articles/en_US/SurveyMonkeyArticleType/The-Users-API}
#' 
#' @examples 
#' View(user_info(ApiKey = "F1QH-Q64B-BSBI-JASJ"))
#' 
#' 
#' @export
user_info <- function(ApiKey, wufoo_name = auth(NULL), showRequestURL = "false") {
  
  user_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/users.json")
  
  executedUserGetRst <- doRequest(user_url, apiKey = ApiKey, showURL = showRequestURL)
  df_user <- t(executedUserGetRst$Users)
  
  return(df_user)
}




