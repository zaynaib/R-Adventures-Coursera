library(ggplot2)
library(reshape2)

#read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter data by fips code and type
baltimore <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
la<- NEI[(NEI$fips=="06037"& NEI$type=="ON-ROAD"), ]

#aggregate the data
aggBaltimore<-aggregate(Emissions~year+fips,baltimore,sum)
aggLa<-aggregate(Emissions~year+fips,la,sum)


#combined the two data sets together so we can plot them together
#http://stackoverflow.com/questions/17150183/r-plot-multiple-lines-in-one-graph
#http://www.sixhat.net/plotting-multiple-data-series-in-r.html

df<-rbind(aggBaltimore,aggLa)

#Explored data using bar graph did not show as much detail as the line graph
#g <- ggplot(df, aes(x = factor(year), y = Emissions, fill =fips)) + geom_bar(stat= "identity",position="dodge") + xlab("year") +ylab("Vehicle-Related PM2.5 Emissions") + ggtitle("LA  Emissions VS. Baltimore  Emissions")
#print(g)

#line graph
plot6<-ggplot(data = df, aes(x = year, y = Emissions, color = fips)) +
  geom_line() + xlab("year") +ylab("Vehicle-Related PM2.5 Emissions") + ggtitle("LA  Emissions VS. Baltimore  Emissions")
print(plot6)