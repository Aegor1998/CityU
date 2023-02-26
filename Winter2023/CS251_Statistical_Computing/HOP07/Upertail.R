# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 2    # Hyp. Val.
xbar  <- 2.1  # Sample Mean
sigma <- 0.25 # Pop. Std. Dev.
n     <- 35   # Sample Size

z <- (xbar-mu0)/(sigma/sqrt(n))

cat("\nz is equal to ", z)

#Calculate the critical value
alpha   <- 0.05
z.alpha <- qnorm(1-alpha)

cat("\ncritical value is equal to ", z.alpha)

if(z <= -z.alpha){
  cat("\nWe reject the claim that there is at most 2 grams of",
  " saturated fat in a cookie")
} else {
  cat("\nDo not reject the claim that there is at most",
  " 2 grams of saturated fat in a cookie")
}