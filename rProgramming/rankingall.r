
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available",stringsAsFactors = FALSE)
  
  ## Check that outcome is valid
  vaild_outcomes<-c("heart attack","heart failure","pneumonia")
  
  if ( (outcome %in% vaild_outcomes) == FALSE) {
    stop(print("invalid outcome"))
  }
  
  newdata <- data[c(2,7,11,17,23)]
  
  ##rename the columns
  names(newdata)<-c("host_name","host_state","heart_attack","heart_failure","pneumonia")
  
  #get rid of the NAs
  newdata<-na.omit(newdata)
  
  
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
  
  newdata<-split(newdata,newdata$host_state)
  
  #loop through the list
  #order them by rank and then by name
  
  result<-lapply(newdata,function(mydata,num="best"){
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
  return(data.frame(hospital<-unlist(result),state<-names(result)))


}






  