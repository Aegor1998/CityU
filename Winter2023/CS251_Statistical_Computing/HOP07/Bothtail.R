# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

mu0   <- 15.4 # Hyp. Val.
xbar  <- 14.6 # Sample Mean
sigma <- 2.5  # Pop. Std. Dev.
n     <- 35   # Sample Size

z <- (xbar-mu0)/(sigma/sqrt(n))

cat("\nz is equal to ", z)

#Calculate the critical value
alpha   <- 0.05
z.half.alpha <- qnorm(1-alpha/2)
print(c(-z.half.alpha, z.half.alpha))

if (z <= -z.half.alpha || z >= z.half.alpha){
  cat("Reject the null hypothesis that the mean penguin",
      " weight does not differ from last year")
} else {
  cat("Do not reject the null hypothesis that the mean penguin",
      " weight does not differ from last year")
}