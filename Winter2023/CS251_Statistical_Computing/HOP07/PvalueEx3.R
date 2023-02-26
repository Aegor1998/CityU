# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 2     # Hyp. Val.
xbar  <- 1.8   # Sample Mean.
n     <- 10    # Sample Size
s     <- 0.15  # Sample Std. Dev.
alpha <- 0.01

t <- (xbar-mu0)/(s/sqrt(n))
cat("\nThe value of t is equal to ", t)

pval <- pt(t, df = n-1)
cat("\nPval is equal to ", pval, "\n")

if (pval < alpha)
  print("Reject the Null Hypothesis")