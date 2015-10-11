#create vector poower_data
power_data<-"C://Users//01448258//Documents//household_power_consumption.txt"

#read the text file power_data
data <- read.table(power_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the required data between dates 01/02/2007 to 02/02/2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert charactor to date time variable
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#convert globalActive, Sub_metering_1, 2 and 3 into numerical data
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#create png file
png("plot3.png", width=480, height=480)

#plot sub metering vs datetime graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

