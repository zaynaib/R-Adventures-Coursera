#tilde operator
#http://stat.ethz.ch/R-manual/R-patched/library/base/html/tilde.html
#aggregate function 
#http://www.statmethods.net/stats/withby.html
#http://www.dummies.com/how-to/content/how-to-cast-data-to-wide-format-in-r.html
#http://analyticscosm.com/the-aggregate-function-in-r/
#http://analyticscosm.com/

setwd("D:/git/R-adventures-coursera/R-Adventures-Coursera/ExploreData/project2")

#start the data viewer
#https://support.rstudio.com/hc/en-us/articles/205175388-Using-the-Data-Viewer#starting-the-viewer
#pivot tables, aggregating data


# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
##http://analyticscosm.com/the-aggregate-function-in-r/
data <-  aggregate(Emissions~year, NEI, sum)


plot(data, type = "l", main = "Total PM2.5 Emissions", xlab = "Year", ylab = "PM2.5 Emissions")
