## Put comments here that give an overall description of what your
## functions do


#This function will take a matrix and inverse
#The first function makeCacheMatrix takes a matrix as and argument and returns 
# a list of functions, get, set, getinverse and setinverse 
# set caches the value of x and set the inverse to Null
# get retrives the x value
# setinverse calculate the inverse of the matrix and cache it as inverse_matrix
# getinverse retrieves the value of inverse_matrix 

makeCacheMatrix <- function(x = matrix()) {
        inverse_matrix<-NULL
        set <- function(y) {
                x <<- y
                inverse_matrix <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse_fun)inverse_matrix<<-inverse_fun

        getinverse <- function() inverse_matrix
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## This function will Return a matrix that is the inverse of 'x'
#It will take a list from makeCacheMatrix
#It will check to see if the inverse has been calculated
#If the inverse has been calculated, it will return the value
#Otherwise, the inverse will be calculated newly

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- inv(data, ...)
        x$setinverse(m)
        m

}

m_inverse<-makeCacheMatrix()

x<-matrix(1:4,2,2)

#Get the matrix from the makeCacheMatrix method
m_inverse$set(x)
m_inverse$get()

#Get cached data or calculate the inverse
cacheSolve(m_inverse)





