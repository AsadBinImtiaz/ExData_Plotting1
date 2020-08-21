# Read The Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";") %>% subset(Date == "1/2/2007"|Date == "2/2/2007")

# Convert types
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Plot
png('plot1.png',width=480,height=480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
