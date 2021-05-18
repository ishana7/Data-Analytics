library(e1071)
#rpart is used for desicion tree making
library (rpart)
library (caTools)
#library (rpart.plot)
#file.exists("D:\\DPS\\Class_data\\BE\\LP1\\2010-capitalbikeshare-tripdata.csv")
#mydata1 <-read.csv(file = "D:\\DPS\\Class_data\\BE\\LP1\\2010-capitalbikeshare-tripdata.csv",header=TRUE,sep=",")
mydata1 <-read.csv("DA/DA3/dataset1.csv",header = TRUE)
View(mydata1)

#pick up only column 1,4,6,9 from dataset
subset_mydata<-mydata1[,c(1,4,6,9)]
View(subset_mydata)

#split the dataset

temp_field<-sample.split(subset_mydata,SplitRatio = 0.9)

train<-subset(subset_mydata,temp_field==TRUE)
test<-subset(subset_mydata,temp_field==FALSE)

summary(train)
summary(test)

head(train)
head(test)

fit<-rpart(train$Membertype~.,data=train,method="class")
rpart.plot(fit)
plot(fit)
text(fit)

#test data excluding last column
preds<-predict(fit,newdata=test[,-4],type=("class"))
mean(preds==test$Membertype)

#display output of test data

output1<-cbind(test,preds)
View(output1)
output1

table(preds,test$Membertype,dnn=c("predicted","actual"))
#cp for post pruning

printcp(fit)
#get the value of cp with min xerror
opt<-which.min(fit$cptable[,"xerror"])
cp<-fit$cptable[opt,"CP"]
cp
#prune tree
pruned_model<-prune(fit,cp)
rpart.plot(fit)
text(fit)

rpart_pruned_predict<-predict(pruned_model,test[,-4],type="class")

mean(rpart_pruned_predict==test$Membertype)

output1<-cbind(test,rpart_pruned_predict)
View(output1)

