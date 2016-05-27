##http://resbaz.github.io/2014-r-materials/lessons/30-control-flow/
#http://www.dummies.com/how-to/content/how-to-sort-data-frames-in-r.html

setwd("D:/git/R-adventures-coursera/R-Adventures-Coursera/rProgramming")

#Problem 1  30 day heart attack
plot_heartAttacks<-function(){

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
}

#Problem 2 Finding best hostpital in the state
best <- function(state, outcome){

  data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available",stringsAsFactors = FALSE)
  newdata <- data[c(2,7,11,17,23)]
  
  ##rename the columns
  names(newdata)<-c("host_name","host_state","heart_attack","heart_failure","pneumonia")
  newdata<-na.omit(newdata)
  newdata<-newdata[state == newdata$host_state,]
  
 
  outcome_col<-switch(outcome, 
         'heart attack'={
           3
         },
         'heart failure'={
           4
         },
         'pneumonia'={
           5
         },
         {
           print('invalid')
         }
  )
  
  
df<-newdata[c(2,1,outcome_col)]
low<-df[which.min(df[,3]),]
return(low[,2])
}
#problem 3
rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available",stringsAsFactors = FALSE)
  
  ## Check that state and outcome are valid
  vaild_outcomes<-c("heart attack","heart failure","pneumonia")
  states<- data[,7]
  
  if ((state %in% states) == FALSE | (outcome %in% vaild_outcomes) == FALSE) {
    stop(print("invalid state or outcome"))
  }
  
  newdata <- data[c(2,7,11,17,23)]
  
  ##rename the columns
  names(newdata)<-c("host_name","host_state","heart_attack","heart_failure","pneumonia")
  #get rid of the nas
  newdata<-na.omit(newdata)
  
  #subset by state
  newdata<-newdata[state == newdata$host_state,]
  
  #switch data
  outcome_col<-switch(outcome, 
                      'heart attack'={
                        3
                      },
                      'heart failure'={
                        4
                      },
                      'pneumonia'={
                        5
                      },
                      {
                        print('invalid')
                      }
  )
  
  newdata<-newdata[c(1,outcome_col)]
  

  #order by rank then order by hospital name
  #http://stackoverflow.com/questions/1296646/how-to-sort-a-dataframe-by-columns
  ordered <- newdata[order(newdata[,2],newdata[,1]),]
  
  if(num=="best"){
    return(ordered[1,1])
  }
  
  else if(num =="worst"){
    return(tail(ordered[,1],1))
  }
  else if(num > nrow(ordered)){
    return("NA")
  }
  
  else{
    return(ordered[num,1])
  }
 
}


  ## Return hospital name in that state with the given rank
  
  ##Hospital 30-Day Death (Mortality) Rates from Heart Failure
  
  #if num is equal to best then return the five lowest
  #if num is equal to worst return the five highest
  #if num is equal to a number all the numbers
  #else return NA
  
  ## 30-day death rate
  
  ##strip out the NAs
  ## sort the data
  ##get the data by threshold
  ##create a new row
  ##loop thro the rwo by threshold
  ##apply a number to each threshold
  
  

#problem 4

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available",stringsAsFactors = FALSE)
  
  ## Check that outcome is valid
  vaild_outcomes<-c("heart attack","heart failure","pneumonia")
  
  if ( (outcome %in% vaild_outcomes) == FALSE) {
    stop(print("invalid outcome"))
  }
  
  newdata <- data[c(2,7,11,17,23)]
  
  #clean data
  newdata<-na.omit(newdata)
  
  ##rename the columns
  names(newdata)<-c("host_name","host_state","heart_attack","heart_failure","pneumonia")
  
  
  #switch data
  outcome_col<-switch(outcome, 
                      'heart attack'={
                        3
                      },
                      'heart failure'={
                        4
                      },
                      'pneumonia'={
                        5
                      },
                      {
                        print('invalid')
                      }
  )
  
  #subset the data by outcome
  newdata<-newdata[c(1,2,outcome_col)]
  

  
  #split the data by state using the split function
  #http://stackoverflow.com/questions/19327020/in-r-how-to-split-subset-a-data-frame-by-factors-in-one-column#
  #instead of using lapply sapply can be used so you don't have to unpack the list
  #http://stackoverflow.com/questions/3505701/r-grouping-functions-sapply-vs-lapply-vs-apply-vs-tapply-vs-by-vs-aggrega
  
  newdata<-split(newdata,newdata$host_state)
  
  #loop through the list
  #order them by rank and then by name
  
  result<-sapply(newdata,function(mydata){
    mydata<- mydata[order(mydata[,3],mydata$host_name),]
    if(num == "best"){
      return(mydata$host_name[1])
    }
    else if(num=="worst"){
      return(mydata$host_name[nrow(mydata)])
    }
    else{
      return(mydata$host_name[num])
    }
  })

  
  
}

 


