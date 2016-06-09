#purpose of this script is examine how household energy usage varies over a 
#2-day period in February, 2007. 

#read data 
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                         stringsAsFactors=FALSE) #read in more than enough data
power_data$DateTime <- paste(power_data$Date, power_data$Time)
power_data$DateTime <- as.Date(power_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#subset between 2007-02-01 and 2007-02-02
library(dplyr)
power_sub <- filter(power_data, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime <= as.Date("2007-02-02 00:00:00"))

#Construct 480x480px plot and save it to a PNG file 
png("plot1.png", width=480, height=480)
hist(as.numeric(power_sub$Global_active_power), main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(device=png, file="plot1.png", width=480, height=480)
dev.off()