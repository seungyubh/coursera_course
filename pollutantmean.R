pollutantmean <- function (directory, pollutant, id = 1:332) {
        monitor_list <- list.files(directory, full.names = TRUE)        ##create a list with all files' name
        dat <-data.frame()                                              ##create an empty data frame
        number_data <- length(monitor_list)                             ##counts how many total data file we have
        for (i in id) {                                                 ##subsets "id" part of total data
                dat <- rbind(dat, read.csv(monitor_list[i]))            ##reads and combines subsets of data
        }
        mean(dat[[pollutant]], na.rm=TRUE)                              ##calculate ave. of indicated pollutant after removing NA
}