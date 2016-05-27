library(ggplot2)

#ggplot tutorial
#http://www.ceb-institute.org/bbs/wp-content/uploads/2011/09/handout_ggplot2.pdf
# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimore <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year+type, baltimore,sum)



#plot data
#http://www.cookbook-r.com/Graphs/Bar_and_line_graphs_(ggplot2)/#line-graphs-1

g<- ggplot(aggTotalsBaltimore,aes(x=year,y=Emissions,group=type,colour=type)) +geom_line() +xlab("year") + ylab("PM 2.5 Particles") + # Set axis labels
  ggtitle("Yearly Emissions in Balitmore by Type")

print(g)
