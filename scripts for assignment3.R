#part1
outcome <- read.csv("Assignment3/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
suppressWarnings(outcome[,11] <- as.numeric(outcome[,11]))
hist(outcome[,11])

#part 2
source("best.R")
best("TX", "heart attack")
best("TX", "heart failure")
best ('MD', 'heart attack')
best('MD', "pneumonia")

best("BB", "heart attack")
best("NY", "hert attack")

#part3
source("rankhospital.R")
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)

rankhospital("BB", "heart failure", 4)
rankhospital("NY", "hart failure", 5)

#part4
source("rankall.R")
head(rankall("heart attack", 20), 10)
tail(rankall('pneumonia', 'worst'),3)
tail(rankall('heart failure'), 10)


result.df <- data.frame()
num <- 3
for (i in c("UT")){
    state_df <- df[df[,7]== i ,]
    clean_df <- state_df[complete.cases(state_df[,17]), ]
    n_in_state <- nrow(clean_df)
    state_result <- arrange (clean_df, clean_df[,17])
    new_data <- data.frame(hospital=state_result[num, 2], state=i)
    result.df <-rbind (result.df, new_data)
    }
result.df

tail(state_result)
k <- state_result[ ,c(2, 17)]
k
