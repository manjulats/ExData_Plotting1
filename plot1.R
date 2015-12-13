plot1 <- function()
{
	## Household Power Consumption Data - Read from File - household_power_consumption.txt
	
	library(sqldf)	
	h_power_cons <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
								header=TRUE, sep=";", eol = "\n")
	
	## Drawing the Histogram
	hist(h_power_cons$Global_active_power, 
			col="red", 
			main="Global Active Power", 
			xlab="Global Active Power (Kilowatts)")

	dev.copy(png, file="plot1.png") ## Copy the Histogram to a PNG File
	dev.off()  ## Closing the PNG Device
}

