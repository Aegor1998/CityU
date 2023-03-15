# Author    : Blake Kucera
# Class     : CS251
# Assignment: PE09

library(package = 'rstudioapi')
library(package = 'ggplot2')

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

HEIGHTS <- read.table(file = "./Heights.txt")
HEIGHTS <- HEIGHTS[-1,]

plot(x = HEIGHTS$V1, y = HEIGHTS$V2)

model <- lm(HEIGHTS$V2 ~ HEIGHTS$V1)

#For some reason this refuses to draw a regression line
ggplot(data.frame(Husband = HEIGHTS$V1, Wife = HEIGHTS$V2), aes(Husband, Wife)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', se = FALSE, color = 'red') +
  ggtitle(label = "Graph with line")


heights.lm <- lm(HEIGHTS$V2 ~ HEIGHTS$V1)
#print(as.data.frame(heights.lm$coefficients))
#For some reason this refuses to draw a regression line
ggplot(data = HEIGHTS, aes(x = V1, y = V2)) +
  geom_point() +
  geom_abline(intercept = heights.lm$coefficients[1], slope = heights.lm$coefficients[2]) +
  ggtitle("Scatter plot with fitted line")

summary(heights.lm)

summary(heights.lm)$r.squared

se <- summary(heights.lm)$sigma * sqrt(diag(summary(heights.lm)$varcov))

wife_T <- heights.lm$coefficients[2] / se[2]

wife_P <- 2 * pt(abs(wife_T), df = heights.lm$df.residual, lower.tail = FALSE)

if (!is.na(wife_P) && wife_P < 0.01) {
  cat("The coefficient of Wife is significant at the 1% level.\n")
} else {
  cat("The coefficient of Wife is not significant at the 1% level.\n")
}

plot(x = fitted(heights.lm), y = residuals(heights.lm), xlab = "Fitted values", ylab = "Residuals")
abline(h = 0)