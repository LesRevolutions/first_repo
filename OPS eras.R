library(tidyverse)
library(magrittr)
library(dplyr)
library(readxl)
library(writexl)
library(ggplot2)

war_daily <- read_xlsx("C:/Users/Stevanus/Downloads/war_daily_bat.xlsx")
war_daily

# Clear the rows whose Plate Appearances section is NULL and convert from chars to num
war_daily <- na.omit(war_daily, cols = 'PA')
war_daily$PA <- as.numeric(as.character(war_daily$PA))

# Check data type
str(war_daily$PA)
str(war_daily$year_ID)


# FIRST ERA: 2010-2019
# Step 1: Separate the 2010s era from the main tibble
war_2010s <- war_daily %>% dplyr::filter(year_ID >= 2010 & year_ID <= 2019 & PA >= 502)
war_2010s
war_2010s$OPS_plus <- as.numeric(as.character(war_2010s$OPS_plus))

# Step 2: 2010s plot
base2010s <- ggplot(war_2010s, aes(x = year_ID, y = OPS_plus)) + geom_point() + 
  scale_x_continuous(n.breaks = 9, name = "Season") + scale_y_continuous("OPS+", limits = c(0, 300))
plot2010s <- base2010s + theme_classic()
plot2010s


# SECOND ERA: 2000-2009
# Step 2: Extract the 2000s era from the main tibble
war_2000s <- war_daily %>% dplyr::filter(year_ID >= 2000 & year_ID <= 2009 & PA >= 502)
war_2000s
war_2000s$OPS_plus <- as.numeric(as.character(war_2000s$OPS_plus))

# Step 2: 2000s plot
base2000s <- ggplot(war_2000s, aes(x = year_ID, y = OPS_plus)) + geom_point() + 
  scale_x_continuous(n.breaks = 9, name = "Season") + scale_y_continuous("OPS+", limits = c(0, 300))
plot2000s <- base2000s + theme_classic()
plot2000s


# SECOND ERA: 1990-1999
# Step 2: Extract the 1990s era from the main tibble
war_1990s <- war_daily %>% dplyr::filter(year_ID >= 1990 & year_ID <= 1999 & PA >= 502)
war_1990s
war_1990s$OPS_plus <- as.numeric(as.character(war_1990s$OPS_plus))

# Step 2: 2000s plot
base1990s <- ggplot(war_1990s, aes(x = year_ID, y = OPS_plus)) + geom_point() + 
  scale_x_continuous(n.breaks = 9, name = "Season") + scale_y_continuous("OPS+", limits = c(0, 300))
plot1990s <- base1990s + theme_classic()
plot1990s
