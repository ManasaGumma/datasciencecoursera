makeCachematrix<-function(x=matrix()){
  inv <- NULL
  set <- function(y){
    x<<-y
    inv<<-NULL }
  get<-function(){x}
  setInverse<-function(inverse){inv<<-inverse}
  getInverse<<-function(){inv}
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)}
cacheSolve<-function(x,...){
  inv<-x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)}
  mat<-x$get()
  inv<-sovle(mat,...)
  x$setInverse(inv)
  inv}
  
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
