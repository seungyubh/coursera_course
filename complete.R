## complete function calculates the number of complete
## cases of data from specified id of monitors

complete <- function (directory, id = 1:332) {
        ## create a list with all files' name
        monitor_list <- list.files(directory, full.names = TRUE)
        ## create an empty data frame
        fin <-data.frame()
        ## subsets "id" part of total data
        for (i in id) {
                ## reads in individual data into intermediate empty data frame
                dat <- read.csv(monitor_list[i])
                ## TRUE if a row is complete / FALSE if a row has NA
                good <- complete.cases(dat)
                ## dat corresponding to good's dimension to
                ## count how many complete cases we have
                nobs <- dim(dat[good,])
                ## combines the list of complete cases into fin data frame
                fin <- rbind(fin, c(i, nobs[1]))
        }
        ## gives fin data frame a column name
        colnames(fin) = c("id", "nobs")
        fin
}
