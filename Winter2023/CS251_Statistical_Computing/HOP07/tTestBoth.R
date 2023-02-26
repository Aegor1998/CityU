# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 15.4 # Hyp. Val.
xbar  <- 14.6 # Sample Mean
n     <- 29   # Sample Size
s     <- 2.5  # Sample Std. Dev.

t <- (xbar-mu0)/(s/sqrt(n))
cat("\nThe value of t is equal to ", t)

alpha <- 0.05
t.half.alpha <- qt(1-alpha/2, df=n-1)
cat("\n-t.half.alpha: ", -t.half.alpha,
    "\n t.half.alpha: ", t.half.alpha,
    "\n")

if(t <= -t.half.alpha || t >= t.half.alpha){
  print("Reject the Null Hypthesis")
} else {
  print("Do Not Reject the Null Hypthesis")
}