plot3 <- function()
{
	## Household Power Consumption Data - Read from File - household_power_consumption.txt
	
	library(sqldf)
	h_power_cons <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
						header=TRUE, sep=";", eol = "\n")

	## Finding the range for metering
	metering_range <- range(0,  h_power_cons$Sub_metering_1,  h_power_cons$Sub_metering_2,  h_power_cons$Sub_metering_3)

	## Drawing the Graph, with the line for Sub_metering_1	
	plot(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),h_power_cons$Sub_metering_1, type="l", ylim=metering_range, ann=FALSE)	

	## Adding the lines for the Sub_metering_2 and Sub_metering_3
	lines(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),h_power_cons$Sub_metering_2, type="l", col="red")
	lines(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),h_power_cons$Sub_metering_3, type="l", col="blue")

	## Setting the Title and Legend
	title(ylab="Energy sub metering")
	legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)

	dev.copy(png, file="plot3.png") ## Copy the Graph to a PNG File
	dev.off()  ## Closing the PNG Device
}

