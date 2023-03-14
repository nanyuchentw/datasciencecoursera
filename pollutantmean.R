
pollutantmean <- function(directory, pollutant, id= 1:332){
    total <- 0
    number <-0
    for (x in id){
                y <-formatC(x, width = 3, format = "d", flag = "0")
                file <-paste(directory, "/", y, ".csv",  sep ='') 
                xdata <- read.csv(file)
                #print(file)
                #讀取非NA的數值，並加總
                total <- total+ sum(xdata[ ,pollutant], na.rm = TRUE)
                #cat("total=", total, '\n')
                #以下計算非NA的數值個數
                clean_data <- xdata[complete.cases(xdata[ , pollutant]), ]
                #cat("begin_num", number, '\n')
                number <- number+ nrow(clean_data)
                #cat("end_num", number, '\n')
        }
    total/number
}


#以下測試用code
xdata <- read.csv("specdata/001.csv")
ydata <- xdata[complete.cases(xdata[, "sulfate"]), ]
head(ydata)
clean_data <- xdata[complete.cases(xdata[ , "sulfate"]), ]
clean_data

# 以下檢驗用code
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)     # 答案為 4.064128
pollutantmean("specdata", "nitrate", 70:72)    # 答案為 1.706047
pollutantmean("specdata", "nitrate", 23)       # 答案為 1.280833
