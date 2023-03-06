# Author    : Blake Kucera
# Class     : CS251
# Assignment: HOP08

library(BSDA)


setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
View(perf_vol_2Samples)

zTest <- z.test(x = perf_vol_2Samples$Machine1,
                y = perf_vol_2Samples$Machine2,
                sigma.x = sd(perf_vol_2Samples$Machine1),
                sigma.y = sd(perf_vol_2Samples$Machine2),
                mu = -1.0)

print(zTest)