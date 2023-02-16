library(rstudioapi)
library(caret)
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path ))
rm(list=ls())
cat("\014")

load("customer.rdata")
attach(cust)

set.seed(25) #sets seed to 25
train = 0.75
index = createDataPartition(y = cust$profit, p = test, list = FALSE) #specifies training and testing data sets
training = cust[index, ]
testing = cust[-index, ]
 
training_results = lm(training~profit,timetoreturn)    
pred = predict(training_results)
par(mfrow=c(1,1))                                       
par(pch=20, col="black")                                 
plot(timetoreturn,profit,type='p', xlab="Time to Return", ylab="Profit")      
lines(timetoreturn,pred) 

length(timetoreturn)
length(profit)
