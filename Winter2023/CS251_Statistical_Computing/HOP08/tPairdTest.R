# Author    : Blake Kucera
# Class     : CS251
# Assignment: HOP08

bp_before <- c(120,122,143,100,109)
bp_after  <- c(122,120,141,109,109)

results <- t.test(x = bp_before,
                  y = bp_after,
                  paired = T)
print(results)