

#read table
cls <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=cls)
energyData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#deleted all the rows that had NA values
energyData<-na.omit(energyData)

#formatted the date values and paste them together
datetime<-paste(as.Date(energyData$Date,format = "%d/%m/%Y"),energyData$Time)

#created a new column and used PSIXct
energyData["datetime"]<-as.POSIXct(datetime)

plot(energyData$datetime,energyData$Sub_metering_1, type="l", col="blue",xlab="",ylab="Energy sub metering")

lines(energyData$datetime,energyData$Sub_metering_2, col="red")

lines(energyData$datetime,energyData$Sub_metering_3, col="green")

legend('topright', legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,
       col=c("blue", "red","green"))

dev.off()