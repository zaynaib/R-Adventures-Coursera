## Put comments here that give an overall description of what your
## functions do
#To understand lexical scoping check out the post https://github.com/DanieleP/PA2-clarifying_instructions
#To learn more about matrix functions in R http://www.statmethods.net/advstats/matrix.html

#To Do
#instructions
#set the value of the matrix
#get the value of the matrix
#set the value of the inverse matrix
#get the value of the inverse matrix
## Write a short comment describing this function
#This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  #setup global variables
  inv<-NULL 
  
  #set the matrix/initalize the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  #get the matrix
  get <- function() x
  #set the inverse of the matrix
  setinverse <- function(inverse) inv <<- inverse
  #get the inverse of the matrix
  getinverse <- function() inv
  #store all of your functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Write a short comment describing this function
##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#If the inverse has already been calculated (and the matrix has not changed), 
#then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  #check to see if the inverse of the matrix is already stored
  #then return the matrix
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  #if the inverse is not setup then you get the matrix
  data <- x$get()
  #then you solve the inverse using the solve matirx
  #http://www.statmethods.net/advstats/matrix.html
  inv <- solve(data, ...)
  #use the setinverse function in order to cache the inverse matrix
  x$setinverse(inv)
  #then return the inverse matrix
  inv
}
