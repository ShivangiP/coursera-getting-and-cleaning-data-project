##setting the working directory
library(reshape2)
setwd("./Dataset")

filezip<-"getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
filefolder="UCI HAR Dataset"
if(!file.exists(filefolder))
{
  if(!file.exists(filezip))
  {
    fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl,filezip,"curl")
    unzip(filezip)
  }
}
if(file.exists(filefolder))
{
  print("Hurray ! Zip file is downloaded and unzipped and the location is : ")
  print(getwd())
}

activity_label<- read.table("UCI HAR Dataset/activity_labels.txt")
activity_label[,2]<-as.character(activity_label[,2])

#Extract column names from features.txt
features<-read.table("UCI HAR Dataset/features.txt")
features[,2]<-as.character(features[,2])

#Rectify the column name: Replace -mean , -std , ()- , () from column name  with Mean, Std, ''
featuresReq<-grep(".*mean.*|.*std.*",features[,2])
featuresReq.names<-features[featuresReq,2]

featuresReq.names<-gsub('-mean','Mean',featuresReq.names)
featuresReq.names<-gsub('-std','Std',featuresReq.names)
featuresReq.names<-gsub('[-()]','',featuresReq.names)

#Load train dataset 
train<-read.table("UCI HAR Dataset/train/X_train.txt") [featuresReq]
trainActivities<-read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")

#Read test dataset
test <- read.table("UCI HAR Dataset/test/X_test.txt") [featuresReq]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

#merging data
all_data<-rbind(train,test)
all_activities<-rbind(trainActivities,testActivities)
all_subjects<-rbind(trainSubjects,testSubjects)
mergeData<-cbind(all_data,all_activities,all_subjects)

# column names to merged data
colnames(mergeData)<-c(featuresReq.names,"activity","subject")
mergeData$activity<-factor(mergeData$activity,levels=activity_label[,1],labels=activity_label[,2])
mergeData$subject<-as.factor(mergeData$subject)

mergeData.melted<-melt(mergeData,id=c("subject","activity"))
mergeData.mean<-dcast(mergeData.melted,subject + activity ~ variable, mean)
write.table(mergeData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)