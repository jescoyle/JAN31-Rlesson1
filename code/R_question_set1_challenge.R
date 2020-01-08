## R Question Set 1 - Challenge Version
## Name: 


## Instructions:
## Write R code that completes each of the following problems.
## You may want to copy and paste the code that you already
## wrote during the in-class lesson. Then, modify the code 
## as needed.
## Turn in on Moodle: 
##   1) the pdfs showing the figures that you generated
##      with your code.
##   2) this file with your code saved in it. 
## This exercise should be your own work. Please do not just copy
## someone elses work and turn it in. You may work together, but
## you should each complete the work on your own computer.

# Load packages
library(dplyr)
library(ggplot2)



## Problem 1:
##   Using the data from the file AQI_pollutants_CA_2019_daily.csv,
##   create a dataframe (a table in R) that shows the maximum
##   daily air quility index (DAILY_AQI_VALUE) across all pollutants
##   for each day in 2019 in Oakland and in San Francisco. Your final 
##   table should have three columns: Date, Site.Name and AQI_max.
##
##   Start by reading in the csv file. Then convert the Date
##   column from text to actual dates (code provided- fill in the blanks).
##   Then use filter(), group_by() and summarize() to make the table.

# Read in the data



# Convert the Date column from text to actual dates so that
# these end up in the correct order
problem1_data <- ____________ %>%
  mutate(Date = as.Date(_______, format = "%m/%d/%Y"))


# Make the table






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



# Make the graph





# Save the graph





