# Author:     Blake Kucera
# Class:      CS251
# Assignment: HOP05

library(dplyr)
library(ggplot2)

#this assumes lambda has been passed
prob_pois <- function(x, lambda) {
  #exp() stands for e raised to some number
  #esp(1) == e
  top <- (lambda^x) * exp(-lambda)
  bottom <- factorial(x)
  return (top/bottom)
}

#This assumes x is a vector
cum_pois <- function(x, lambda) {
  cpoic <- 0
  for (i in x) {
    cpoic <- cpoic + prob_pois(i, lambda)
  }
  return (cpoic)
}