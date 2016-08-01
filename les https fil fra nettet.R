library(data.table)
library(RCurl)
myfile <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
#f <- file.path(getwd(), "ss06pid.csv")
#download.file(url, f)
out <- read.csv(textConnection(myfile))

