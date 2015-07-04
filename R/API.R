#' @title Authentication for Wufoo Name
#'
#' @param NULL for example
#' 
#' @description methods written by Scott Chamberlain \url{https://github.com/sckott}
#' 
#' @note Wufoo currently restricts your API usage to 5000 requests per day.
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

#' @title Generalized function for executing GET requests by always appending user's API Key.
#' 
#' @param url - which is used for the request
#' @param apiKey - uses the passed api key of the user
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
