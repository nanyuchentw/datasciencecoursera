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
