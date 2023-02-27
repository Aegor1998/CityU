# Author:     Blake Kucera
# Class:      CS251
# Assignment: PE07

setwd("/home/bkucera/PycharmProjects/CityU/Winter2023/CS251_Statistical_Computing/PE07")

data <- read.csv(file = 'temp_max.csv', header = TRUE, sep = ",")

mu0 <- 25.3 # Average July temperatures between 2012 and 2014
cat("\n\nAverage Temp 07/12 to 01/14: ", mu0, "\n")

data_Mean   <- mean(data$temp_max)
data_SD     <- sd(data$temp_max)
data_Sample <- length(data$temp_max)
cat("\nData Mean   : ", data_Mean,
    "\nData SD     : ", data_SD,
    "\nData Sample : ", data_Sample)

t <- (data_Mean-mu0)/(data_SD/sqrt(data_Sample))

alpha <- 0.01
t.half.alpha <- qt(1-alpha/2, df=data_Sample-1)

cat("\nT Value     : ", t,
    "\nt.half.alpha: ", t.half.alpha)

z <- (data_Mean-mu0)/(data_Sample/sqrt(data_Sample))
pval <- pnorm(z)
cat("\nZ Value    : ", z,
    "\nP Value    : ", pval)

cat("\n\n")
if(t <= -t.half.alpha || t >= t.half.alpha){
  print("Reject the Null Hypthesis")
} else {
  print("Do Not Reject the Null Hypthesis")
}

pval <- pnorm(z)
cat("\nPval is equal to ", pval, "\n")

if (pval < alpha)
  print("Reject the Null Hypothesis")

cat("In this instance the t value is sugesting that we should reject the null hypothesis. While the",
    " Pval is suggesting that we are not. Though the data may be flawed because I was not told what",
    " the population size was, or what it would be based off of, so I made the sample size equal the",
    " population size.")