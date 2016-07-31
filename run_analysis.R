## Getting and Cleaning Data - Assignment

## Download files, per instructions
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileURL, destfile = "UCI HAR Dataset")


## 1. Merge the training and the test sets to create one data set

## Read in training data
features <- read.table("features.txt", header = FALSE)
actlabels <- read.table("activity_labels.txt", header = FALSE)
subtrain <- read.table("subject_train.txt", header = FALSE)
xtrain <- read.table("X_train.txt", header=FALSE)
ytrain <- read.table("Y_train.txt", header=FALSE)


## Name variables
colnames(actlabels) <- c("Activity ID", "ActivityType")
colnames(subtrain) <- c("SubjectID")
colnames(xtrain) <- c(features[,2])
colnames(ytrain) <- "ActivityID"


## Merge all training data into a single data frame
datatrain <- cbind(ytrain,subtrain,xtrain)


## Read in all test data
subtest <- read.table("subject_test.txt", header = FALSE)
xtest <- read.table("X_test.txt", header = FALSE)
ytest <- read.table("y_test.txt", header = FALSE)


## Name variables
colnames(subtest) <- c("SubjectID")
colnames(xtest) <- c(features[,2])
colnames(ytest) <- "ActivityID"


## Merge all test data into a single data frame
datatest <- cbind(ytest, subtest, xtest)


## Merge all data into single data frame
data <- rbind(datatrain, datatest)


## 2. Extract only the measurements on the mean and standard deviation for each measurement

## Identify variables from the features.txt file
mean_sd <- grep("mean|std", features[,2])


## Subset data from the mean and standard deviation columns using mean_sd as defined above
msd_data <- data[, mean_sd]

## Name the variables in the mean and standard deviation data frame. I thought I had done this before,
## but it seems the cbind lines used above did not carry over the names.
names(msd_data) <- features[mean_sd, 2]


## 3. Uses descriptive activity names to name the activities in the data set

## I created a duplicate of the tidied data frame in case I made any severe errors
## Good call - I messed this up the first time...whoops!
data2 <- data

## Replace the first column of the tidied data frame (ActivityID) with the correct labels
data2[, 1] <- actlabels[data2[, 1], 2]


## 4. Appropriately labels the data set with descriptive variable names

## Since columns 1:2 are named, subset data 1:2 and 3:563; add names to 3:563; cbind subsetted data
subdata <- data2[, 1:2]
subdata2 <- data2[, 3:563]
names(subdata2) <- features$V2
data2 <- cbind(subdata, subdata2)


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject


## For each subset of a data frame, ddaply combines the results into a data frame, applying a function for each column
## by the specified variables. In this case, I'm applying the mean function for pairing of SubjectID and ActivityID
library(plyr)
newdata <- ddply(data2, .(SubjectID, ActivityID), function(x) colMeans(x[, 3:563]))

## Create tidy data set for submission
write.table(newdata, "tidy.txt", row.names = FALSE, quote = FALSE)