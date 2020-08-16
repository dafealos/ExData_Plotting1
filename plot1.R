library(readr)
library(dplyr)
library(lubridate)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                       Time = col_time(format = "%H:%M:%S")), 
                                          trim_ws = TRUE)

head(consumption)

#2007-02-01 and 2007-02-02

consumption <- household_power_consumption %>%  filter(Date == "2007-02-01" | Date == "2007-02-02")

?plot
with(consumption, hist(Global_active_power, col = "red", 
                       xlab = "Global Active Power (Kilowatts)",
                       main = "Global Active Power"))

file()
