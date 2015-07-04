#' @title Authentication
#' 
#' @note Wufoo currently restricts your API usage to 5000 requests per day.
#' 
#' 
#'
#' @export
auth <- function(x) {
  tmp <- if(is.null(x)) {
    Sys.getenv("Wufoo_Name", "") 
  } else x
  
  if(tmp == "") {
    getOption("Wufoo_Name", stop("you need to set up your wofoo name"))
  } else tmp
}

#' @title Users
#' 
#' @examples
#' View(user(apiKey = "F1QH-Q64B-BSBI-JASJ"))
#' 
#' @export
user <- function(apiKey, wufoo_name = getOption("Wufoo_Name"), showRequestURL = "false") {
  
  user_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/users.json")
  
  executedUserGetRst <- doRequest(user_url, apiKey, showURL = showRequestURL)
  
  return(executedUserGetRst)
}

#' @title Generalized function for executing GET requests by always appending user's Bit.ly API Key.
#' 
#' @param url - which is used for the request
#' @param authcode - calls the rbitlyApi \code{\link{rbitlyApi}}
#' @param queryParameters - parameters that are used for building a URL
#' @param showURL - for debugging purposes only: it shows what URL has been called
#' 
#' @import httr
#' @import jsonlite
#' 
#' @noRd
doRequest <- function(url, queryParameters = NULL, apiKey = NULL, showURL = NULL) {
  
  if (is.null(apiKey)) {
    # actually unnecessary; flawn logic because queryParameters will always contain API Key. 
    # Yet for making sure that the user has set it, I'll let it go
    stop("Please assign your API Key ('Generic Access Token') ", call. = FALSE)
  } else {
    
    getResponse <- GET(url, query = queryParameters, config(userpwd = paste0(apiKey,":fakepassword")))
  
    stop_for_status(getResponse)
    rawTextResponse <- content(getResponse, as = "text")
    json_response <- fromJSON(rawTextResponse)

    if (identical(showURL, TRUE)) {
      # was return_request$request$opts$url
      cat("The requested URL has been this: ", return_request$request$url, "\n") 
    }
    return(json_response)
  }
  
}
