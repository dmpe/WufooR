








fields_url <- paste0("https://", wufoo_name, ".wufoo.com/api/v3/forms/", formIdentifier ,"/fields.json")
query = list(formIdentifier = formIdentifier)

getResponse <- GET(fields_url, query, config(userpwd = paste0(apiKey = "F1QH-Q64B-BSBI-JASJ",":fakepassword")))

rawTextResponse <- content(getResponse, as = "text")
json_response <- fromJSON(rawTextResponse, flatten = TRUE)


df_fields <- json_response$Fields
uns <- unlist(json_response$Fields$SubFields)

df.list <- NULL
for (i in seq(json_response$Fields$SubFields))
  assign(paste("df", i, sep = ""), df.list[[i]])
