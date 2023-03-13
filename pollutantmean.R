
pollutantmean <- function(directory, pollutant, id= 1:332){
        for (x in id){
                y <-formatC(x, width = 3, format = "d", flag = "0")
                file <-paste(directory, "/", y, ".csv",  sep ='') 
                xdata <- read.csv(file)
                mean(pollutant, na.rm = TRUE)
        }
}

pollutantmean("specdata", sulfate, 1:10)
