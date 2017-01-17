##Set working directory 
setwd("C:/Users/usuario/Desktop/Data Science/Curso 3 - Data Cleaning/Week 4/Assignment/UCI HAR Dataset")

##Read test files
subjecttest<-read.table("./test/subject_test.txt")
Xtest<-read.table("./test/X_test.txt")
Ytest<-read.table("./test/y_test.txt")

##Read train files
subjecttrain<-read.table("./train/subject_train.txt")
Xtrain<-read.table("./train/X_train.txt")
Ytrain<-read.table("./train/y_train.txt")

##Read features and activity files
activities<-read.table("activity_labels.txt")
features<-read.table("features.txt")

##Add the labels and subjects to the datasets
testdata<-cbind(Xtest,c("labels"=Ytest,"subject"=subjecttest))
traindata<-cbind(Xtrain,c("labels"=Ytrain,"subject"=subjecttrain))

##Join test and train datasets (in the assignment step 1)
experimentdata<-rbind(testdata,traindata)

##Add the names of the columns (in the assignment step 4)
featuresnames<-as.character(features[,2])
names(experimentdata)<-c(featuresnames,"labels","subject")
names(activities)<-c("id","activity")

##Extract the columns of mean, std, labels and subject  (in the assignment step 2)
extracteddata<-experimentdata[,c(grep("mean",featuresnames,value=TRUE),grep("std",featuresnames,value=TRUE),"labels","subject")]

##Add the descriptive activity name (in the assignment step 3)
descriptivedata<-merge(extracteddata,activities,by.x="labels",by.y="id",all=TRUE)

##Create a tidy data set with the average of each activity and each subject (in the assignment step 5)
aggregated<-aggregate(descriptivedata[2:80],list("activity"=descriptivedata$activity,subject=descriptivedata$subject),mean)
tidydataset<-arrange(aggregated,activity,subject)
write.table(tidydataset,"tidydataset.txt",row.names=FALSE)

