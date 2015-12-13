plot4 <- function()
{
	## Household Power Consumption Data - Read from File - household_power_consumption.txt
	
	library(sqldf)
	h_power_cons <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
						header=TRUE, sep=";", eol = "\n")

	par(mfrow=c(2,2))
	## Drawing the Graph (1)
	plot(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), h_power_cons$Global_active_power, 
				type="l", xlab="", ylab="Global Active Power (Kilowatts)")

	## Drawing the Graph (2)
	plot(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), h_power_cons$Voltage, 
				type="l", xlab="datetime", ylab="Voltage")

	## Drawing the Graph (3)
	## Finding the range for metering
	metering_range <- range(0,  h_power_cons$Sub_metering_1,  h_power_cons$Sub_metering_2,  h_power_cons$Sub_metering_3)

	## Drawing the Graph, with the line for Sub_metering_1	
	plot(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),h_power_cons$Sub_metering_1, type="l", ylim=metering_range, ann=FALSE)	

	## Adding the lines for the Sub_metering_2 and Sub_metering_3
	lines(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),h_power_cons$Sub_metering_2, type="l", col="red")
	lines(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),h_power_cons$Sub_metering_3, type="l", col="blue")

	## Setting the Title and Legend
	title(ylab="Energy sub metering")
	legend("topright", inset=.05, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1, bty="n")	

	## Drawing the Graph (4)
	plot(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), h_power_cons$Global_reactive_power, 
				type="l", xlab="datetime", ylab="Global_reactive_power")


	dev.copy(png, file="plot4.png") ## Copy the Graph to a PNG File
	dev.off()  ## Closing the PNG Device
}

