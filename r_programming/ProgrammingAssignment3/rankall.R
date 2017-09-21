## ranks the hospitals in with respect to a specified outcome from all states
###### this function is not complete.....

## need plyr package

## rankall function will rank the hospitals for a given outcome in all states

rankall <- function(outcome, num = "best") {
        library(plyr)
        outcomeRead(outcome)
        
        ## testing whether the outcome input is valid
        if(outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia") {
                stop("invalid outcome")
        }
        
        trimData(outcome)
        orderData(outcome, num)
        
}

## outcomeRead funciton will read in the "outcome-of-care-measures.csv"
## and trim the data as specified

outcomeRead <- function(outcome) {
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
orderData <- function(outcome, num) {
        srtdValOutInt <- arrange(validOutcomeOfInterest, State, Outcome, Hospital)
        stateSrtdValOutInt <<- split(srtdValOutInt, srtdValOutInt$State)
        if (num == "best") {num <- 1}
        combinedRank <- data.frame()
        if (num == "worst") {
                last_hos <<- unlist(lapply(stateSrtdValOutInt[1:54], nrow))
                combinedRank <- lapply(stateSrtdValOutInt[[1:54]], function(who) who[last_hos,])
        } else {
                combinedRank <- lapply(stateSrtdValOutInt, function(who) who[num,])
        }
        combinedRank
}