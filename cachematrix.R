## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Takes a matrix a s parameter and returns a list of methods
makeCacheMatrix <- function(x = matrix()) {
        im <- NULL
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        get <- function() x
        setInverseMatrix <- function(inverse_matrix) im <<- inverse_matrix
        getInverseMatrix <- function() im
        list(set = set, get = get,
             setInverseMatrix = setInverseMatrix,
             getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function
# Takes special matrix created using `makeCacheMatrix` and finds inverse of the matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        cachedMatrix <- x$getInverseMatrix()
        if(!is.null(cachedMatrix)) {
                return(cachedMatrix)
        } else {
                x$setInverseMatrix(solve(x$get(), ...))
                x$getInverseMatrix()
        }
}
