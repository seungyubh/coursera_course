## cachematrix.R will calculate an inverse of the given matrix and store
## the inverted matrix as a cache

## makeCacheMatrix will take in a new matrix and empty out cached inverted matrix
## whencacheSolve function is called, part of makeCacheMatrix will be used to
## get new matrix, calculate the inverse and set the inverse of the given matrix

makeCacheMatrix <- function(x = matrix()) {
        invMatrix <- NULL
        set <- function(y) {
                x <<- y
                invMatrix <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) invMatrix <<- solve
        getInverse <- function() invMatrix
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## cacheSolve function will be used to recall cached intervted matrix
## if new matrix was put in, cacheSolve function will use part of
## makeCacheMatrix function to print out and cache new intervted matrix

cacheSolve <- function(x, ...) {
        invMatrix <- x$getInverse()
        if(!is.null(invMatrix)) {
                message("getting cached data")
                return(invMatrix)
        }
        data <- x$get()
        invMatrix <- solve(data, ...)
        x$setInverse(invMatrix)
        invMatrix
}
