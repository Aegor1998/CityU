# Author: Blake Kucera

mat <- matrix(1:25, nrow=5)
print(as.data.frame(mat))

cars <- mtcars
print(is.data.frame(cars))

print(mean(mtcars$mpg))
