## finds the best hospitals in specific states with repect to
## a specific disease or condition

## need plyr package

## best function will find the best hospital in a given state for a given outcome

best <- function(state, outcome) {
        library(plyr)
        outcomeRead(state, outcome)
        
        ## testing whether the state and outcome input is valid
        if((state %in% rawOutcome$State) == FALSE) {
                stop("invalid state")
        } else if(outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia") {
                stop("invalid outcome")
        }
        
        trimData(state, outcome)
        orderData(state, outcome)
        
}

## outcomeRead funciton will read in the "outcome-of-care-measures.csv"
## and trim the data as specified

outcomeRead <- function(state, outcome) {
        rawOutcome <<- read.csv("outcome-of-care-measures.csv",
                                stringsAsFactors = FALSE, na.strings = "Not Available")
}

## trimming of data for interested outcome
trimData <- function(state, outcome) {
        listOfOutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
        outcomeOfInterest <- rawOutcome[,c(2,7,listOfOutcome[outcome])]
        names(outcomeOfInterest) <- c("Hospital", "State", "Outcome")
        validOutcomeOfInterest <<- outcomeOfInterest[complete.cases(outcomeOfInterest),]
}

## ordering the valid outcome of interest
orderData <- function(state, outcome) {
        srtdValOutInt <- arrange(validOutcomeOfInterest,State, Outcome)
        stateSrtdValOutInt <- split(srtdValOutInt, srtdValOutInt$State)
        stateSrtdValOutInt[[state]][1,1]
}

