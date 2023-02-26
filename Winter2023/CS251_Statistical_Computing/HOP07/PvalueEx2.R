# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 15.4  # Hyp. Val.
xbar  <- 14.6  # Sample Mean
sigma <- 2.5   # Pop. Std. Dev.
n     <- 35    # Sample Size
alpha <- 0.05

z <- (xbar-mu0)/(sigma/sqrt(n))
cat("\nThe value of z is equal to ", z)

pval <- 2 * pnorm(z)
cat("\nPval is equal to ", pval, "\n")

if (pval < alpha) {
  print("Reject the Null Hypothesis")
} else {
  print("Accept the Null Hypothesis")
}