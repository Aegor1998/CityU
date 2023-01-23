# Author: Blake Kucera

print("Section: A")
A <- matrix(c(1,2,3,4,6,7,8,9,0), nrow=3, ncol=3,
            dimnames = list(c("X", "Y", "Z"), c("A", "S", "D")))

print(A[-3,])

print(A[2,2])

print(A[A>4])

A[2,2] <- 100
print(A)

print("Section: B")
B <- rbind(A, c(1,2,3))
print(B)

print("Section: C")
C <- cbind(A, c(1,2,3))

print("Section: A")
A <- t(A)
print(A)