best <- function(state, outcome){
    library(dplyr)
    df <- read.csv("Assignment3/outcome-of-care-measures.csv")
    if (state %in% df[, 7]){
        if(outcome %in% c("heart attack",'pneumonia', 'heart failure')){
            temp <-df [df[, 7]== state, ]   # pick out the state's hospital
            if (outcome=="heart attack"){
                suppressWarnings(temp [, 11] <- as.numeric(temp[,11]))
                result <-arrange(temp, temp[, 11], temp[,2])  # for heart attack ranking
                print(result[1, 2])
            } else if (outcome== "heart failure"){
                suppressWarnings(temp [, 17] <- as.numeric(temp[,17]))
                result <-arrange(temp, temp[,17], temp[,2])  # for heart attack ranking
                print(result[1, 2])
            } else {
                suppressWarnings(temp [, 23] <- as.numeric(temp[,23]))
                result <-arrange(temp, temp[, 23], temp[,2])  # for heart attack ranking
                print(result[1, 2])
            }
        } else {
            print("invalid outcome")
        }
    } else {
        print("invalid state")
    }
}
