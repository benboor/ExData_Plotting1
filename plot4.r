#		if the file has yet to be downloaded to the local repository, run the following commented functions

#		download.file(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
#					YOUR LOCAL REPOSITORY HERE, method, quiet = FALSE))
#             
#		this unzips the file so that it can be read 
#		unzip(household_power_consumption.zip)
#
#END functions needed to download file for processing

#			setwd		
		setwd("C:/Users/Ben/Desktop/Data Science certification/getting and cleaning data/project 1")

#			read in text file		
		ConsumptionData <- read.table('../household_power_consumption.txt', sep=';', header=T, colClasses = c('character', 'character','numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

# 			Convert dates
		ConsumptionData$DateTime <- strptime(paste(ConsumptionData$Date, ConsumptionData$Time), "%d/%m/%Y %H:%M:%S")

#			subsets data for appropriate time so it doesn't take forever to compile
		ConsumptionData <- subset(ConsumptionData, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# 		generates plot as png file
		png("plot4.png", height=480, width=480)

# 		states that there will be a graph with 4 quadrants
		par(mfrow=c(2,2))

#			plot1
		plot(ConsumptionData$DateTime, ConsumptionData$Global_active_power, pch=NA, xlab="", ylab="Global Active Power")
		lines(ConsumptionData$DateTime, ConsumptionData$Global_active_power)

#			plot2
		plot(ConsumptionData$DateTime, ConsumptionData$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
		lines(ConsumptionData$DateTime, ConsumptionData$Voltage)

#			plot3
		plot(ConsumptionData$DateTime, ConsumptionData$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")

# 			ad legend and associated 
		lines(ConsumptionData$DateTime, ConsumptionData$Sub_metering_1, col='black')
		lines(ConsumptionData$DateTime, ConsumptionData$Sub_metering_2, col='red')
		lines(ConsumptionData$DateTime, ConsumptionData$Sub_metering_3, col='blue')
		legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

# 			plot4
		with(ConsumptionData, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
		with(ConsumptionData, lines(DateTime, Global_reactive_power))

#			shuts down the open graphics device so hist can be written to plot1	 
		dev.off()