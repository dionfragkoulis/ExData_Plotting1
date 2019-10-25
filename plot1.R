## Initialisation
library(dplyr)
library(lubridate)

## Download and unzip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "household_power_consumption.zip")
unzip("household_power_consumption.zip")

## Read the data file and select only required dates
allMeterReadings <- read.delim("household_power_consumption.txt", sep = ";")
twoDaysMeterRading <- filter(allMeterReadings, Date == "1/2/2007" | Date == "2/2/2007")
remove(allMeterReadings)

## Manipulate data set
twoDaysMeterRading <- twoDaysMeterRading %>% 
  mutate(Global_active_power = as.numeric(as.character(Global_active_power))) %>%
  mutate(Global_reactive_power = as.numeric(as.character(Global_reactive_power))) %>%
  mutate(Voltage = as.numeric(as.character(Voltage))) %>%
  mutate(Global_intensity = as.numeric(as.character(Global_intensity))) %>%
  mutate(Sub_metering_1 = as.numeric(as.character(Sub_metering_1))) %>%
  mutate(Sub_metering_2 = as.numeric(as.character(Sub_metering_2))) %>%
  mutate(Sub_metering_3 = as.numeric(as.character(Sub_metering_3))) %>%
  mutate(dateTime = dmy_hms(paste(Date, Time, sep = " ")))

## Plot chart in .png format
png("plot1.png", width = 480, height = 480)
with(twoDaysMeterRading, hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()