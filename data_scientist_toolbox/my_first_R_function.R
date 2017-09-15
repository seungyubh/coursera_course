## practice functions that demonstrates basics of R

## add2 adds two input vector
add2 <- function(x, y) {
        x + y
}

## outputs numbers greater than 10 from an input list
above10 <- function(x) {
        use <- x > 10
        x[use]
}

## outputs numbers greater than n from an input list
above <- function(x, n = 10) {
        use <- x > n
        x[use]
}

## columnmean calculates mean of each column in provided data frame
columnmean <- function(y, removeNA = TRUE) {
        nc <- ncol(y)
        means <- numeric(nc)
        for(i in 1:nc) {
                means[i] <- mean(y[,i], na.rm = removeNA)
        }
        means
}