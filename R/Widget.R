#' Returns details of the widgets that make up a specific report.
#'
#' The hash code for a widget can be used to embed the widget using Javascript. Only Chart, Graph,
#' and Number widgets will be included in the request.
#' Any Text or Datagrid widgets will not be shown.
#'
#' @inheritParams form_info
#' @inheritParams user_info
#' @inheritParams reports_info
#' @inheritParams form_entries
#'
#' @return \url{https://wufoo.github.io/docs/#widgets}
#'
#' @examples
#' \dontrun{
#' report_widgets(formIdentifier = "z5kqx7h1gtvg4g")
#' }
#' 
#' @export
report_widgets <- function(wufoo_name = auth_name(NULL), domain = "wufoo.com", formIdentifier = NULL,
                           showRequestURL = FALSE, debugConnection = 0L) {
  widget_url <- paste0("https://", wufoo_name, ".", domain, "/api/v3/reports/", formIdentifier, "/widgets.json")
  executedReportFieldsGetRst <- doRequest(widget_url, showURL = showRequestURL, debugConnection = debugConnection)

  return(executedReportFieldsGetRst$Widgets)
}
