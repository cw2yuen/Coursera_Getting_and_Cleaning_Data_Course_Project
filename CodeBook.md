---
title: 'Peer-graded Assignment: Getting and Cleaning Data Course Project'
author: "Aaron Yuen"
date: "March 19, 2017"
output: html_document
---


## What is this document?

This is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data in this proejct.

## Variables

Here are the variables used in the run_analysis.R script:

 1. training_data - Training data with merged columns from the provided input files
 
 2. test_data - Test data with merged columns from the provided input files
 
 3. final_data - Combined data of training_data and testing_data
 
 4. intermediate_output - An intermediate output for data cleaning and processing
 
 5. final_output - Final output to produce tidyData.txt
 

## Data

tidyData.txt contains the following columns:

 1. ActivityId
 
 2. SubjectId
 
 3. timeBodyAccMagMean
 
 4. timeBodyAccMagStdDev
 
 5. timeGravityAccMagMean
 
 6. timeGravityAccMagStdDev
 
 7. timeBodyAccJerkMagMean
 
 8. timeBodyAccJerkMagStdDev
 
 9. timeBodyGyroMagMean
 
 10. timeBodyGyroMagStdDev
 
 11. timeBodyGyroJerkMagMean
 
 12. timeBodyGyroJerkMagStdDev
 
 13. freqBodyAccMagMean
 
 14. freqBodyAccMagStdDev
 
 15. freqBodyBodyAccJerkMagMean
 
 16. freqBodyBodyAccJerkMagStdDev
 
 17. freqBodyBodyGyroMagMean
 
 18. freqBodyBodyGyroMagStdDev
 
 19. freqBodyBodyGyroJerkMagMean
 
 20. freqBodyBodyGyroJerkMagStdDev
 
 21. ActivityType


## Transformations and Data Cleaning

The following steps were done in run_analysis.R

 1. Merges the training and the test sets to create one data set.

 2. Extracts only the measurements on the mean and standard deviation for each measurement.

 3. Uses descriptive activity names to name the activities in the data set

 4. Appropriately labels the data set with descriptive variable names.

 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
The following transformations and cleaning were done:

 1. Column names were cleaned up
 
 2. Unncessary columns were removed
 
 
 