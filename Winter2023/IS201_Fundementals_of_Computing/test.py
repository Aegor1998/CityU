ggplot(data.frame(Husband = HEIGHTS$V1, Wife = HEIGHTS$V2), aes(Husband, Wife)) +
  geom_point() + geom_smooth(method = 'lm', se = FALSE) + ggtitle(label = "Graph with line")



ggplot(data.frame(Husband = HEIGHTS$V1, Wife = HEIGHTS$V2), aes(Husband, Wife)) +
  geom_point(color = 'blue') +
  geom_abline(slope = coef(lm(V2 ~ V1, data = HEIGHTS))[2],
              intercept = coef(lm(V2 ~ V1, data = HEIGHTS))[1])  +
  ggtitle(label = "Graph with line")