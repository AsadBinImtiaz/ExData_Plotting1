# Read The Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings=c("?","")) %>% subset(Date == "1/2/2007"|Date == "2/2/2007")

# Convert types
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

#New Field
data$Timestamp <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#Plot
png('plot3.png',width=480,height=480)
with(data, {
  plot (x = data$Timestamp, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering") 
  lines(x = data$Timestamp, y = data$Sub_metering_2, col='Red')
  lines(x = data$Timestamp, y = data$Sub_metering_3, col='Blue')
})
legend("topright", col=c("black", "red", "blue") , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
dev.off()