## corr function calculates correlation between
## sulfate and nitrate from monitors that
## provides more data points than specified threshold

## need complete.R as well

corr <- function (directory, threshold = 0) {
        ##uses complete function to have number of complete data
        completeNumbData <- complete(directory)
        ## T or F list that indicates data with above threshold
        testDataAboveThreshold <- completeNumbData[,2] > threshold
        ## return empty numeric vector if no monitors have data points
        ## more than specified threshold
        if (sum(testDataAboveThreshold) < 1) {
                cor_data <- vector("numeric", length = 0)
                return(cor_data)
        }
        ## subset of data that is above threshold
        dataAboveThreshold <- completeNumbData[testDataAboveThreshold,]
        countDataAboveThreshold <- nrow(dataAboveThreshold)
        ## create a list with all files' name
        monitor_list <- list.files(directory, full.names = TRUE)
        ## create an empty data frame
        cor_data <-c()
        ## read in data only above threshold and removes NA
        for (i in 1:countDataAboveThreshold) {
                dat <- read.csv(monitor_list[dataAboveThreshold[i,1]])
                good <- complete.cases(dat)
                good_dat <- dat[good,]
                cor_data <- c(cor_data, c(cor(good_dat[,2], good_dat[,3])))
        }
        cor_data
}