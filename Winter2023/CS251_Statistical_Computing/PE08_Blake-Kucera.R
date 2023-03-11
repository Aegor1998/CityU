# Author    : Blake Kucera
# Class     : CS251
# Assignment: PE08

library(tidyverse)

# view(mpg)

cyl_4 <- data.frame(Model   = mpg$model[mpg$cyl == 4],
                    City    = mpg$cty[mpg$cyl == 4],
                    Highway = mpg$hwy[mpg$cyl == 4])

cyl_6 <- data.frame(Model   = mpg$model[mpg$cyl == 6],
                    City    = mpg$cty[mpg$cyl == 6],
                    Highway = mpg$hwy[mpg$cyl == 6])

cityTest <- t.test(x = cyl_4$City, y = cyl_6$City, var.equal=TRUE)
highwayTest <- t.test(x = cyl_4$Highway, y = cyl_6$Highway, var.equal=TRUE)

print(cityTest)
print(' ')
print(highwayTest)

cityDif <- mean(cyl_4$City) - mean(cyl_6$City)

highDif <- mean(cyl_4$Highway) - mean(cyl_6$Highway)