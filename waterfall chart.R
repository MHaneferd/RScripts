library(waterfall)
# Lager et dataframe med to kolonner med scores
set.seed(13435)
x <- data.frame("label"=c("A","B","C","D","E"),"value"=c(5,15,-4,12,2))
x

# Tester Waterfall chart:
waterfallchart(value~label, data=x, col=c(1,2))

