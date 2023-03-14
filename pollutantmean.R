
pollutantmean <- function(directory, pollutant, id= 1:332){
        for (x in id){
                total <- 0
                number <-0
                y <-formatC(x, width = 3, format = "d", flag = "0")
                file <-paste(directory, "/", y, ".csv",  sep ='') 
                xdata <- read.csv(file)
                #讀取非NA的數值，並加總
                total <- total+ sum(xdata[ ,pollutant], na.rm = TRUE)
                #以下計算非NA的數值個數
                clean_data <- xdata[complete.cases(xdata[ , pollutant]), ]
                number <- number+ nrow(clean_data)
        }
    total/number
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

#以下測試用code
xdata <- read.csv("specdata/001.csv")
ydata <- xdata[complete.cases(xdata[, "sulfate"]), ]
head(ydata)
clean_data <- xdata[complete.cases(xdata[ , "sulfate"]), ]
clean_data
