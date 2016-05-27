#read in the data
#take the portions that say coal
#https://www.linkedin.com/pulse/r-day-grep-grepl-charles-guthrie
#scc is the mapping to the NEI
#for every short name that has coal
#I want to take the scc
#then subset the ids with the NEI data set
#aggregate
#plot the data

library(ggplot2)


#read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter the rows of SCC
#https://awakeningdatascientist.wordpress.com/2015/07/20/r-of-the-day-grep-and-grepl/
filtered<-SCC[grep("coal", SCC$Short.Name), ]

#consoldate the data
#http://analyticscosm.com/the-aggregate-function-in-r/
df<-merge(filtered,SCC)
sccId<-as.character(df[,1])

#match the values
#https://stat.ethz.ch/R-manual/R-devel/library/base/html/match.html
#http://www.statmethods.net/management/subset.html

coalNEI <- NEI[NEI$SCC %in% sccId, ]
coalAgg<-aggregate(Emissions~year+type,coalNEI,sum)

#plot
plot4<-ggplot(data=coalAgg, aes(x=year, y=Emissions,color=year)) +
  geom_line() +
  geom_point()

g <- ggplot(coalNEI, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity",position="dodge") + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(g)
