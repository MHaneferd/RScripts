library(reshape2)
head(mtcars)

# Melt data
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear","cyl"), measure.vars = c("mpg","hp"))

# Notice that the Variable on top is mpg, and at the bottom is hp. 
# The dataset has double its length compare to mtcars
head(carMelt,3)
tail(carMelt,3)

# Casting Dataframes.
# 1st will summarize the number of occurence on each Cyl:
cylData <- dcast(carMelt, cyl ~ variable)
cylData

# 2nd will figure out the mean of each Cyl variable:
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

# Averaging values
head(InsectSprays)

# tapply kjører en funksjon på tabell med en nøkkel. 
# dvs. at den summerer alle InsectSpray$count gruppert etter InsectSpray$spray.
tapply(InsectSprays$count, InsectSprays$spray, sum)
# Så kan en kjøre snittet (mean) på samme gruppering
tapply(InsectSprays$count, InsectSprays$spray, mean)

# Splitte dataframen opp i lister basert på gruppering/nøkkelverdier.
# Her kan man splitte count variabelen basert på prayen.
spIns <- split(InsectSprays$count, InsectSprays$spray)
spIns

# Så kan vi summere listeelementene ved bruk av lapply
sprCount <- lapply(spIns,sum)
sprCount

# Ønsker å gå tilbake til vector istedenfor liste.
# Kan da unlist, eller kjøre sapply istedenfor lapply
unlist(sprCount)
sapply(spIns, sum)

# En annen måte. Bruke plyr pakken.
# Der bruker vi ddply . Data som førtse argument. Så feltet det skal grupperes etter i parantes.
# så hva vi skal (summarize), og sum kommandoen mot nytt felt til et egendefiner felt (summert)
library(plyr)
ddply(InsectSprays,.(spray), summarize, summert = sum(count))

# Create a new variable
spraySums <- ddply(InsectSprays,.(spray), summarize, summert = ave(count, FUN=mean))
dim(spraySums)
head(spraySums)

# Test på ave funksjonen:
ave(seq(1,20,length = 3), FUN=mean)
ave(seq(1,20,length = 3), FUN=sum)
ave(seq(1,20,length = 3)) # Gir det samme som mean



