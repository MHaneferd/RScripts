class(Sys.Date())

class(date())

# Formatting dates
d2 <- Sys.Date()
format(d2,"%a %b %d %A %B %Y")
x <- c("10jul1932","4mai1960","9aug1971","12des1970")
z <- as.Date(x,"%d%b%Y")
z
z[3]-z[4]
as.numeric(z[3]-z[4])
weekdays(z)
months(z)
julian(z, origin = as.Date("1950-01-01"))

#For å se hvor mange dager jeg har levd mer enn Benedikte
as.numeric(julian(Sys.Date(), origin = as.Date("1971-08-09")) - julian(Sys.Date(), origin = as.Date("1993-09-30")))

# Lubridate
library(lubridate)

ymd("1971.08.09")

wday(z, label = TRUE)

# Hvilken dag ble benedikte født
weekdays(dmy("30.09.1993"))

# Finn ut hvilket lokalt datoformat jeg bruker:
Sys.getlocale("LC_TIME")
# [1] "Norwegian (Bokmål)_Norway.1252"


