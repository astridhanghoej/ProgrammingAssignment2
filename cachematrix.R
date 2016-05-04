## Put comments here that give an overall description of what your
## functions do

## I used the "bones" of the makeVector code snippet to create the makeCacheMatrix below

makeCacheMatrix <- function(x = matrix()) { #makeCacheMatrix is a function call that takes as an argument a matrix constructed using matrix()
  m <- NULL #sets m to be NULL, because we are caching a new matrix on the makeCacheMatrix function call
  set <- function(y) {  #defines set function to ste matrix
    x <<- y
    m <<- NULL
  }
  get <- function() x #defines get function to get matrix
  setinv <- function(solve) m <<-solve #sets the inverse
  getinv <- function() m #gets the inverse
  list(set = set, get = get, #creates a list of all the elements returned by the makeCacheMatrix. Returns last argument when called by the cacheSolve function.
       setinv = setinv,
       getinv = getinv)
}


## Same as above. Used the cacheMean to adapt to cacheSolve


cacheSolve <- function(x, ...) {
  m <- x$getinv() #sets m to be the inverse
  if(!is.null(m)) { #in case the inverse is cached, return m
    message("getting cached data")
    return(m)
  }
  data <- x$get() #in case the inverse is not cached, solve it and return m.
  m <- solve(data, ...)
  x$setinv(m)
  m
}

