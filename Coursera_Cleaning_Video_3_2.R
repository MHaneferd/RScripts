install.packages("RCurl")
library(RCurl)


if(!file.exists("./data")){
      dir.create("./data")  
}
if(!file.exists("./data/restaurants.csv")){
      fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
      download.file(fileUrl, destfile="./data/restaurants.csv", method="libcurl")
}
restData <- read.csv("./data/restaurants.csv")

# Look at restaurant data
head(restData,3)
tail(restData,3)

#Make summary
summary(restData)

# in depth information
str(restData)

#Look at quantile data
quantile(restData$councilDistrict, na.rm=TRUE)

# Probabillity
quantile(restData$councilDistrict, probs = c(0.5,0.75,0.9))

# Make table
table(restData$zipCode,useNA = "ifany")

# Make 2 dimensional table. Where are the Counsil against Zip code
table(restData$councilDistrict, restData$zipCode)

# Check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# Row and Column sums (check missing values)
colSums(is.na(restData))
all(colSums(is.na(restData)) == 0)

# table with specific caracteristics
table(restData$zipCode %in% 21212)
table(restData$zipCode %in% c(21212, 21213))

head(restData[restData$zipCode %in% c(21212, 21213),],5)

# Cross tabs
data(UCBAdmissions)
df <- as.data.frame(UCBAdmissions)
all(colSums(is.na(df))==0) # If TRUE, There is no NA in the dataset.
head(df,3)
summary(df)

xt <- xtabs(Freq ~ Gender + Admit, data=df)
xt

# Flat tables
warpbreaks$replicate <- rep(1:9, len=54)

xt <- xtabs(breaks ~.,data=warpbreaks)
xt

ftable(xt)

# Size of dataset
fakedata <- rnorm(1e5)
object.size(fakedata)
print(object.size(fakedata), units = "Mb")
