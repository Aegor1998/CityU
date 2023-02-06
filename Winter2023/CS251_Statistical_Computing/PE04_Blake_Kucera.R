# Author: Blake Kucera
# Class: CS251
#Assignment: PE04: Programming Exercise

#Part 1:
# Initialize a variable with all the possible sums of the results of rolling two
# dice simultaneously (i.e.: 2 to 12)
twoDieSums <- 2:12

#Part 2:
# For each of the numbers in part 1 calculate the probability that when rolling two
# dice simultaneously that will be the result (i.e.: for 2 is 2, for 3 is 2, etc
probList <- NULL #To look up x = wanted position - 1
counter <- 1
while (counter < 12){
  probList[counter] <- 1/9 #Probability of 2 dies for any given possible value is 1/9
  counter <- counter + 1
}
# Part 3:
# Create a bar plot of the numbers in 2 by the numbers in 1.
# "numbers in 2 by the numbers in 1" does not explain what you want.
data <- data.frame(prob = probList, sum = twoDieSums)
barplot(table(data), main = "Sum Chance From Two Fair Dice",
        xlab = "Dice Pair Value")

#Part 4:
# Calculate the following:

#Part 4a:
# What are the chances of getting a sum of 6?
print("The chances of getting a sum of 6 is: ", probList[5])

#Part 4b:
# What is/are the most likely sum/s?
print("Assuming that these are fair dice all sums are equally as likely, 1/9")

#Part 4c:
# What is/are the least likely sum/s?
print("Assuming that these are fair dice all sums are equally as likely, 1/9")

#Part 4d:
# What are the chances of rolling a 10 twice in a row?
cat("The probability of rolling a sum of 10 twice is: ", probList[9] * probList[9])
