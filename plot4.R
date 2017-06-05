# Load Electrical Power Consumption dataset 
epcfile <- "./household_power_consumption.txt"
epcdata <- read.table(epcfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
epcdata1 <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]

# Create plot4 and save as plot4.png
gapower <- as.numeric(epcdata1$Global_active_power)
grpower <- as.numeric(epcdata1$Global_reactive_power)
datetime <- strptime(paste(epcdata1$Date, epcdata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(epcdata1$Sub_metering_1)
submetering2 <- as.numeric(epcdata1$Sub_metering_2)
submetering3 <- as.numeric(epcdata1$Sub_metering_3)
voltage <- as.numeric(epcdata1$Voltage)


par(mfrow = c(2, 2)) 
plot(datetime, gapower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage", cex=0.2)

plot(datetime, submetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty="n", cex=0.5, col=c("black", "red", "blue"))

plot(datetime, grpower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()


