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
hist(energyData$Global_active_power,xlab="")

#plot2
plot(energyData$Global_active_power, type="l")

#plot3


plot(energyData$Sub_metering_1, type="l", col="blue")

lines(energyData$Sub_metering_2, col="red")

lines(energyData$Sub_metering_3, col="green")

#plot4
par(mfrow=c(2,2))
plot(energyData$Global_active_power, type="l")

plot(energyData$Voltage, type="l")

plot(energyData$Sub_metering_1, type="l", col="blue")
lines(energyData$Sub_metering_2, col="red")
lines(energyData$Sub_metering_3, col="green")

plot(energyData$Global_reactive_power)

par(mfrow=c(1,1))


