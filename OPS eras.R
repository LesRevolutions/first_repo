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


# THIRD ERA: 1990-1999
# Step 2: Extract the 1990s era from the main tibble
war_1990s <- war_daily %>% dplyr::filter(year_ID >= 1990 & year_ID <= 1999 & PA >= 502)
war_1990s
war_1990s$OPS_plus <- as.numeric(as.character(war_1990s$OPS_plus))

# Step 2: 2000s plot
base1990s <- ggplot(war_1990s, aes(x = year_ID, y = OPS_plus)) + geom_point() + 
  scale_x_continuous(n.breaks = 9, name = "Season") + scale_y_continuous("OPS+", limits = c(0, 300))
plot1990s <- base1990s + theme_classic()
plot1990s






# REMAINING ERAS: 1980s, 1970s, 1960s
# 1980-1989
war_1980s <- war_daily %>% dplyr::filter(year_ID >= 1980 & year_ID <= 1989 & PA >= 502)
war_1980s$OPS_plus <- as.numeric(as.character(war_1980s$OPS_plus))

base1980s <- ggplot(war_1980s, aes(x = year_ID, y = OPS_plus)) + geom_point() + 
  scale_x_continuous(n.breaks = 9, name = "Season") + scale_y_continuous("OPS+", limits = c(0, 300))
plot1980s <- base1980s + theme_classic()
plot1980s



# 1970-1979
war_1970s <- war_daily %>% dplyr::filter(year_ID >= 1970 & year_ID <= 1979 & PA >= 502)
war_1970s$OPS_plus <- as.numeric(as.character(war_1970s$OPS_plus))

base1970s <- ggplot(war_1970s, aes(x = year_ID, y = OPS_plus)) + geom_point() + 
  scale_x_continuous(n.breaks = 9, name = "Season") + scale_y_continuous("OPS+", limits = c(0, 300))
plot1970s <- base1970s + theme_classic()
plot1970s



# 1960-1969
war_1960s <- war_daily %>% dplyr::filter(year_ID >= 1960 & year_ID <= 1969 & PA >= 502)
war_1960s$OPS_plus <- as.numeric(as.character(war_1960s$OPS_plus))

base1960s <- ggplot(war_1960s, aes(x = year_ID, y = OPS_plus)) + geom_point() + 
  scale_x_continuous(n.breaks = 9, name = "Season") + scale_y_continuous("OPS+", limits = c(0, 300))
plot1960s <- base1960s + theme_classic()
plot1960s
