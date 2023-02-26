# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 10000 # Hyp. Val.
xbar  <- 9900  # Sample Mean
sigma <- 120   # Pop. Std. Dev.
n     <- 30    # Sample Size

z <- (xbar-mu0)/(sigma/sqrt(n))

cat("\nz is equal to ", z)

#Calculate the critical value
alpha   <- 0.05
z.alpha <- qnorm(1-alpha)

cat("\ncritical value is equal to ", z.alpha)

if(z <= -z.alpha){
  cat("\nReject the claim that mean lifetime of a lightbult",
  " is above 10,000 hours")
} else {
  cat("\nDo not reject the claim that mean lifetime of a",
  "lightbulb is above 10,000 hours")
}