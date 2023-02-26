# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP07

setwd("/home/bkucera/PycharmProjects/CityU/Winter2023/CS251_Statistical_Computing/HOP07")

data <- read.csv(file = 'iris2.csv', header = TRUE, sep = ",")

print(na.omit(data))