#plot3.R
# reading entire txt file
hpcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# getting size of household_power_consumption.txt in working directory
object.size("household_power_consumption.txt")

#subsetting the data based on date
SubSetdata <- subset(hpcdata, hpcdata$Date == "1/2/2007" | hpcdata$Date == "2/2/2007")

#plotting
datetime <- strptime(paste(SubSetdata$Date, SubSetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subm1 <- as.numeric(SubSetdata$Sub_metering_1)
subm2 <- as.numeric(SubSetdata$Sub_metering_2)
subm3 <- as.numeric(SubSetdata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subm2, type="l", col="red")
lines(datetime, subm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 