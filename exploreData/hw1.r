#http://www.harding.edu/fmccown/r/
#https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/plot.html

#read in text file
#set working directory
setwd("D:/git/R-adventures-coursera/exploreData")

#list all the files in directory
dir()

#filter data using excel

#read in text file
energyData<- read.csv("powerC.csv", stringsAsFactors=FALSE)
as.Date(energyData$Date)

#plot data

#plot 1
hist(energyData$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")

#plot2
plot(energyData$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",axes=FALSE)
axis(1, at=1:3, lab=c(("Thu","Fri","Sat"))

#plot3


plot(energyData$Sub_metering_1, type="l", col="blue", ylab="Energy sub metering")

lines(energyData$Sub_metering_2, col="red")

lines(energyData$Sub_metering_3, col="green")

axis(1, at=1:3, lab=c(("Thu","Fri","Sat"))

legend(1, g_range[2], c("cars","trucks"), cex=0.8, 
   col=c("blue","red"), pch=21:22, lty=1:2);

#plot4
par(mfrow=c(2,2))
plot(energyData$Global_active_power, type="l")

plot(energyData$Voltage, type="l")

plot(energyData$Sub_metering_1, type="l", col="blue")
lines(energyData$Sub_metering_2, col="red")
lines(energyData$Sub_metering_3, col="green")

plot(energyData$Global_reactive_power)

par(mfrow=c(1,1))
