### Peer Assessment Assignment, Coursera Getting and Cleaning Data class
# You should create one R script called run_analysis.R that does the following. 

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

################################################################################
### Data Pre-processing

# download and unzip dataset
D_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(D_url, destfile="./Dataset.zip")
unzip("Dataset.zip")

# reading train- and test- data
labels   <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names = features$V2)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names="activity")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="id")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names = features$V2)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names="activity")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="id")


################################################################################
### Analysis

## 1. Merges the training and the test sets to create one data set.
X_merge = rbind(X_train , X_test)
y_merge = rbind(y_train , y_test)
subject_merge = rbind(subject_train,subject_test)
data  <- cbind(subject_merge, y_merge, X_merge)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
data2 <- data[,c(1,2, grep("std", names(data)), grep("mean", names(data)))]

## 3. Uses descriptive activity names to name the activities in the data set
# already done in reading dataset.

## 4. Appropriately labels the data set with descriptive activity names. 
data2$activity <- factor(data2$activity, levels=labels$V1, labels=labels$V2)
data2$id <- as.numeric(data2$id)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidy <- ddply(data2, .(id, activity), .fun=function(x){colMeans(x[,-c(1:2)])})
# take a look, probably 180 row x 81 column
dim(tidy)


################################################################################
### Summarize the output
write.table(tidy,file="tidy_data.txt")
