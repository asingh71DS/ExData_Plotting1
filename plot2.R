#plot2.R
# reading entire txt file
hpcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# getting size of household_power_consumption.txt in working directory
object.size("household_power_consumption.txt")

#subsetting the data based on date
SubSetdata <- subset(hpcdata, hpcdata$Date == "1/2/2007" | hpcdata$Date == "2/2/2007")

#plotting
datetime <- strptime(paste(SubSetdata$Date, SubSetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAPower <- as.numeric(SubSetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 