#purpose of this script is examine how household energy usage varies over a 
#2-day period in February, 2007. 

#read data 
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                         stringsAsFactors=FALSE) #read in more than enough data
power_data$DateTime <- paste(power_data$Date, power_data$Time)
power_data$DateTime <- as.Date(power_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#data process step, subset between 2007-02-01 and 2007-02-02, get x & y
library(dplyr)
power_sub <- filter(power_data, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime <= as.Date("2007-02-02 00:00:00"))
x <- strptime(paste(power_sub$Date, power_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(power_sub$Sub_metering_1)
y2 <- as.numeric(power_sub$Sub_metering_2)
y3 <- as.numeric(power_sub$Sub_metering_3)

#create 480x480 plot 
png("plot3.png", width=480, height=480)
plot(x, y1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(x, y2, type="l", col="red3", xlab="", ylab="Energy sub metering")
lines(x, y3, type="l", col="blue", xlab="", ylab="Energy sub metering")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red3", "blue"))

dev.off()

