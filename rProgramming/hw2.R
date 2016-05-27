#http://www.statmethods.net/management/merging.html
#http://www.dummies.com/how-to/content/how-to-remove-rows-with-missing-data-in-r.html
pollutantmean<-function(directory,pollutant,id=1:332){
  filesD<-list.files(directory,full.names = TRUE)
  dat <- data.frame()
  
  for(i in id){
    temp<- read.csv(filesD[i],header=TRUE)
    dat<-rbind(dat,temp)
  }
  mean(dat[pollutant],na.rm = TRUE)
  
}

complete <- function(directory,id=1:332){
  filesD<-list.files(directory,full.names = TRUE)
  dat <- data.frame()
  
  for(i in id){
    temp<- read.csv(filesD[i],header=TRUE)
    temp<-na.omit(temp)
    tNobs<-nrow(temp)
    dat<-rbind(dat,data.frame(i,tNobs))
   
  }
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
  filesD<-list.files(directory,full.names = TRUE)
  dat <- vector(mode = "numeric", length = 0)
  
  for(i in 1:length(filesD)){
    temp<- read.csv(filesD[i],header=TRUE)
    temp<-temp[complete.cases(temp),]
    csum<-nrow(temp)
    #print(csum)
    if(csum>threshold){
   
      dat<-c(dat,cor(temp$nitrate,temp$sulfate))
    }
    
  }

  print(head(dat))
}

