complete <- function (directory, id = 1:332) {
        monitor_list <- list.files(directory, full.names = TRUE)        ##create a list with all files' name
        fin <-data.frame()                                              ##create an empty data frame
        number_data <- length(monitor_list)                             ##counts how many total data file we have
        for (i in id) {                                                 ##subsets "id" part of total data
                dat <- read.csv(monitor_list[i])                        ##read in individual data into intermediate empty data frame
                good <- complete.cases(dat)                             ##TRUE if a row is complete / FALSE if a row has NA
                nobs <- dim(dat[good,])                                 ##dat corresponding to good's dimension to count how many complete cases we have
                fin <- rbind(fin, c(i, nobs[1]))                        ##combines the list of complete cases into fin data frame
        }
        colnames(fin) = c("id", "nobs")                                 ##gives fin data frame a column name
        fin
}
