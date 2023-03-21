rankhospital <- function (state, outcome, num=0){
        library(dplyr)
        df <- read.csv("Assignment3/outcome-of-care-measures.csv")
        suppressWarnings(df[, 11] <- as.numeric(df[,11]))
        suppressWarnings(df[, 17] <- as.numeric(df[,17]))
        suppressWarnings(df[, 23] <- as.numeric(df[,23]))
        temp <- numeric()
        if (!state %in% df[, 7]){
                stop("invalid state") 
        } else {
                df <- df [df[, 7]==state, ]
                if (!outcome %in% c('heart attack','heart failure','pneumonia')){
                        stop('invalid outcome') 
                } else {
                        if(outcome =="heart attack") {
                                n_attack <- length(df[, 11] [complete.cases(df[,11])])
                                if (num=="best") {
                                        temp <-1
                                } else if (num == "worst"){
                                        temp <- n_attack        
                                } else {
                                        temp <- num
                                }
                                a_df <- df[, c(2, 11)]
                                a_df <- a_df[complete.cases(a_df),]
                                names(a_df) <- c("hospital", "attack")
                                result_df <- arrange(a_df, attack, hospital)
                                print(result_df[temp, 1])
                                
                        } else if (outcome =="heart failure"){
                                n_failure <- length (df[, 17] [complete.cases(df[,17])])
                                if (num=="best") {
                                        temp <-1
                                } else if(num== "worst"){
                                        temp <- n_failure
                                } else {
                                        temp <-num        
                                        }
                                f_df <- df[, c(2, 17)]
                                f_df <- f_df[complete.cases(f_df),]
                                names(f_df) <- c("hospital", "failure")
                                result_df <- arrange(f_df, failure, hospital)
                                print(result_df[temp, 1])
                                
                        } else {
                                n_pneumonia <- length (df[, 23] [complete.cases(df[,23])])
                                if (num=="best") {
                                        temp <-1
                                } else if (num =="worst") {
                                        temp <- n_pneumonia        
                                } else {
                                        temp <- num        
                                        }
                                p_df <- df[, c(2, 23)]
                                p_df <- p_df[complete.cases(p_df),]
                                names(p_df) <- c("hospital", "pneumonia")
                                result_df <- arrange(p_df, pneumonia, hospital)
                                print(result_df[temp, 1])
                                }
                        }
                }        
        }        
       