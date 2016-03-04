# GettingAndCleaningDataAssignment
Assignment for Getting and Cleaning Data

Steps:

1. Merges the training and the test sets to create one data set.

    Read in all data sets and create 3 output sets, x_joined, y_joined and subject_joined

2. Extracts only the measurements on the mean and standard deviation for each measurement.

    Rad in the featuire and activity data and provide colume names. Create an integer vector of indices for the mean and standard features we wish to extract later.

3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.

    Extract all the data of interest and merge activity, feature and subject info with appropriate column names and writ eout the dataset to tidy_data.txt

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

    lapply the mean groupd by subjectID and activity. Write out the data to results.txt
