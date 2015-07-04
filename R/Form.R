#' @title Used to gather details about the forms you have permission to access.
#'
#' @description This API can be used to create a list of all forms belonging to
#' a user and dynamically generate a form embed snippet to use in your application.
#'
#' @seealso \url{http://help.wufoo.com/articles/en_US/SurveyMonkeyArticleType/The-Forms-API}
#'
#' @return Name - The title of the form specified in the Form Settings.
#' @return Description - The description of the form as specified in the Form Settings.
#' @return Redirect Message - The confirmation message shown to users after they
#' have successfully filled out the form.
#' @return Url - This is the user friendly URL hash used for the form. Beware of using
#' this URL parameter for API or linking purposes because it changes when the form 
#' title is changed. Use the Hash parameter when you need a permanent URL link.
#' @return Email - A list of comma-separated email addresses that are setup 
#' to accept notification emails when the form collects new entries.
form <- function() {
  
}
