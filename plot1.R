# Load Electrical Power Consumption dataset 
epcfile <- "./household_power_consumption.txt"
epcdata <- read.table(epcfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
epcdata1 <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create plot1 and save as plot1.png
gapower <- as.numeric(epcdata1$Global_active_power)
hist(gapower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


