# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

setwd("/home/bkucera/PycharmProjects/CityU/Winter2023/CS251_Statistical_Computing/HOP07")

sal <- read.csv(file = 'ztest-a.csv', header = TRUE, sep = ",")
print(summary(sal))

z.test <- function (a, mu, sd){
  return ((mean(a) - mu) / (sd/sqrt(length(a))))
}

z <- z.test(a = sal$salary, mu = 113000, sd = 15000)
cat("\nThe z value is equal to: ", z)

alpha <- 0.05
z.half.alpha <- qnorm(1-alpha/2)
cat("\n-z.half.alpha and z.half.alpha is equal to: ",
    -z.half.alpha, " , ", z.half.alpha)

if (z <= -z.half.alpha || z >= z.half.alpha){
  print("Reject the null hypothesis")
} else {
    print("Do not reject the null hypothesis")
}