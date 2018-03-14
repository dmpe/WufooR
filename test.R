

readr::read_csv(executedEntriesFromCSVGetRst, na = "NA", col_types = list(
  `Address` = col_character(),
  `Date Created` = col_datetime(format = "%Y-%m-%d %H:%M:%S", tz = "UTC"), 
  `Last Updated` = col_datetime(format = "%Y-%m-%d %H:%M:%S", tz = "UTC"), 
  `Updated By` = col_character()
))




users_url <- paste0("https://johnmalc.wufoo.com/api/v3/users.json")


fields_url <- paste0("https://johnmalc.wufoo.com/api/v3/forms/forms.json")
query = list(formIdentifier = NULL)

getResponse <- GET(users_url, query, config(userpwd = paste0(apiKey = "S6VI-I8UA-BY11-TDHO",":fakepassword")))

rawTextResponse <- content(getResponse, as = "text")
json_response <- fromJSON(rawTextResponse, flatten = TRUE)


df_fields <- json_response$Fields
uns <- unlist(json_response$Fields$SubFields)

df.list <- NULL
for (i in seq(json_response$Fields$SubFields))
  assign(paste("df", i, sep = ""), df.list[[i]])
