## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it repeatedly 

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    # m will be default inversed matrix x, set to NULL 
    m <- NULL
    # `set` fun will setup a matrix x with given parameters data;nrow;ncol
    set <- function(data, nrow, ncol) {
        #cache created matrix to x
        x <<-  matrix(data,nrow,ncol)
        # set inserved matrix to MULL
        m <<- NULL
    }
    # `get` fun will give back matrix x
    get <- function() x
    # `setinverse` fun will compute inverse of x and cache to m
    setinverse <- function() m <<- solve(x)
    # `getinverse` fun returns inversed matrix m
    getinverse <- function() m
    # show the list args
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) {
    # get `getinverse` attribute of makeCacheMatrix result and asign to m
    m <- x$getinverse()
    # if `setinverse` has been computed, m is not NULL
    if (!is.null(m)) {
        message("getting cached inverse matrix")
        return (m)
    }
    # if m has not been computed, get matrix from makeCacheMatrix result and assign to `data`
    data <- x$get()
    # inverse matrix `data` and assign to m
    m <- solve(data,...)
    # return invered matrix m
    m
}
