# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 2    # Hyp. Val.
xbar  <- 1.8  # Sample Mean
n     <- 10   # Sample Size
s     <- 0.15 # Sample Std. Dev.

t <- (xbar-mu0)/(s/sqrt(n))
cat("\nThe value of t is equal to ", t)

alpha <- 0.01
t.alpha <- qt(1-alpha, df=n-1)
cat("\nThe value of t is ", -t.alpha)

if(t <= -t.alpha){
  print("Reject the Null Hypthesis")
} else {
  print("Do Not Reject the Null Hypthesis")
}