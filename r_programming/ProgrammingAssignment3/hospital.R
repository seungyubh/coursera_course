## numerous functions to rank the hospitals in specific states
## with repect to specific disease or condition

## best function will find the best hospital in a given state

best <- function(state, outcome) {
        outcomeRead(state, outcome)
        
}

## outcomeRead funciton will read in the "outcome-of-care-measures.csv"
## and trim the data as specified

outcomeRead <- function(state, outcome) {
        rawOutcome <<- read.csv("outcome-of-care-measures.csv",
                                colClasses = "character", na.strings = "Not Available")
        listOfOutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
        outcomeOfInterest <- rawOutcome[,c(2,7,listOfOutcome[outcome])]
        validOutcome <- complete.cases(outcomeOfInterest)
        outcomeOfInterest[validOutcome,]
}

