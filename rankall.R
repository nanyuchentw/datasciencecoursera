
rankall <- function (outcome, num="best") {
        library(dplyr)
        result.df <- data.frame()
        df <- read.csv("Assignment3/outcome-of-care-measures.csv")
        suppressWarnings(df[, 11] <- as.numeric(df[,11]))
        suppressWarnings(df[, 17] <- as.numeric(df[,17]))
        suppressWarnings(df[, 23] <- as.numeric(df[,23]))
        
        if (!outcome %in% c('heart attack','heart failure','pneumonia')){
             stop('invalid outcome')   
        } else {
                state_vec <- unique(df[,7])
                if (outcome == "heart attack"){
                        for (i in state_vec){
                                temp <-numeric()
                                state_df <- df[df[,7]== i ,]
                                clean_df <- state_df[complete.cases(state_df[,11]), ]
                                n_in_state <- nrow(clean_df)
                                if (num== "best") {
                                        temp <- 1
                                } else if (num== "worst"){
                                        temp <- n_in_state
                                } else {
                                        temp <-num
                                } 
                                state_result <- arrange (clean_df, clean_df[,11], clean_df[,2])
                                new_data <- data.frame(hospital=state_result[temp, 2], state=i)
                                result.df <-rbind (result.df, new_data)
                                temp <- NULL
                                }
                } else if (outcome== "heart failure"){
                        for (i in state_vec){
                                temp <-numeric()
                                state_df <- df[df[,7]== i ,]
                                clean_df <- state_df[complete.cases(state_df[,17]), ]
                                n_in_state <- nrow(clean_df)
                                if (num== "best") {
                                        temp <- 1
                                } else if (num== "worst"){
                                        temp <- n_in_state
                                } else {
                                        temp <-num
                                } 
                                state_result <- arrange (clean_df, clean_df[,17], clean_df[,2])
                                new_data <- data.frame(hospital=state_result[temp, 2], state=i)
                                result.df <-rbind (result.df, new_data)
                                temp <-NULL
                                }
                } else {
                        for (i in state_vec){
                                temp <-numeric()
                                state_df <- df[df[,7]== i ,]
                                clean_df <- state_df[complete.cases(state_df[,23]), ]
                                n_in_state <- nrow(clean_df)
                                if (num== "best") {
                                        temp <- 1
                                } else if (num== "worst"){
                                        temp <- n_in_state
                                } else {
                                        temp <-num
                                } 
                                state_result <- arrange (clean_df, clean_df[,23], clean_df[,2])
                                new_data <- data.frame(hospital=state_result[temp, 2], state=i)
                                result.df <-rbind (result.df, new_data)
                                temp <-NULL
                                }
                        } 
                }
        result <- arrange (result.df, state)
}

