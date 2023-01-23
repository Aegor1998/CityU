# Author: Blake Kucera

A <- 1:5

productVect <- function(a){
  res <- 1
  for (e in a){
    res <- res * e
  }
  productVect = res
}

print(productVect(A))

B <- 1:10
print(productVect(B))