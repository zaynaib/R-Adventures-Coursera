data<- read.csv("hw1_data.csv") #read the csv file

#In the dataset provided for this Quiz, 
#what are the column names of the dataset?
names(data)

#Extract the first 2 rows of the data frame and print them to the console.
#What does the output look like?

data[1:2,]

#or

head(data,2)

#How many observations (i.e. rows) are in this data frame?
nrow(data)

#Extract the last 2 rows of the data frame and print them to the console.
#What does the output look like?

data[152:153,]

#or

tail(data,2)

#What is the value of Ozone in the 47th row?

data[47,]

#How many missing values are in the Ozone column of
#this data frame?

summary(data)

#What is the mean of the Ozone column in this dataset? Exclude missing values
#(coded as NA) from this calculation.

ozone<-data$Ozone
mean(ozone, na.rm=TRUE)

#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
#What is the mean of Solar.R in this subset?

myset<-data[data$Ozone>31 & data$Temp>90,]
mean(myset$Solar.R, na.rm=TRUE)

#What is the mean of "Temp" when "Month" is equal to 6?
june <-data[data$Month==6,]
mean(june$Temp, na.rm=TRUE)

#What was the maximum ozone value in the 
#month of May (i.e. Month is equal to 5)?
may<-data[data$Month==5,]
max(may$Ozone, na.rm=TRUE)
