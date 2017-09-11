corr <- function (directory, threshold = 0) {
        completeNumbData <- complete(directory)                         ##uses complete function to have number of complete data
        testDataAboveThreshold <- completeNumbData[,2] > threshold
        if (sum(testDataAboveThreshold) < 1) {
                cor_data <- vector("numeric", length = 0)
                return(cor_data)
        }
        dataAboveThreshold <- completeNumbData[testDataAboveThreshold,]
        countDataAboveThreshold <- nrow(dataAboveThreshold)
        monitor_list <- list.files(directory, full.names = TRUE)        ##create a list with all files' name
        cor_data <-c()                                                  ##create an empty data frame
        for (i in 1:countDataAboveThreshold) {
                dat <- read.csv(monitor_list[dataAboveThreshold[i,1]])
                good <- complete.cases(dat)
                good_dat <- dat[good,]
                cor_data <- c(cor_data, c(cor(good_dat[,2], good_dat[,3])))
        }
        cor_data
}