#create vector poower_data
power_data<-"C://Users//01448258//Documents//household_power_consumption.txt"

#read the text file power_data
data <- read.table(power_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the required data between dates 01/02/2007 to 02/02/2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#change convert charactor variable to date time variable
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#convert globalActivePower to numerical variable
globalActivePower <- as.numeric(subSetData$Global_active_power)

#plot Global Active Power vs date time graph
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
