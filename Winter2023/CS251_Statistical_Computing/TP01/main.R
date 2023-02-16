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

# Loads needed libaries
library('ggplot2')
library('data.table')
library('dplyr')

#Functions
find_max <- function(x) {
  return (sort(table(x), decreasing = TRUE)[1])
}

find_min <- function(x) {
  return (sort(table(x), decreasing = FALSE)[1])
}



# CVS name Traffic_Crashes_-_Crashes.csv
FILE <- read.csv("Traffic_Crashes_-_Crashes.csv")
# Vector for crash related factors
road_Condition      <- FILE$ROADWAY_SURFACE_COND  # ROADWAY_SURFACE_COND
road_Condition      <- road_Condition[!is.na(road_Condition)]
road_Condition      <- road_Condition[road_Condition != "UNKNOWN"]

light_Conditions      <- FILE$LIGHTING_CONDITION    # LIGHTING_CONDITION
light_Conditions      <- light_Conditions[!is.na(light_Conditions)]
light_Conditions      <- light_Conditions[light_Conditions != "UNKNOWN"]

weather_Conditions      <- FILE$WEATHER_CONDITION     # WEATHER_CONDITION
weather_Conditions      <- weather_Conditions[!is.na(weather_Conditions)]
weather_Conditions      <- weather_Conditions[weather_Conditions != "UNKNOWN"]

# Variable for Population of Seattle and Number of Crashes
Number_Of_Crashes   <- 690763       # 01/2016 - 12/2022
Number_Of_Years     <- 6 + (11/12)  # 6 years and 11 months
Current_Population  <- 2746388      # Pulled from
                                    # https://www.census.gov/quickfacts/fact/table/chicagocityillinois/POP010220
                                    # on 02/15/2023 1948. Census from April 1st 2020
# Vector for Number of Deaths
list_Of_Fatalities <- fread("Traffic_Crashes_-_Crashes.csv", select = "INJURIES_FATAL") # INJURIES_FATAL

# Goal 1: Conditions
MAX_Condition <- data.frame(c(road = find_max(road_Condition),
                            light = find_max(light_Conditions),
                            weather = find_max(weather_Conditions)))
colnames(MAX_Condition)[1] ="# Of Events"

