library(RCurl)


if(!file.exists("./data")){
      dir.create("./data")  
}
if(!file.exists("./data/restaurants.csv")){
      fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
      download.file(fileUrl, destfile="./data/restaurants.csv", method="libcurl")
}
restData <- read.csv("./data/restaurants.csv")

# Creating sequenses
s1 <- seq(1,10, by=2)
s1

s2 <- seq(1,100, length=15)
s2

s3 <- seq(along=s2)
s3

# Subsetting variables
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# Creating binary variables
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# Creating categorical variables
restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

# Easier cutting
install.packages("Hmisc")
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode, g=10)
table(restData$zipGroups)

# Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# Levels of factor variables
yesno <- sample(c("Yes","No"), size=10, replace=TRUE)
set.seed(12452)
yesnofac <- factor(yesno, levels=c("Yes","No"))
yesnofac
relevel(yesnofac,ref="Yes")
?relevel
as.numeric(yesnofac)

# Cutting produces factor variables

# Using the mutate function
library(Hmisc)
library(plyr)
restData2 <- mutate(restData, zipGroups = cut2(zipCode, g=20))
table(restData2$zipGroups)
