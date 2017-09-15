## practice function that does not seem to have
## a clear functionality

myfunction <- function(y) {
	y <- rnorm(100)
	mean(y)
}

second <- function(x) {
	x + rnorm(length(x))
}