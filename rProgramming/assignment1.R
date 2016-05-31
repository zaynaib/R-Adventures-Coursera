#http://www.statmethods.net/management/merging.html
#http://www.dummies.com/how-to/content/how-to-remove-rows-with-missing-data-in-r.html


pollutantmean<-function(directory,pollutant,id=1:332){
  #create a list of files
  filesD<-list.files(directory,full.names = TRUE)
  #create an empty data frame
  dat <- data.frame()
  
  #loop through the list of files until id is found
  for(i in id){
    #read in the file
    temp<- read.csv(filesD[i],header=TRUE)
    #add files to the main data frame
    dat<-rbind(dat,temp)
  }
  #find the mean of the pollutant, make sure you remove NA values
  mean(dat[pollutant],na.rm = TRUE)
  
}


complete <- function(directory,id=1:332){

#create a list of files
  filesD<-list.files(directory,full.names = TRUE)
  #create an empty data frame
  dat <- data.frame()
  
  for(i in id){
  #read in the file
    temp<- read.csv(filesD[i],header=TRUE)
    #delete rows that do not have complete cases
    temp<-na.omit(temp)
    
    #count all of the rows with complete cases
    tNobs<-nrow(temp)
    
    #enumerate the complete cases by index
    dat<-rbind(dat,data.frame(i,tNobs))
   
  }
  
  #create column name
  colnames(dat)<-c("id","nobs")
  print(dat)

}
#correlation of what
#sulfate and nitrate
#read in the files
#take away the NAs
#use the correlation of the data frame

#o, you can loop through the files and if complete cases > threshold
#then calculate cor() and add it to a vector. If you initialize your
#vector to numeric() and no files have complete cases then when 
#you return the vector it's an empty numeric vector which is what the instructions call for.
#x <- airquality[complete.cases(airquality), ]


corr<-function(directory,threshold=0){
#create list of file names
  filesD<-list.files(directory,full.names = TRUE)
  
  #create empty vector
  dat <- vector(mode = "numeric", length = 0)
  
  for(i in 1:length(filesD)){
  #read in file
    temp<- read.csv(filesD[i],header=TRUE)
    #delete NAs
    temp<-temp[complete.cases(temp),]
    #count the number of observations
    csum<-nrow(temp)
    #if the number of rows is greater than the threshold
    if(csum>threshold){
   #for that file you find the correlation between nitrate and sulfate
   #combine each correlation for each file in vector format using the concatenate function 
   #since this is not a data frame we cannot use rbind or cbind
      dat<-c(dat,cor(temp$nitrate,temp$sulfate))
    }
    
  }

  print(head(dat))
}

