## Initialisation
library(dplyr)
library(lubridate)

## Read the data file and select only required dates
allMeterReadings <- read.delim("../household_power_consumption.txt", sep = ";")
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
  mutate(datetime = dmy_hms(paste(Date, Time, sep = " ")))

## Plot chart in .png format
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

## 1st chart
with(twoDaysMeterRading, plot(datetime, Global_active_power, type="l", main = "", xlab = "", ylab = "Global Active Power"))

##2nd chart
with(twoDaysMeterRading, plot(datetime, Voltage, type="l", main = ""))

##3rd chart
with(twoDaysMeterRading, plot(datetime, Sub_metering_1, type="l", main = "", xlab = "", ylab = "Energy sub metering"))
with(twoDaysMeterRading, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(twoDaysMeterRading, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)

##4th chart
with(twoDaysMeterRading, plot(datetime, Global_reactive_power, type="l", main = ""))

dev.off()