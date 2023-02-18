# Goals:
# 1) To read the cvs file into the program
# 2) Put the relevent informtion into a type of list
# 3) Use the data in the list to find the following things
#     1) most and least common crash related factors
#     2) correlations with poputlation and number of crashes
#     3) correlations with num of crashes and deaths

# Installs Needed Packages
#install.packages("ggplot2")
#install.packages('data.table')
#install.packages('dplyr')
#install.packages("tidyverse")

# Loads needed libaries
library('ggplot2')
library('data.table')
library('dplyr')
library('scales')
library('rstudioapi')

#Functions
find_max <- function(x) {
  return (sort(table(x), decreasing = TRUE)[1])
}

find_min <- function(x) {
  return (sort(table(x), decreasing = FALSE)[1])
}

cleanData <- function(x) {
  x      <- x[!is.na(x)]
  x      <- x[x != "UNKNOWN"]
  return (x)
}

fix_table_CON <- function(dataFrame){
  colnames(dataFrame)[1] <- "Number"
  newDataFrame <- data.frame(Type   = c("", "", ""),
                             Event  = c("", "", ""),
                             Number = c(0, 0, 0))
  rowNames <- rownames(dataFrame)
  number  <- NULL
  counter <- 1

  for (i in rowNames) {
    temp <- unlist(strsplit(i, split="\\."))

    newDataFrame$Type[counter]   <- temp[1]
    newDataFrame$Event[counter]  <- temp[2]
    newDataFrame$Number[counter] <- dataFrame$Number[counter]
    counter <- counter + 1
  }

  return(newDataFrame)
}

# This script expects that the .cvs file will be in the smae folder
# CVS name Traffic_Crashes_-_Crashes.csv
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

FILE <- read.csv("Traffic_Crashes_-_Crashes.csv")
# Vector for crash related factors
road_Condition <- FILE$ROADWAY_SURFACE_COND  # ROADWAY_SURFACE_COND
road_Condition <- cleanData(road_Condition)

light_Conditions <- FILE$LIGHTING_CONDITION    # LIGHTING_CONDITION
light_Conditions <- cleanData(light_Conditions)

weather_Conditions <- FILE$WEATHER_CONDITION     # WEATHER_CONDITION
weather_Conditions <- cleanData(weather_Conditions)

# Variable for Population of Seattle and Number of Crashes
Number_Of_Crashes   <- 690763       # 01/2016 - 12/2022
Number_Of_Years     <- 6 + (11/12)  # 6 years and 11 months
Current_Population  <- 2746388      # Pulled from
                                    # https://www.census.gov/quickfacts/fact/table/chicagocityillinois/POP010220
                                    # on 02/15/2023 1948. Census from April 1st 2020
# Vector for Number of Deaths
list_Of_Fatalities <- FILE$INJURIES_FATAL # INJURIES_FATAL
list_Of_Fatalities <- cleanData(list_Of_Fatalities)

# Goal 1: Conditions
MAX_Condition <- data.frame(c(road = find_max(road_Condition),
                              light = find_max(light_Conditions),
                              weather = find_max(weather_Conditions)))

MIN_Condition <- data.frame(c(road = find_min(road_Condition),
                              light = find_min(light_Conditions),
                              weather = find_min(weather_Conditions)))

MAX_Condition <- fix_table_CON(MAX_Condition)
MIN_Condition <- fix_table_CON(MIN_Condition)

#Making Graphs for goal 1
ggplot(data = MAX_Condition, aes(x=Event, y=Number, fill=Event)) +
  geom_bar(stat = 'identity') +
  scale_y_continuous(labels = scales::comma) +
  ggtitle("Most likely conditions")

ggplot(data = MIN_Condition, aes(x=Event, y=Number, fill=Event)) +
  geom_bar(stat = 'identity') +
  scale_y_continuous(labels = scales::comma) +
    theme(axis.text.x=element_blank()) +
  ggtitle("Least likely conditions")

