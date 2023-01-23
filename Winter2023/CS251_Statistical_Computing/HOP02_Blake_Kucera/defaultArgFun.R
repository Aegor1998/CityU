# Author: Blake Kucera

productVect <- function (a=1:5) {
  res <- 1
  for(e in a) {
    res <- res * e
  }
  productVect = res
}

print(productVect())

A <- 1:5
B <- 1:10

print(productVect(A))
print(productVect(B))