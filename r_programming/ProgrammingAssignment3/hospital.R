## numerous functions to rank the hospitals in specific states
## with repect to specific disease or condition

## best function will find the best hospital in a given state

best <- function(state, outcome) {
        outcomeRead()
        
}

outcomeRead <- function() {
        outcome <<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
}

