# Author    : Blake Kucera
# Class     : CS251
# Assignment: HOP08

mc1 <- c(150,151,152,152,151,150)
mc2 <- c(153,152,148,151,149,152)
mc3 <- c(156,154,155,156,157,155)

volume <- c(mc1, mc2, mc3)

machine <- rep(c("machine1", "machine2", "machine3"),
               times = c(length(mc1), length(mc2),
                         length(mc3)))

vol_mc <- data.frame(volume, machine)
print(vol_mc)

mc_aov <- aov(data = vol_mc,
              formula = volume ~ machine)

boxplot(mc1,mc2,mc3)

print(TukeyHSD(x = mc_aov))