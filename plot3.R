alldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data <- subset(alldata, alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007")
datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
data$Date <- datetime
data2 <- data[, c(1,3,4,5,6,7,8,9)]
data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)
data2$Global_intensity <- as.numeric(data2$Global_intensity)
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)
data2$Voltage <- as.numeric(data2$Voltage)

png(file = "plot3.png")
plot(data2$Date, data2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(data2$Date, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$Date, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = (c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
dev.off()