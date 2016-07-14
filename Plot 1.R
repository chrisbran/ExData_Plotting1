## Reading data files

filename <- "exdata_data_household_power_consumption.zip"

#Download and unzip the data set
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("household_power_consumption")) { 
        unzip(filename) 
}

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#Plot 1
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", 
    width=480, 
    height=480)
hist(globalActivePower, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()