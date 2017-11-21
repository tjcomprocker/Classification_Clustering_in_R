library(e1071)

dataset_org <- read.csv("bank.csv",sep=";")

x <- dataset_org[1:3165,]
x_test <- dataset_org[3166:nrow(dataset_org),]
y_test <- x_test$y
x_test$y <- NULL
y <- data.frame(dataset_org[1:3165,14])

svm_model <- svm(y~. , data = x , kernel = "linear")
pred <- predict(svm_model,x_test)
pred <- data.frame(table(pred,y_test))

print (((sum(pred[1,3],pred[4,3]))/(sum(pred[,3])))*100)