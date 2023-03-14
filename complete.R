
complete <- function(directory, id= 1:332){
    df <- data.frame()
    for (x in id){
        y <-formatC(x, width = 3, format = "d", flag = "0")
        filename <- paste(directory, "/", y, ".csv", sep="")
        each_df <- read.csv(filename)
        clean_each_df <- each_df[complete.cases(each_df), ]
        data_vector <- c(x, nrow(clean_each_df))
        df <-rbind (df, data_vector)
    }
    colnames(df) <- c("id", "nobs")
    df
}

