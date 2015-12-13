plot2 <- function()
{
	## Household Power Consumption Data - Read from File - household_power_consumption.txt
	
	library(sqldf)
	h_power_cons <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
							header=TRUE, sep=";", eol = "\n")
	
	## Drawing the Graph
	plot(strptime(paste(h_power_cons$Date, h_power_cons$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), h_power_cons$Global_active_power, 
				type="l", xlab="", ylab="Global Active Power (Kilowatts)")

	dev.copy(png, file="plot2.png") ## Copy the Graph to a PNG File
	dev.off()  ## Closing the PNG Device
}

