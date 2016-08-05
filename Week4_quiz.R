#_______________________________________
#
# Question 1
#
#_______________________________________

ibrary(RCurl)


if(!file.exists("./data")){
      dir.create("./data")  
}
if(!file.exists("./data/USCommunities.csv")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
      download.file(fileUrl, destfile="./data/USCommunities.csv", method="libcurl")
}
usc <- read.csv("./data/USCommunities.csv")

#-----------------------------------------------------------------------------------------
#
# Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
# What is the value of the 123 element of the resulting list?
#
#-----------------------------------------------------------------------------------------

# Look at header names data
names(usc)

#Split the wgtp
wgtpsplitusc <- strsplit(names(usc), "wgtp")
head(wgtpsplitusc, 5)

# The 123 element:
wgtpsplitusc[[123]]
# Answer: [1] ""   "15"

#_______________________________________
#
# Question 2
#
#_______________________________________

if(!file.exists("./data/GrossDomesticProductData.csv")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
      download.file(fileUrl, destfile="./data/GrossDomesticProductData.csv", method="libcurl")
}
gdpdata <- read.csv("./data/GrossDomesticProductData.csv", skip = 4, nrows = 190)

# Give variables appropriate names:
gdpdata <- gdpdata %>% rename(countrycode = X, ranking = X.1, Economy = X.3, gdp = X.4) %>%
      select(countrycode, ranking, Economy, gdp)

# Remove the commas from gdp:
gdpdata$gdp <- as.numeric( gsub( ",", "", gdpdata$gdp))

# Average the GDP:
mean(gdpdata$gdp, na.rm = TRUE)
# Answer: [1] 377652.4

#_______________________________________
#
# Question 3
#
#_______________________________________

length(grep("^United", gdpdata$Economy))
# Answer: [1] 3

#_______________________________________
#
# Question 4
#
#_______________________________________


if(!file.exists("./data/GrossDomesticProductData2.csv")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
      download.file(fileUrl, destfile="./data/GrossDomesticProductData2.csv", method="libcurl")
}
gdpdata2 <- read.csv("./data/GrossDomesticProductData2.csv", skip = 4, nrows = 190)

# Tidy the dataset:
gdpdata2 <- gdpdata2 %>% rename(countrycode = X, ranking = X.1, Economy = X.3, gdp = X.4) %>%
      select(countrycode, ranking, Economy, gdp)


if(!file.exists("./data/EducationalData.csv")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
      download.file(fileUrl, destfile="./data/EducationalData.csv", method="libcurl")
}
edudata <- read.csv("./data/EducationalData.csv")

# Tidy the dataset:
edudata <- rename(edudata, countrycode = CountryCode)
edudata <- rename(edudata, specialnotes = Special.Notes)

#---------------------------------------------------------------
#
# Match the data based on the country shortcode. Of the countries for 
# which the end of the fiscal year is available, how many end in June?
#
#---------------------------------------------------------------

# Merge the sets:
merg <- merge(gdpdata2, edudata, all = TRUE, by = c("countrycode"))

# Find the number of fiscal year ends in june
length(grep("fiscal year end: june", tolower(merg$specialnotes)))
# Answer: [1] 13

#_______________________________________
#
# Question 5
#
#_______________________________________

install.packages("quantmod")

library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE) 
sampleTimes = index(amzn)

# How many values were collected in 2012? 
# How many values were collected on Mondays in 2012?
grid <- table(year(sampleTimes), weekdays(sampleTimes))
addmargins(grid)

# Answer is 250, 47