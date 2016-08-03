library(dplyr)

# Finnes ikke chicago, så bruker mtcars
dim(mtcars)
str(mtcars)
names(mtcars)

# Sjekk kolonner med forskjellige annotations???
head(select(mtcars, gear:carname),3)

# se colonner, men ikke alle (bruke - tegn
head(select(mtcars,-(disp:am), -( name:carname)),3)

# Filtrere ut verdier:
storMotor <- filter(mtcars, cyl > 6)
head(storMotor,3)
tapply(storMotor$hp,storMotor$carb,mean)
summary(storMotor$hp)

# Sortere
head(arrange(mtcars, desc(hp)),5)
tail(arrange(mtcars, desc(hp)),5)

# Gi kolonner nytt navn:
mtcars <- rename(mtcars, forgasser = carb)
str(mtcars)

# For å mutere / legge til kolonner. bruk mutate
mtcars <- mutate(mtcars, hptrend = (hp - mean(hp, na.rm=TRUE)))
mtcars <- arrange(mtcars, desc(hp))
head(mtcars, 3)
tail(mtcars,3)
                  
# Gruppering. Lager en kolonne med sore og små motorer og grupperer på den:
median(mtcars$hp)
mtcars <- mutate(mtcars, motor = factor(1*(hp < median(hp)), labels=c("Stor","Liten")))
storliten <- group_by(mtcars,motor)
head(select(storliten,name,hp,motor),3)
tail(select(storliten,name,hp,motor),3)

# Bruke statistikk summarize for å finne snitt osv. i gruppene:
summarize(storliten, snitt_hp = mean(hp), snittforgassere = mean(forgasser))
