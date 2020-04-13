
CodeBook

This code book describes all the variables and summaries calculated, along with units, and any other relevant information.

Source

Link to description: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Dataset description : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Dataset Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

Data

The dataset includes the following files:

•	‘subject_train’ & subject_test - Volunteers who performed activity

•	'features_info.txt' - Variables used with the feature vector

•	'features.txt' – Features

•	'activity_labels.txt' - Links labels with their activity name

•	'train/X_train.txt' - Training set

•	'train/y_train.txt' - Training labels

•	'test/X_test.txt' - Test set

•	'test/y_test.txt' - Test labels

Data transformation

Transformation requirements are the following:

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How run_analysis.R implemented:

1.	Require dplyr library
2.	Load the features and activity labels
3.	Loads test and training data
4.	Merges test and training data
5.	Extract the mean and standard deviation columns
6.	Adds activity labels
7.	Creates new data set of mean variables by subject and activity
8.	Exports new data set to file
