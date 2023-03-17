
corr <- function (directory, threshold= 0){
        result <- numeric()
        df <- complete(directory)
        selected_df <- df[ (df$nobs) >threshold, ]
        if (nrow(selected_df) == 0){
            result
        } else {
            for (x in 1:nrow(selected_df)){
                y <-formatC(selected_df[x, 1], width = 3, format = "d", flag = "0")
                filename <- paste(directory, "/", y, ".csv", sep="")
                each_df <- read.csv(filename)
                clean_data <- each_df[complete.cases(each_df), ]
                result[x] <- cor(clean_data$sulfate, clean_data$nitrate)
                }
        
        }
        result
}
