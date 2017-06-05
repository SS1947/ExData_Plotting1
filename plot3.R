# Load Electrical Power Consumption dataset 
epcfile <- "./household_power_consumption.txt"
epcdata <- read.table(epcfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
epcdata1 <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create plot3 and save as plot3.png
gapower <- as.numeric(epcdata1$Global_active_power)
datetime <- strptime(paste(epcdata1$Date, epcdata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(epcdata1$Sub_metering_1)
submetering2 <- as.numeric(epcdata1$Sub_metering_2)
submetering3 <- as.numeric(epcdata1$Sub_metering_3)

plot(datetime, submetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

