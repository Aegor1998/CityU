result <- binom.test(60, 300, 1/6, alternative = "greater")

print(result)

if (result$p.value > 0.05){
  print("don't reject the null hypoth")
} else {
  print("Reject thje null hypoth")
}

res <- binom.test(48, 100, .5, alternative = "two.sided")

print(res)

if (res$p.value > 0.05){
  print("don't reject the null hypoth")
} else {
  print("Reject thje null hypoth")
}

