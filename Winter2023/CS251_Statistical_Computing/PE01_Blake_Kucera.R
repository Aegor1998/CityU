# Author: Blake Kucera
# Date  : January 12th 2023
# Class : CS251

# Assignment: PE01
#   1 - Using filters, create a vector v1 that contains the elements in v that are either a multiple of 3 or 5. v1 should look like this 
#       (3, 5, 6, 9, 10, 12, 15, ..., 30). 
#   2 - Create another vector v2 by selecting elements in v whose values are greater than 15. v2 should look like this (16, 17, 18, ..., 30) 
#   3 - Calculate the mean of v, v1, and v2. Place the value in the variables v_mean, v1_mean, v2_mean. Print the three variables.
#   4 - Calculate the coefficient of variation (standard deviation / mean) for each vector, place the result in the variables v_cv, v1_cv, v2_cv.
#       Print the three variables. 
#   5 - Create a vector cv_all that contains (v_cv, v1_cv, and v2_cv) 
#   6 - Print the minimum value in cv_all

# Create the base vector
v <- 1:30
# Create the vector with multiples of 3 and 5 and contained in vector v
v1 <- c(v[is.integer(v / 3] = TRUE ) | v[is.integer(v / 5] = TRUE ))
v1 <- unique(v1) #removes duplication (test is this is needed)
# Create the vecotr whoes values are greater than 15 and contained in vector v
v2 <- c(v[v > 15])
# Printing the Vectors
"Vector v: "  + v
"Vector v1: " + v1
"Vector v2: " + v2


# Calculate the Mean of each vector
v_mean  <- mean(v)
v1_mean <- mean(v1)
v2_mean <- mean(v2)
# Print the Mean of each Vector
"Mean of Vector v: "  + v_mean
"Mean of Vector v1: " + v1_mean
"Mean of Vector v2: " + v2_mean

# Calculate the Coefficient of Variation of each Vector
v_cv  <- sd(v)/v_mean
v1_cv <- sd(v1)/v1_mean
v2_cv <- sd(v2)/v2_mean
# Print the Coefficient of Variation of each Vector
"Coefficient of Variation of Vector v: "  + v_cv
"Coefficient of Variation of Vector v1: " + v1_cv
"Coefficient of Variation of Vector v2: " + v2_cv

# Create cv_all
cv_all <- c(v_cv, v1_cv, v2_cv)
# Print the lowest Coefficient of Variation between all Vectors
"The lowest Coefficient of Variation is " + min(cv_all)
