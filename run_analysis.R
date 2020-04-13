#init

library(dplyr)
rm(list = ls(all.names = TRUE))

#preparing files

url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "project_c3.zip", method="curl")
unzip("project_c3.zip")
setwd("./UCI HAR Dataset/")


#reading into variables

features <- read.table("./features.txt", col.names = c("f_id","var"))
activity_labels <- read.table("./activity_labels.txt", col.names = c("ac_id", "activity"))

subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")

X_test <- read.table("./test/X_test.txt", col.names = features$var)
y_test <- read.table("./test/y_test.txt", col.names = "ac_id")

X_train <- read.table("./train/X_train.txt", col.names = features$var)
y_train <- read.table("./train/y_train.txt", col.names = "ac_id")

#Merges the training and the test sets to create one data set

subject_merged <- rbind(subject_train, subject_test)
y_merged <- rbind(y_train, y_test)
X_merged <- rbind(X_train, X_test)

data_merged <- cbind(subject_merged, y_merged, X_merged)

#Extracts only the measurements on the mean and standard deviation

data_merged_ms <- data_merged %>% select(subject, ac_id, contains("mean"), contains("std"))

#Uses descriptive activity names to name the activities in the data set

data_merged_ms$ac_id <- activity_labels[data_merged_ms$ac_id, 2]

#labels the data set with descriptive variable names

names(data_merged_ms) <- gsub("^t", "time", names(data_merged_ms))
names(data_merged_ms) <- gsub("^f", "frequency", names(data_merged_ms))
names(data_merged_ms) <- gsub("Acc", "Accelerometer", names(data_merged_ms))
names(data_merged_ms) <- gsub("Mag", "Magnitude", names(data_merged_ms))
names(data_merged_ms) <- gsub("Gyro", "Gyroscope", names(data_merged_ms))
names(data_merged_ms)[2] <- "Activity"

#creates a second, independent tidy data set with the average of each variable

data_output <- data_merged_ms %>%
    group_by(subject, Activity) %>%
    summarise_each(funs(mean))

#writes to the file

write.table(data_output, "data_output.txt", row.name=FALSE, col.names = TRUE)
