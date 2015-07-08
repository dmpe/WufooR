#' @title Shows Form's Fields
#' 
#' @description The Fields API describes the hierarchy of your data. At the heart of this API is the
#' listing of FieldId values. Each FieldId corresponds to a value in the Entries API.
#'
#' @return Title - The title is the friendly name you gave the field when creating your form. For 
#' example, if you were building a table with the API, the Title would be a column header.
#' @return Type - The Type represents a Wufoo field type. A listing of the these types can be found 
#' in the Field Type section of this documentation.
#' @return ID - This is the unique reference ID for your field. There will be one corresponding ID 
#' for each Entry in return value of the the Entries API.
#' @return IsRequired - This value can be one or zero, representing whether or not the field has 
#' been marked required in the Form Builder.
#' @return OtherField - This value is true or false and is only set if the field has choices. Only 
#' Multiple-Choice fields have the option of an Other field. When a Multiple-Choice field is marked
#' as HasOtherField, the last choice is the Other field.
#'
#' @inheritParams user_info
#' @inheritParams form_info
#' 
#' @import plyr
#' 
#' @examples 
#' fields_info(formIdentifier = "z5kqx7h1gtvg4g", showRequestURL = TRUE)
#' fields_info(formIdentifier = "z5kqx7h1gtvg4g")
#' 
#' @export
fields_info <- function(wufoo_name = auth_name(NULL), formIdentifier = NULL, showRequestURL = FALSE) {
  
  fields_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/forms/", formIdentifier ,"/fields.json")
  
  executedFieldsGetRst <- doRequest(fields_url, showURL = showRequestURL)
  
  # Subfields go into a different data frame
  df_fields <- executedFieldsGetRst$Fields
  df_fields$SubFields <- NULL
  df_fields[df_fields == ""] <- NA
  
  df_subfields <- executedFieldsGetRst$Fields$SubFields
  df_subfields <- rbind.fill(df_subfields, rbind)
  df_subfields[df_subfields == ""] <- NA
  
  return(df_fields)
}











