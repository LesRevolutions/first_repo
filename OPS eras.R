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

base2010s <- ggplot(war_2010s, aes(x = year_ID, y = OPS_plus)) + geom_point() + scale_x_continuous(n.breaks = 9, "Season") + scale_y_continuous("OPS+")
plot2010s <- base2010s + theme_classic()
plot2010s
