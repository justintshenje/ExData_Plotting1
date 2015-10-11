#create vector poower_data
power_data<-"C://Users//01448258//Documents//household_power_consumption.txt"

#read the text file power_data
data <- read.table(power_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the required data between dates 01/02/2007 to 02/02/2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert globalActivePower to a numerical variable
globalActivePower <- as.numeric(subSetData$Global_active_power)

#create png file
png("plot1.png", width=480, height=480)

#plot Global Active Histogram histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()