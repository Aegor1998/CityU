# Author    : Blake Kucera
# Class     : CS251
# Assignment: HOP08

mc1 <- c(150,152,154,152,151)
mc2 <- c(156,155,158,155,154)

print(var.test(x=mc1, y=mc2))

tTest.result <- t.test(x = mc1, y = mc2,
                       var.equal = T)
print(tTest.result)