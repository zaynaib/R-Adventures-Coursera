setwd("D:/git/R-adventures-coursera/R-Adventures-Coursera/rProgramming")

#Problem 1  30 day heart attack

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


#Problem 2 Finding best hostpital in the state

best <- function(state, outcome) {
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors = FALSE)
  ##subset the data
  ##variables hospital name,state,heart attack,heart failure,pneumonia rates
  newdata <- outcome[c(2,7,11,17,23)]
  ##rename the columns
  names(newdata)<-c("host_name","host_state","heart_attack","heart_failure","pneumonia")
  ##clean up the data to remove nas
  newdata[complete.cases(newdata),]
  ## Check that state and outcome are valid
  if(state %in% newdata$host_state){
    #subset the information from that state
    newdata<- newdata[which(state ==newdata$host_state),]
    
    if(outcome == "pneumonia"){
      low<-newdata[which.min(newdata$pnemonia),]
    }
    
     else if(outcome == "heart attack"){
       low<-newdata[which.min(newdata$heart_attack),]
     }
        
      else if(outcome == "heart failure"){
        low<-newdata[which.min(newdata$heart_failure),]
      }
    else{
      print("Not vaild condition")
    }
      
    
  }
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  #print(paste(low$host_state,low$host_name))
  print(low)
  #newdata[which(low==outcome[,11]),]
  #newdata <- subset(newdata, low == outcome[,11], 
                    #select=c(State, outcome[,2]))
}

best("TX", "heart attack")


#Problem 3 Ranking in hospitals by outcome in state

#Problem 4 Ranking hospital by all state