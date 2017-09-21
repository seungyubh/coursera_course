## ranks the hospitals in a specified state with respect to a specified outcome

## need plyr package

## rankhospital function will rank the hospitals in a given state for a given outcome

rankhospital <- function(state, outcome, num) {
        library(plyr)
        outcomeRead(state, outcome)
        
        ## testing whether the state and outcome input is valid
        if((state %in% rawOutcome$State) == FALSE) {
                stop("invalid state")
        }
        else if(outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia") {
                stop("invalid outcome")
        }
        
        trimData(outcome)
        orderData(state, outcome, num)
        
}

## outcomeRead funciton will read in the "outcome-of-care-measures.csv"
## and trim the data as specified

outcomeRead <- function(state, outcome) {
        rawOutcome <<- read.csv("outcome-of-care-measures.csv",
                                stringsAsFactors = FALSE, na.strings = "Not Available")
}

## trimming of data for interested outcome
trimData <- function(outcome) {
        listOfOutcome <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
        outcomeOfInterest <- rawOutcome[,c(2,7,listOfOutcome[outcome])]
        names(outcomeOfInterest) <- c("Hospital", "State", "Outcome")
        validOutcomeOfInterest <<- outcomeOfInterest[complete.cases(outcomeOfInterest),]
}

## ordering the valid outcome of interest
orderData <- function(state, outcome, num) {
        srtdValOutInt <- arrange(validOutcomeOfInterest, State, Outcome, Hospital)
        stateSrtdValOutInt <- split(srtdValOutInt, srtdValOutInt$State)
        if (num == "worst") {num <- dim(stateSrtdValOutInt[[state]])[1]}
        if (num == "best") {num <- 1}
        stateSrtdValOutInt[[state]][num,1]
}