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

