# Load Electrical Power Consumption dataset 
epcfile <- "./household_power_consumption.txt"
epcdata <- read.table(epcfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
epcdata1 <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create plot2 and save as plot2.png
gapower <- as.numeric(epcdata1$Global_active_power)
datetime <- strptime(paste(epcdata1$Date, epcdata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, gapower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()



