# This is a comment because it starts with  #
# If you try to run these lines of code, nothing will happen.
# Replace this text with a title and your name.



####################### Part 1 #########################

## Read in the data

read.csv("data/AQI_pollutants_CA_2019_daily.csv")


## Load packages ggplot2 and dplyr

library()

## Goal: Make a plot that shows how the AQI for one pollutant 
##       varied throughout 2019 at two different locations in California.


## Which pollutants and sites are in the data?
names()

unique()

## Subset data to just Bay Area sites
filter(AQIdat, CBSA_NAME == "San Francisco-Oakland-Hayward, CA")


## How much data is there on each pollutant at each location?
count()

## Exercise: make a table based that only shows sites where ozone (O3) was measured.



## Exercise: Fill in blanks to create a dataframe that only contains observations of ozone in San Francisco and San Ramon.
use_sites <- c("San Francisco", "___________")

____________ <- AQIdat %>%
  filter(Site.Name %in% use_sites) %>%
  filter(Pollutant == _____)

## Plot AQI for ozone versus date for each site

# Convert date text to actual dates
plot_dat <- plot_dat %>%
  mutate(Date =       )

# San Francisco
plot_dat %>%
  filter(Site.Name == "San Francisco") %>%
  ggplot(aes(x =      , y =      )) 


# San Ramon



# Both locations on the same plot with different colors for each line



  

## Exercise: Make a plot that compares the AQI of a different pollutant 
##           between two locations in the SF Bay Area.





####################### Part 2 #########################

## Goal: Calculate average and maximum 2019 AQI for each pollutant at each site 
##       and display in paneled bar graph.

SFBay_summary

## Calculate average and max AQI values across all of the pollutants and sites
AQIdat_SFBay %>%
  summarize(AQI_avg = mean(),
            AQI_max = max())


# Exercise: Calculate average and max AQI values only across Concord ozone data


## Group data by site and pollutant and then summarize within groups
AQIdat_SFBay %>%
  group_by() %>%
  summarize()


## Bar chart of average daily AQI of ozone across Bay Area sites
SFBay_summary %>%
  filter() %>%
  ggplot(aes(x = , y = )) 



## Multipanel chart showing average annual AQI with one pollutant in each panel.





# Saving figures
ggsave("figures/SFBay avg annual AQI.pdf",
       width = 6,
       height = 5,
       units = "in")















