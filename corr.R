corr <- function(directory, threshold = 0) {
        all = complete(directory)
        ids = all[all["nobs"] > threshold, ]$id
        correlation = numeric()
        for (i in ids) {
                filename = read.csv(paste(directory, "/", formatC(i, width = 3, 
                                                flag = "0"), ".csv", sep = ""))
                allb = filename[complete.cases(filename), ]
                correlation = c(correlation, cor(allb$sulfate, allb$nitrate))
        }
        return(correlation)
}