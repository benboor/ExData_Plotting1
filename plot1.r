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

#			read .txt file
		ConsumptionData<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, colClasses = c('character', 'character',
                    'numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric'), header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
	
#			gets date and time
		ConsumptionData$DateTime <- strptime(paste(ConsumptionData$Date, ConsumptionData$Time), "%d/%m/%Y %H:%M:%S")

# 			subsets consumption data
		ConsumptionData <- subset(ConsumptionData, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))	

# 			generates plot as png file
		png("plot1.png", width=480, height= 480, pointsize = 12, res = NA)

#			populates png file with histogram	
		hist(ConsumptionData$Global_active_power, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

#			shuts down the open graphics device so hist can be written to plot1		
		dev.off()		
		
		
		