## R Question Set 1
## Name: 


## Instructions:
## Write R code that completes each of the following problems.
## All of the steps are provided below, but you must fill in the
## blanks (_________) to make code that runs.
##
## Turn in on Moodle: 
##   1) the pdfs showing the figures that you generated
##      with your code.
##   2) this file with your code saved in it. 
## This exercise should be your own work. Please do not just copy
## someone elses work and turn it in. You may work together, but
## you should each complete the work on your own computer.


## Problem 1:
##   Using the data from the file AQI_pollutants_CA_2019_daily.csv,
##   create a dataframe (a table in R) that shows the maximum
##   daily air quility index (DAILY_AQI_VALUE) across all pollutants
##   for each day in 2019 in Oakland and in San Francisco. Your final 
##   table should have three columns: Date, Site.Name and AQI_max.
##
##   Hint: Start by reading in the csv file. Then use filter(), group_by()
##   and summarize() to make the table.

# Load packages
library(dplyr)
library(ggplot2)

# Read in the data
AQIdat <- read.csv("data/___________________.csv")

# Load packages
library(dplyr)
library(ggplot2)

# Convert the Date column from text to actual dates so that
# these end up in the correct order
problem1_data <- ____________ %>%
  mutate(Date = as.Date(_______, format = "%m/%d/%Y"))


# Define the two sites that you want to look at data from
use_sites <- c("___________", "__________")


# Subset the data to only be at the two sites in use_sites
# Then calculate maximum DAILY_AQI_VALUE across all pollutants
# within each Date and Site
problem1_data <-  ___________ %>%
  filter(___________ %in% __________) %>%
  group_by(___________, Site.Name) %>%
  summarize(AQI_max = ____________________)


## Problem 2:
##   Use the dataframe you created in problem 1.
##   Make a line graph that shows how the maximum daily AQI across all
##   pollutants varied throughout 2019 in Oakland and San Francisco.
##   Data for both cities should be on the same graph with different
##   line colors differentiating the cities. 
##
##   Your graph should look similar to the one we made in class 
##   comparing AQI for ozone in San Francisco and San Ramon.
##
##   Once you have generated the graph, save it as a pdf and download it to
##   you computer.

# Create the line graph
problem1_data %>%
  ggplot(aes(x = _______, y = _________, ______ = Site.Name)) +
    __________() +
    labs(x = _____________,
         y = _____________,
         color = _________) +
  scale_color_manual(values = c("____________" = "red", "_________" = "blue"))


# Save the graph
__________("Maximum daily AQI in SF and Oakland.pdf",
           width = _____,
           height = _____,
           units = "in")








