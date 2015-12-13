plot3 <- function()
{
	## Household Power Consumption Data - Read from File - household_power_consumption.txt
	
	library(sqldf)
	h_power_cons <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
						header=TRUE, sep=";", eol = "\n")

	## Finding the range for metering
	metering_range <- range(0,  h_power_cons$Sub_metering_1,  h_power_cons$Sub_metering_2,  h_power_cons$Sub_metering_3)

	## Drawing the Graph, with the line for Sub_metering_1
	plot(h_power_cons$Sub_metering_1, type="l", ylim=metering_range, axes=FALSE, ann=FALSE)	

	## Setting the Axis
	axis(1, at=1:3, lab=c("Thu", "Fri", "Sat"))
	axis(2, las=1, at=10*0:metering_range[2])

	box()		## Drawing a box

	## Adding the lines for the Sub_metering_2 and Sub_metering_3
	lines(h_power_cons$Sub_metering_2, type="l", col="red")
	lines(h_power_cons$Sub_metering_3, type="l", col="blue")

	## Setting the Title and Legend
	title(ylab="Energy sub metering")	
	legend(1, metering_range[2], c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=c("black","red","blue"),lty=1, xjust=-2.2);

	dev.copy(png, file="plot3.png") ## Copy the Graph to a PNG File
	dev.off()  ## Closing the PNG Device
}

