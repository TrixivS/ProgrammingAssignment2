## The following two functions cache the inverse of a matrix

## The "makeCacheMatrix" function creates a matrix object that can cache its inverse.

makeCacheMatrix <- function(m = matrix()) {
  # nothing is cached so the cache value is set to NULL
  cache <- NULL
  # set the matrix
  set <- function ( matrix ) {
        m <<- matrix
        cache <<- NULL
        }
  # get the matrix
  get <- function() {
    m
      }
# set the inverse matrix
  setinverse <- function(inverse) {
    cache <<- inverse
    }    
# get the inverse matrix
  getinverse <- function() {
      cache
    }
# make a list of the functions
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## The "cacheSolve" function computes the inverse of the matrix established with "makeCacheMatrix"

cacheSolve <- function(x, ...) {
  # obtain the cache value
      cache <- x$getinverse()
  # return the cache value if available
      if(!is.null(cache)) {
        message("getting cached data")
        return(cache)
      }
  # if not available, compute the inverse and store in the cache
      data <- x$get()
      cache <- solve(data)
      x$setinverse(cache)
  # return the inversion matrix
      cache
}
