# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimore<- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
#http://analyticscosm.com/the-aggregate-function-in-r/


baltimoreData <-  aggregate(Emissions~year, baltimore, sum)
plot(data, type = "l", main = "Total PM2.5 Emissions in Baltimore", xlab = "Year", ylab = "PM2.5 Emissions", col = "darkblue")


