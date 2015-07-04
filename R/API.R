#' @title Authentication
#' 
#' @note Wufoo currently restricts your API usage to 5000 requests per day.
#' 
#' @examples 
#'
auth <- function(x) {
  tmp <- if(is.null(x)) {
    Sys.getenv("Wufoo_Name", "") 
  } else x
  
  if(tmp == "") {
    getOption("noaakey", stop("need an API key for NOAA data")) 
  } else tmp
}

