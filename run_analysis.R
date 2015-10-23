# on the assumption that the zipped files are in your working dir
#Create variables
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
test<- read.table("./UCI HAR Dataset/test/X_test.txt",sep="",header = FALSE)
testhead<- read.table("./UCI HAR Dataset/test/Y_test.txt",sep="",header = FALSE)
activelabels<-read.table("./UCI HAR Dataset/activity_labels.txt",sep="",header = FALSE)
features<-read.table("./UCI HAR Dataset/features.txt",sep="",header = FALSE)

train<- read.table("./UCI HAR Dataset/train/X_train.txt",sep="",header = FALSE)
trainhead<- read.table("./UCI HAR Dataset/train/Y_train.txt",sep="",header = FALSE)

testsub<- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="",header = FALSE)
trainsub<- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="",header = FALSE)

#setnames
names(test)<-features$V2
names(train)<-features$V2

#merge test
testhead$index<-seq(1,nrow(testhead),by=1)
testhead2<-merge(testhead,activelabels,by.x = "V1",by.y = "V1")
sorttesthead <- testhead2[with(testhead2,order(index)),]
names(sorttesthead)<-c("Activity.Num","Index","Activity")

alltest<- cbind(testsub, sorttesthead,test)

#merge for train
trainhead$index<-seq(1,nrow(trainhead),by=1)
trainhead2<-merge(trainhead,activelabels,by.x = "V1",by.y = "V1")
sorttrainhead <- trainhead2[with(trainhead2,order(index)),]
names(sorttrainhead)<-c("Activity.Num","Index","Activity")

alltrain<- cbind(trainsub, sorttrainhead,train)
#create all
all<-rbind(alltest, alltrain)
library(dplyr)

#those containing mean
allmean<- all[grepl("mean",names(all))==TRUE]
allstd<-all[grepl("std",names(all))==TRUE]
allfront<- all[,1:5]
finalpart1<-cbind(allfront,allstd,allmean)

check1<-finalpart1[5]
check2<-finalpart1[39]
sum(check1-check2)
#No difference so drop column 39

finalpart2<- finalpart1[-c(39)]
headers<- names(finalpart2)
headers<-gsub("-"," ",headers)
colnames(finalpart2)<-headers
finalpart2<-rename(finalpart2, Subject = V1)

#creating a summary table by subject & Activity
output<- group_by(finalpart2,Subject,Activity)
output2<- summarise_each(output2,funs(mean))
output2

library(reshape2)
output<-melt(finalpart2,id=c("Subject","Activity"),measure.vars=finalpart2[,5:83])

names(all$V1)<-c("Subject")