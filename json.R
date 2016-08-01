### Lese JSON fil
library(jsonlite)
json_list <- content(req)
df <- jsonlite::fromJSON(toJSON(json_list))
mylist <- select(df, name, created_at) 
mylist[mylist$name == "datasharing",]  