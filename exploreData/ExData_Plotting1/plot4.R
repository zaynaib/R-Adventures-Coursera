
#read table

#columnClasses
cls <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=cls)
energyData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#deleted all the rows that had NA values
energyData<-na.omit(energyData)

#formatted the date values and paste them together
datetime<-paste(as.Date(energyData$Date,format = "%d/%m/%Y"),energyData$Time)

#created a  column datetime and used PSIXct
energyData["datetime"]<-as.POSIXct(datetime)


par(mfrow=c(2,2))
plot(energyData$datetime,energyData$Global_active_power, type="l",xlab="",ylab="Global Active Power")

plot(energyData$datetime,energyData$Voltage, type="l",xlab="datetime",ylab="Voltage")

plot(energyData$datetime,energyData$Sub_metering_1, type="l", col="blue",xlab="",ylab="Energy sub metering")
lines(energyData$datetime,energyData$Sub_metering_2, col="red")
lines(energyData$datetime,energyData$Sub_metering_3, col="green")

plot(energyData$datetime,energyData$Global_reactive_power, type="l",xlab="",ylab="Global_active_power")

dev.off()
