#read table

cls <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=cls)
energyData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

read.csv("data.csv", colClasses=cls, stringsAsFactors=FALSE)


#deleted all the rows that had NA values
energyData<-na.omit(energyData)

#formatted the date values and paste them together
datetime<-paste(as.Date(energyData$Date,format = "%d/%m/%Y"),energyData$Time)

#created a new column datetime and used PSIXct
energyData["datetime"]<-as.POSIXct(datetime)

#next I plotted the data
plot(energyData$datetime,energyData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()



