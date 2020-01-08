# Intro to R
# Jes Coyle

############################# Part 1 ###################################


## Arithmatic

2 * 3

2*3  # spaces don't matter

2 *
  3  # can continue across lines: notice console prompt

3^2

3^2+1 # follows order of operations

3^(2+1)

10*(sqrt(9)) # has all math functions


## Objects

number3 <- 3     # makes object named number3 that is an integer with the value 3
letter3 <- "3"   # makes object named letter3 that is the character 3

number3 + number3
number3 + letter3  # error when trying to add integer to character


nums <- c(1,2,3,4,5)  # a vector of integers
nums <- 1:5
name_letters <- c("C", "o", "y", "l", "e")  # a vector of letters

c(nums, name_letters)  # combining makes the integers into characters

## Dataframes
myname <- data.frame(nums, name_letters)
myname <- data.frame(position = nums, letter = name_letters)

## Saving code:
# 1. Open a existing script with folder icon or
#    make a new script with plus page icon.
# 2. Type the code into the script and type ctrl+enter to run lines
# 3. Save script using save button into code folder

## Read in the data

AQIdat <- read.csv("data/AQI_pollutants_CA_2019_daily.csv")


## Which pollutants and sites are in the data?
names(AQIdat)   # give quick output of column names

AQIdat$Site.Name  # $ displays just one column in dataframe

unique(AQIdat$Site.Name) # shows levels of factor
unique(AQIdat$Pollutant)

unique(AQIdat$CBSA_NAME)

## Load packages
library(dplyr)
library(ggplot2)

## Subset data to just Bay Area sites
AQIdat_SFBay <- filter(AQIdat, CBSA_NAME == "San Francisco-Oakland-Hayward, CA")

## How much data is there on each pollutant at each location?
count(AQIdat_SFBay, Site.Name)   # counts number of rows at each level of Site.Name
SFBay_summary <- count(AQIdat_SFBay, Site.Name, Pollutant) # counts number of rows at each level of Site.Name and Pollutant

## Exercise: make a table that only shows sites where ozone (O3) was measured.
filter(SFBay_summary, Pollutant == "O3")

AQIdat_SFBay %>%            # pipe (%>%) sends output from one line into first argument of next line
  count(Site.Name, Pollutant) %>%
  filter(Pollutant == "O3")

## Exercise: Fill in blanks to create a dataframe named plot_dat that only contains observations of ozone in San Francisco and San Ramon.
use_sites <- c("San Francisco", "San Ramon")

plot_dat <- AQIdat %>%
  filter(Site.Name %in% use_sites) %>%
  filter(Pollutant == "O3")

## Plot AQI for ozone versus date for each site

# Doesn't put dates in correct order because R thinks they are text
plot_dat %>%
  filter(Site.Name == "San Francisco") %>%
  ggplot(aes(x = Date, y = DAILY_AQI_VALUE)) +
  geom_point()

# Convert dates
plot_dat <- plot_dat %>%
  mutate(Date = as.Date(Date, format = "%m/%d/%Y"))

# Final plot for San Francisco
plot_dat %>%
  filter(Site.Name == "San Francisco") %>%
  ggplot(aes(x = Date, y = DAILY_AQI_VALUE)) +
  geom_line() +
  labs(x = "",
       y = "Ozone Daily AQI") +
  theme_bw()

# Both locations on the same plot with different colors for each line
plot_dat %>%
  ggplot(aes(x = Date, y = DAILY_AQI_VALUE, color = Site.Name)) +
    geom_line() +
    labs(x = "",
         y = "Ozone Daily AQI",
         color = "Location") +
    theme_bw() +
    scale_color_manual(values = c("San Francisco" = "red", "San Ramon" = "blue")) + 
    theme(panel.grid.minor = element_blank())


############################# Part 2 ###################################

## Goal: Calculate average and maximum 2019 AQI for each pollutant at each site 
##       and display in paneled bar graph.

SFBay_summary

## Calculate average and max AQI values across all of the pollutants and sites
AQIdat_SFBay %>%
  summarize(AQI_avg = mean(DAILY_AQI_VALUE),
            AQI_max = max(DAILY_AQI_VALUE))

# Exercise: Calculate average and max AQI values only across Concord ozone data
AQIdat_SFBay %>%
  filter(Site.Name == "Concord") %>%
  summarize(AQI_avg = mean(DAILY_AQI_VALUE),
            AQI_max = max(DAILY_AQI_VALUE))


## Group data by site and pollutant and then summarize within groups
SFBay_summary <- AQIdat_SFBay %>%
  group_by(Site.Name, Pollutant) %>%
  summarize(AQI_avg = mean(DAILY_AQI_VALUE),
            AQI_max = max(DAILY_AQI_VALUE))



## Bar chart of average daily AQI of ozone across Bay Area sites

SFBay_summary %>%
  filter(Pollutant == "O3") %>%
  ggplot(aes(x = Site.Name, y = AQI_avg)) +
  geom_col() +
  coord_flip() +
  labs(x = "",
       y = "Average Annual AQI")


## Multipanel chart showing one pollutant in each panel.

SFBay_summary %>%
  ggplot(aes(x = Site.Name, y = AQI_avg)) +
  geom_col() +
  coord_flip() +
  labs(x = "",
       y = "Average Annual AQI") +
  facet_wrap(~ Pollutant)


## Saves the most recently generated figure
ggsave("figures/SFBay avg annual AQI.pdf",
       width = 6,
       height = 5,
       units = "in")


