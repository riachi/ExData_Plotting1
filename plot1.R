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

png(file = "plot1.png")
hist(data2$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()