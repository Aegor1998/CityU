# Author    : Blake Kucera
# Class     : CS251
# Assignment: HOP08

mc1 <- c(150,150,151,149,151,151,148,151)
mc2 <- c(152,146,152,150,155)

results <- var.test(x = mc2, y = mc1,
                    ratio = 1, conf.level = 0.90)

print(results)

Fcal <- var(mc2)/var(mc1)
print(Fcal)

Fcrit <- qf(p = 0.05, df1 = 4,
            df2 = 7, lower.tail = F)
print(Fcrit)