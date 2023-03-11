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

#General functions
cleanData <- function(x) {
  x      <- x[!is.na(x)]
  x      <- x[x != "UNABLE TO DETERMINE"]
  return (x)
}
find_max <- function(x) {
  Event <- cleanData(x)
  return ((sort(table(Event), decreasing = TRUE)[1:5]))
}

#Crashes over time histogram (Base)
hist_Crash_Time <- function(){
  #Events By Year
  Crash_Event_Year <- ggplot(DATA, aes(x = Year)) + geom_histogram(stat="count", color = 'orange', fill = 'red') +
    ggtitle(label = "Events By Year")
  #Events By Month
  Crash_Event_Month <- ggplot(DATA, aes(x = Month)) + geom_histogram(stat="count", color = 'orange', fill = 'blue') +
    scale_x_continuous(breaks = seq(1, 12, by=1)) + ggtitle(label = "Events By Month")
  #Events By Day of the Week
  Crash_Event_Day <- ggplot(DATA, aes(x = Day)) + geom_histogram(stat="count", color = 'black', fill = 'red') +
    scale_x_continuous(breaks = seq(1, 7, by=1)) + ggtitle(label = "Events By Day")
  #Events By Hour
  Crash_Event_Hour <- ggplot(DATA, aes(x = Hour)) + geom_histogram(stat="count", color = 'black', fill = 'blue') +
    scale_x_continuous(breaks = seq(1, 23, by=1)) + ggtitle(label = "Events By Hour")
  #Save Graphs to File
  ggsave(filename = "Crash_Event_Year.png" , plot = Crash_Event_Year)
  ggsave(filename = "Crash_Event_Month.png", plot = Crash_Event_Month)
  ggsave(filename = "Crash_Event_Day.png"  , plot = Crash_Event_Day)
  ggsave(filename = "Crash_Event_Hour.png" , plot = Crash_Event_Hour)
  #ggsave(filename = ".png", plot = )


}
#Events over time histogram (Overlay)
hist_Crash_Overlay <- function (){
  #Month Overlayed by Year
 Month_by_Year_Overlay <- ggplot() +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2015], fill = "2015")) +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2016], fill = "2016")) +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2017], fill = "2017")) +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2018], fill = "2018")) +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2019], fill = "2019")) +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2020], fill = "2020")) +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2021], fill = "2021")) +
   geom_histogram(aes(x = DATA$Month[DATA$Year == 2022], fill = "2022")) +
   scale_x_continuous(breaks = seq(1, 12, by=1), ) + scale_y_continuous(breaks = seq( 0, 11000,by = 500)) +
   ggtitle(label = "Months Overlayed by Year") + xlab(label ="Month")
 #Day Overlayed by Year
 Day_by_Year_Overlay <- ggplot() +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2015], fill = "2015")) +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2016], fill = "2016")) +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2017], fill = "2017")) +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2018], fill = "2018")) +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2019], fill = "2019")) +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2020], fill = "2020")) +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2021], fill = "2021")) +
   geom_histogram(aes(x = DATA$Day[DATA$Year == 2022], fill = "2022")) +
   scale_x_continuous(breaks = seq(1, 7, by=1), ) + ggtitle(label = "Days Overlayed by Year") + xlab(label ="Days")
 #Day Overlayed by Year
 Hour_by_Year_Overlay <- ggplot() +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2015], fill = "2015")) +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2016], fill = "2016")) +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2017], fill = "2017")) +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2018], fill = "2018")) +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2019], fill = "2019")) +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2020], fill = "2020")) +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2021], fill = "2021")) +
   geom_histogram(aes(x = DATA$Hour[DATA$Year == 2022], fill = "2022")) +
   scale_x_continuous(breaks = seq(1, 23, by=1), ) + ggtitle(label = "Hour Overlayed by Year") + xlab(label ="Hour")
  Day_by_Year_Overlay
  #Save to File
  ggsave(filename = "Month_by_Year_Overlay.png", plot = Month_by_Year_Overlay)
  ggsave(filename = "Day_by_Year_Overlay.png"  , plot = Day_by_Year_Overlay)
  ggsave(filename = "Hour_by_Year_Overlay.png" , plot = Hour_by_Year_Overlay)

}
#Primary/Secondary Contr. Graphs (Base)
PriSecGraphs <- function (){ #Looking for an answer
  primary   <- data.frame(Year = DATA$Year, Primary = DATA$Primary_Cause)
  secondary <- data.frame(Year = DATA$Year, Secondary = DATA$Secondary_Cause)

  TopNames <- find_max(primary$Primary)
  TopNames <- frame(TopNames)
  view(TopNames)
  Pri_Graph <- ggplot(TopNames, aes(x = Event)) + geom_histogram(color = 'orange', fill = 'red') +
    ggtitle(label = "Top Primary Causes")
  Pri_Graph
}
#Injuries over time histogram (Base)
hist_Injuries_Time <- function(){
  #Formating
  Injuries <- data.frame(Year = DATA$Year, Month = DATA$Month, Day = DATA$Day,
                         Hour = DATA$Hour, Injuries = DATA$Injuries)
  Injuries <- Injuries[Injuries$Injuries != 0, ]
    #Events By Year
  Injuries_Event_Year <- ggplot(Injuries, aes(x = Year)) + geom_histogram(stat="count",
                                                                       color = 'orange', fill = 'red') +
    ggtitle(label = "Events By Year")
  #Events By Month
  Injuries_Event_Month <- ggplot(Injuries, aes(x = Month)) + geom_histogram(stat="count",
                                                                          color = 'orange', fill = 'blue') +
    scale_x_continuous(breaks = seq(1, 12, by=1)) + ggtitle(label = "Events By Month")
  #Events By Day of the Week
  Injuries_Event_Day <- ggplot(Injuries, aes(x = Day)) + geom_histogram(stat="count",
                                                                     color = 'black', fill = 'red') +
    scale_x_continuous(breaks = seq(1, 7, by=1)) + ggtitle(label = "Events By Day")
  #Events By Hour
  Injuries_Event_Hour <- ggplot(Injuries, aes(x = Hour)) + geom_histogram(stat="count",
                                                                       color = 'black', fill = 'blue') +
    scale_x_continuous(breaks = seq(1, 23, by=1)) + ggtitle(label = "Events By Hour")
  #Save Graphs to File
  ggsave(filename = "Injuries_Event_Year.png" , plot = Injuries_Event_Year)
  ggsave(filename = "Injuries_Event_Month.png", plot = Injuries_Event_Month)
  ggsave(filename = "Injuries_Event_Day.png"  , plot = Injuries_Event_Day)
  ggsave(filename = "Injuries_Event_Hour.png" , plot = Injuries_Event_Hour)
}
#Events over time histogram (Overlay)
hist_Injuries_Overlay <- function () {
  #Formating
  Injuries <- data.frame(Year = DATA$Year, Month = DATA$Month, Day = DATA$Day,
                         Hour = DATA$Hour, Injuries = DATA$Injuries)
  Injuries <- Injuries[Injuries$Injuries != 0, ]
  #Month Overlayed by Year
 Month_by_Year_Overlay <- ggplot() +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2015], fill = "2015")) +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2016], fill = "2016")) +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2017], fill = "2017")) +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2018], fill = "2018")) +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2019], fill = "2019")) +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2020], fill = "2020")) +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2021], fill = "2021")) +
   geom_histogram(aes(x = Injuries$Month[Injuries$Year == 2022], fill = "2022")) +
   scale_x_continuous(breaks = seq(1, 12, by=1), ) + scale_y_continuous(breaks = seq( 0, 11000,by = 500)) +
   ggtitle(label = "Injuries Months Overlayed by Year") + xlab(label ="Month")
 #Day Overlayed by Year
 Day_by_Year_Overlay <- ggplot() +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2015], fill = "2015")) +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2016], fill = "2016")) +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2017], fill = "2017")) +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2018], fill = "2018")) +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2019], fill = "2019")) +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2020], fill = "2020")) +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2021], fill = "2021")) +
   geom_histogram(aes(x = Injuries$Day[Injuries$Year == 2022], fill = "2022")) +
   scale_x_continuous(breaks = seq(1, 7, by=1), ) + ggtitle(label = "Injuries Days Overlayed by Year") +
   xlab(label ="Days")
 #Day Overlayed by Year
 Hour_by_Year_Overlay <- ggplot() +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2015], fill = "2015")) +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2016], fill = "2016")) +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2017], fill = "2017")) +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2018], fill = "2018")) +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2019], fill = "2019")) +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2020], fill = "2020")) +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2021], fill = "2021")) +
   geom_histogram(aes(x = Injuries$Hour[Injuries$Year == 2022], fill = "2022")) +
   scale_x_continuous(breaks = seq(1, 23, by=1), ) + ggtitle(label = "Injuries Hour Overlayed by Year") +
   xlab(label ="Hour")
  Day_by_Year_Overlay
  #Save to File
  ggsave(filename = "Injuries_Month_by_Year_Overlay.png", plot = Month_by_Year_Overlay)
  ggsave(filename = "Injuries_Day_by_Year_Overlay.png"  , plot = Day_by_Year_Overlay)
  ggsave(filename = "Injuries_Hour_by_Year_Overlay.png" , plot = Hour_by_Year_Overlay)

}
# This script expects that the .cvs file will be in the smae folder
# CVS name Traffic_Crashes_-_Crashes.csv
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Decided not to take INJURIES_FATAL because the number is too small
FILE <-fread(file = "../TPO3/Traffic_Crashes_-_Crashes.csv", select = c("CRASH_DATE", "CRASH_HOUR",
                                                                        "CRASH_DAY_OF_WEEK", "CRASH_MONTH",
                                                                        "INJURIES_TOTAL",
                                                                        "PRIM_CONTRIBUTORY_CAUSE", "SEC_CONTRIBUTORY_CAUSE"))
#view(FILE)
#Extracting the year
Extracted_Year <- format(as.POSIXct(FILE$CRASH_DATE, format = "%m/%d/%Y %H:%M:%S"), format="%Y")
#Formating the Data into a better form
DATA <- data.frame(Year = Extracted_Year, Month = FILE$CRASH_MONTH, Day = FILE$CRASH_DAY_OF_WEEK,
                   Hour = FILE$CRASH_HOUR, Injuries = FILE$INJURIES_TOTAL,
                   Primary_Cause = FILE$PRIM_CONTRIBUTORY_CAUSE, Secondary_Cause = FILE$SEC_CONTRIBUTORY_CAUSE)
#Sorting By Date
setorder(DATA, cols = "Year")
#Removing Entries before 2015
DATA <- DATA[DATA$Year != 2013, ]
DATA <- DATA[DATA$Year != 2014, ]
#Removing Entries from 2023
DATA <- DATA[DATA$Year != 2023, ]

hist_Crash_Time()
hist_Crash_Overlay()
PriSecGraphs()
hist_Injuries_Time()
hist_Injuries_Overlay()