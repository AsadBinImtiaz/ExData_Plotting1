# Read The Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings=c("?","")) %>% subset(Date == "1/2/2007"|Date == "2/2/2007")

# Convert types
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

#New Field
data$Timestamp <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#plot
png('plot2.png',width=480,height=480)
plot(x = data$Timestamp, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
