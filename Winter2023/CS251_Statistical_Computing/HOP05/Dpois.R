# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP05

#can't get to show a graph
print(dpois(6, 5))

library(dplyr)
library(ggplot2)

set.seed(2)

babies <- data.frame('data' = rpois(365, 4.5))

result <- babies %/% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count/sum(count)),
                     fill = data == 6)) +
  scale_x_continuous(breaks = 0:10) +
  labs(x = 'Number of babies born per period',
       y = 'Porportion',
       title = '365 simulated births in a hospital with Pois(lambda 4.5') +
  theme_bw()

print(result)

print(babies %>% dplyr::summarize(six_babies = sum(babies$data == 6) / n()))