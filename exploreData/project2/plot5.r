#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#http://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html
#http://www.ceb-institute.org/bbs/wp-content/uploads/2011/09/handout_ggplot2.pdf
#http://science.nature.nps.gov/im/datamgmt/statistics/r/fundamentals/manipulation.cfm
library(ggplot2)

#read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter data by fips code
baltimore<- NEI[NEI$fips == "24510",]

#filter data by vechile
baltimore<-NEI[NEI$type=="ON-ROAD",]

baltimore<-aggregate(Emissions~year+type,baltimore,sum)

#plot 
g<- ggplot(data=baltimore,aes(x=year,y=Emissions))+geom_line(stat="identity") +xlab("Year") +ylab("PM2.5 Particles")+ggtitle("Baltimore Vehicle Emissions")

print(g)




