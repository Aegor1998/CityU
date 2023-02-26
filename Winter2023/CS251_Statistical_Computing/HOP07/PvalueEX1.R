# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 10000 # Hyp. Val.
xbar  <- 9900  # Sample Mean
sigma <- 120   # Pop. Std. Dev.
n     <- 30    # Sample Size
alpha <- 0.05

z <- (xbar-mu0)/(sigma/sqrt(n))
cat("\nThe value of z is equal to ", z)

pval <- pnorm(z)
cat("\nPval is equal to ", pval, "\n")

if (pval < alpha)
  print("Reject the Null Hypothesis")