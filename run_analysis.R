rm(list=ls())
setwd("C:\\Users\\Menashe\\Google Drive\\Coursera\\Working Directory")

library(plyr)
library(dplyr)

## To use descriptive activity names to name the activities in the data set
##	prepare the data to change the numeric value of Activity to a descriptive Factor

ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors=FALSE)

#########################
## Read the train data
#########################

## Read the Subjects data
Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

## Read the Activity Data
Activity<-read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)

## Convert numeric activities to factors
Activity2 <- data.frame(apply(Activity, 2, as.factor))

## Convert Activity factors to descriptive factors - task #3
levels(Activity2[,1]) <- ActivityLabels[,2]

#read train measurements data
Measurements <- 
    read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

## Build the train data frame	
TrainDF <- cbind(Subjects, Activity2, Measurements)

#########################
## Read the test data
#########################

## Read the Subjects data
Subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

## Read the Activity Data
Activity<-read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)

## Convert numeric activities to factors
Activity2 <- data.frame(apply(Activity, 2, as.factor))

## Convert Activity factors to descriptive factors - task #3
levels(Activity2[,1]) <- ActivityLabels[,2]

#read test measurements data
Measurements <- 
    read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

## Build the test data frame	
TestDF <- cbind(Subjects, Activity2, Measurements)
	
	
#########################################################
##
## Merge the two data sets - Task #1
##
#########################################################

MergedDF <- rbind(TrainDF, TestDF)

#########################################################
### add descriptive variable names, based on the feature.txt file
###   Task #4
#########################################################

## Name the Subject and Activity columns
cols1 <- data.frame( V1=c(0,0),  V2=c("Subject","Activity"))

## Read the columns name from the features file
cols2 <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

##Create the column name list
cols <-rbind(cols1,cols2)

## Assign the column names
colnames(MergedDF)<-cols[,2]

###################################################
##
## Extract only the mean and std columns - task #2
##
###################################################

logicalVec1 <- grepl("mean", names(MergedDF))
logicalVec2 <- grepl("std", names(MergedDF))

logicalVec <- logicalVec1 | logicalVec2

## Keep the Subject and Activity
logicalVec[1] <- TRUE
logicalVec[2] <- TRUE

ExtractedDF <- MergedDF[, logicalVec]


##############################################################
##
## Calculate the average for each Sunject and each Activity - total of 180 rows 
##  (30 subjects 8 6 Activities)
##  This is task #5
##############################################################


tidy <- ddply(ExtractedDF, .(Subject, Activity), colwise(mean))

###########################
### create the output file
###########################

write.table(tidy, file="tidy.txt", row.name=FALSE)



