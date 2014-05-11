#		if the file has yet to be downloaded to the local repository, run the following commented functions

#		download.file(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
#					YOUR LOCAL REPOSITORY HERE, method, quiet = FALSE))
#             
#		this unzips the file so that it can be read 
#		unzip(household_power_consumption.zip)
#
#END functions needed to download file for processing

#			setwd if it is not to where the .txt was downloaded		
		setwd("C:/Users/Ben/Desktop/Data Science certification/getting and cleaning data/project 1")

#			reads in data so that it can be read by plot
							ConsumptionData <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", colClasses="character", na.strings= "?",
							col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")))

# 			generates plot as png file
		png("plot2.png", width=480, height= 480, pointsize = 12, res = NA)
						
#			sets date and time to be used by plot
		ConsumptionData$DateTime = (paste(ConsumptionData$Date, ConsumptionData$Time))
		ConsumptionData$DateTime = strptime(ConsumptionData$DateTime, format = "%d/%m/%Y %H:%M:%S")

#			populates png file with plot
		plot(ConsumptionData$DateTime, ConsumptionData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#			shuts down the open graphics device so hist can be written to plot2	
		dev.off()