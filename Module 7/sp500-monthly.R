
# prep environment
library(readr)
library(dplyr)

# read data
data1 <- read_csv("SPY-month.csv")

# populate with previous price
data1$PrevAdjClose <- lag(x=data1$`Adj Close`)
# issues ?
index <- which(any(is.na(data1)))
data1$PrevAdjClose[index] <- data1$`Adj Close`

# calculate return
data1$Return <- round(
  ((data1$`Adj Close`-data1$PrevAdjClose)/data1$PrevAdjClose)*100, 
  digits=2 )

# simple plot
qplot(x=data1$Date, y=data1$Return, ylim=c(-15,15) )

# boxplot
boxplot(data1$Return, horizontal = TRUE)

# histogram stats
summary(data1$Return)
summ <- summary(data1$Return)

# histo #1
h <- hist( data1$Return, breaks=40)

# histo #2
h <- hist( data1$Return, breaks = 40)
modeVal_V <- h$mids[ which.max(h$counts) ]
abline(v = summ[1], col = "yellow", lwd=2)
abline(v = summ[2], col = "black", lwd=2)
abline(v = summ[3], col = "green", lwd=2)
abline(v = modeVal_V, col = "magenta", lwd=2)
abline(v = summ[4], col = "red", lwd=2)
abline(v = summ[5], col = "black", lwd=2)
abline(v = summ[6], col = "yellow", lwd=2)

