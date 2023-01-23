# Author: Blake Kucera

#function that does all the computation
descriptive_function <- function (list=rivers, letter, number){ #have no idea what number would be used for
  if(letter == 'm'){ # returns mean of list
    return(mean(list))
} else if(letter == 'v'){# returns variation of list
    return(var(list))
} else if(letter == 's'){# returns stadard deviaiton of list
    return(sd(list))
} else if(letter == 'z'){# returns z-score of list
    return((list - mean(list))/sd(list))
} else {# attempt at error catching
    print("improper letter passed")
    break
  }}

cat("The mean of the Rivers Data Set             : ", descriptive_function(,'m'), "\n")
cat("The variance of the Rivers Data Set         : ", descriptive_function(,'v'), "\n")
cat("The stadard deviation of the Rivers Data Set: ", descriptive_function(,'s'), "\n")
cat("The z-score of the Rivers Data Set          : \n", descriptive_function(,'z'))
