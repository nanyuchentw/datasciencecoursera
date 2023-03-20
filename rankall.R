
rankall <- function (outcome, num) {
        library(dplyr)
        result.df <- data.frame("hospital"=NULL, "state"=NULL)
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
                                state_df <- df[df[,7]== state_vec[i] ,]
                                clean_df <- state_df[complete.cases(state_df[,11]), ]
                                n_in_state <- nrow(clean_df)
                                if (num== "best") {num <-1}
                                if (num== "worst"){num <- n_in_state} 
                                state_result <- arrange(clean_df, clean_df[,11], clean_df[,2])
                                rbind (result.df, c(state_result[num, 2], i))
                        }
                } else if (outcome== "heart failure"){
                        for (i in state_vec){
                                state_df <- df[df[,7]== state_vec[i] ,]
                                clean_df <- state_df[complete.cases(state_df[,17]), ]
                                n_in_state <- nrow(clean_df)
                                if (num== "best") {num <-1}
                                if (num== "worst"){num <- n_in_state}
                                state_result <- arrange(clean_df, clean_df[,17], clean_df[,2])
                                rbind (result.df, c(state_result[num, 2], i))
                        }
                } else {
                        for (i in state_vec){
                                state_df <- df[df[,7]== state_vec[i] ,]
                                clean_df <- state_df[complete.cases(state_df[,23]), ]
                                n_in_state <- nrow(clean_df)
                                if (num== "best") {num <-1}
                                if (num== "worst"){num <- n_in_state} 
                                state_result <- arrange(clean_df, clean_df[,23], clean_df[,2])
                                rbind (result.df, c(state_result[num, 2], i))
                        }
                }
                result.df
        }
}


num <- 10
for (i in state_vec){
        state_df <- df[df[,7]== state_vec[i] ,]
        clean_df <- state_df[complete.cases(state_df[,11]), ]
        n_in_state <- nrow(clean_df)
        state_result <- arrange(clean_df, clean_df[,11], clean_df[,2])
        rbind (result.df, c(state_result[num, 2], i))
}
result.df