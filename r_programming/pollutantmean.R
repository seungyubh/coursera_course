## pollutantmean is a basic function that calculates the mean of specified
## pollutant from specified id of monitors

pollutantmean <- function (directory, pollutant, id = 1:332) {
        ##create a list with all files' name to read
        monitor_list <- list.files(directory, full.names = TRUE)
        ##create an empty data frame to store read datas
        dat <-data.frame()
        ##subsets "id" part of total data
        for (i in id) {
                ##reads and combines subsets of data
                dat <- rbind(dat, read.csv(monitor_list[i]))
        }
        ##calculate ave. of specified pollutant after removing NA
        mean(dat[[pollutant]], na.rm=TRUE)
}

## working prototype
onelinePollutantMean <- function(directory, pollutant, id = 1:332) {
        mean(unlist(lapply(dir(directory, full.name = TRUE), function(data) read.csv(data$pollutant))))
}