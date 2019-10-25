## Initialisation
library(dplyr)

## Read the data file and select only required dates
allMeterReadings <- read.delim("../household_power_consumption.txt", sep = ";")
twoDaysMeterRading <- filter(allMeterReadings, Date == "1/2/2007" | Date == "2/2/2007")
remove(allMeterReadings)

