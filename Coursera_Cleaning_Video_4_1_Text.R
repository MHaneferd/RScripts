library(RCurl)
if(!file.exists("./data")){dir.create("./data")}

if(!file.exists("./data/cameras.csv")){
      fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
      download.file(fileUrl, destfile="./data/cameras.csv", method="libcurl")
}
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

# Få variablenavnene lowercase
tolower(names(cameraData))

splitNames <- strsplit(names(cameraData),"\\.")
splitNames[[6]]
head(splitNames[6],3)

head(cameraData,3)

grep("Alameda",cameraData$intersection)

table(grepl("Alameda",cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

grep("Alameda",cameraData$intersection, value = TRUE)

length(grep("Alameda",cameraData$intersection))

# Se når det ikke er treff:
length(grep("babbeliballeli",cameraData$intersection))

# More useful string functions
library(stringr)

# Antall bokstaver:
nchar("Martin")

# Substring av setning
substr("Martin var ikke hjemme",1,6)

# Lime sammen
paste("Hei", "Du")
paste0("Lim","Sammen")

# Trimme
str_trim("Martin         ")
