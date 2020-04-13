# Getting-and-Cleaning-Data
Project for Coursera Getting and Cleaning Data Course
# The goal is to produce tidy merged data set of pre-processed sensor signals from Samsung Galaxy S smartphone.
First, the script cleans R Studio environment and loads dlpyr library.
Then, the input file is downloaded and unzipped.
That is followed by reading data from unzipped files to dataframe variables, and introducing columns names for easier labeling later in the script.
After that, the test and traning data are merged into one dataframe by rows (rbind). Subjects, activities and sets are merged by columns (cbind)
From the resulting united data only measurements of the mean and standard deviation are extracted, and activities are labelled.
Variable names are modified to become more descriptive and easier to understand.
Finally, independent data set containing mean of each variable for each activity and each subject is created, and gets written to the output file.
