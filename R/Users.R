#' @title Return information about the user
#' 
#' @description Shows information about the user. 
#' 
#' @references wufoo_api - User's API Key. Default: \code{\link{auth_key}}.
#' @param wufoo_name - User's Name. Default: \code{\link{auth_name}}
#' @param showRequestURL - use only for DEBUG purposes
#' 
#' @return \url{http://help.wufoo.com/articles/en_US/SurveyMonkeyArticleType/The-Users-API}
#' 
#' @examples 
#' user_info()
#' 
#' @export
user_info <- function(wufoo_name = auth_name(NULL), showRequestURL = FALSE) {
  
  user_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/users.json")
  
  executedUserGetRst <- doRequest(user_url, showURL = showRequestURL)
  df_user <- executedUserGetRst$Users
  
  return(df_user)
}




