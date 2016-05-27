##https://github.com/TomLous/coursera-exploratory-data-analysis-course-project-2
##https://github.com/wayneeseguin/exdata-project2
##https://rpubs.com/cmstewart/EDA_project2

setwd("D:/git/R-adventures-coursera/R-Adventures-Coursera/ExploreData")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#clean the data
NEI<-na.omit(NEI)
SCC<-na.omit(SCC)

#start plotting


#Question 1
#base plotting system, make a plot showing the total PM2.5 emission
#from all sources for each of the years 1999, 2002, 2005, and 2008.

#Question 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.


#Question 3

