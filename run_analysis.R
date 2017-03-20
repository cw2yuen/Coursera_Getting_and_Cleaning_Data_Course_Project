setwd("C:\\Coursera\\Cleaning Data\\Week 3")

############ Defining Constants
c_activity_id_label <- 'ActivityId'
c_activity_type_label <- 'ActivityType'
c_subject_id_label <- 'SubjectId'


############ Merge the training and the test sets to create one data set

# Read in the data from files
features <- read.table('UCI HAR Dataset/features.txt')
activity_type <- read.table('UCI HAR Dataset/activity_labels.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
x_train <- read.table('UCI HAR Dataset/train/x_train.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
x_test <- read.table('UCI HAR Dataset/test/x_test.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')

colnames(activity_type) <- c(c_activity_id_label, c_activity_type_label)
colnames(subject_train) <- c_subject_id_label
colnames(x_train) <- features[,2];
colnames(y_train) <- c_activity_id_label
colnames(subject_test) <- c_subject_id_label
colnames(x_test) <- features[,2]
colnames(y_test) <- c_activity_id_label


training_data <- cbind(y_train, subject_train, x_train)
test_data <- cbind(y_test, subject_test, x_test)
final_data <- rbind(training_data, test_data)

############ Extracts only the measurements on the mean and standard deviation for each measurement

final_data_col_names <- colnames(final_data)
final_data <- final_data[(grepl("[Aa]ctivity..",final_data_col_names) | grepl("[Ss]ubject..",final_data_col_names) | grepl("-mean..",final_data_col_names) & !grepl("-meanFreq..",final_data_col_names) & !grepl("mean..-",final_data_col_names) | grepl("-std..",final_data_col_names) & !grepl("-std()..-",final_data_col_names))]

############ Use descriptive activity names to name the activities in the data set

final_data <- merge(final_data, activity_type, by='ActivityId', all.x=TRUE)

############ Appropriately label the data set with descriptive variable names.

final_data_col_names <- colnames(final_data)

for (i in 1:length(final_data_col_names)) 
{
  final_data_col_names[i] <- gsub("\\()","",final_data_col_names[i])
  final_data_col_names[i] <- gsub("-std$","StdDev",final_data_col_names[i])
  final_data_col_names[i] <- gsub("-mean","Mean",final_data_col_names[i])
  final_data_col_names[i] <- gsub("^(t)","time",final_data_col_names[i])
  final_data_col_names[i] <- gsub("^(f)","freq",final_data_col_names[i])
}

colnames(final_data) <- final_data_col_names

############ From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

intermediate_output <- final_data[,names(final_data) != c_activity_type_label]
intermediate_output <- intermediate_output[,names(intermediate_output) != c_activity_id_label | names(intermediate_output) != c_subject_id_label]
intermediate_output <- aggregate(intermediate_output, by=list(intermediate_output$ActivityId, intermediate_output$SubjectId), mean)
intermediate_output <- intermediate_output[,3:ncol(intermediate_output)]
final_output <- merge(intermediate_output, activity_type, by='ActivityId', all.x=TRUE)

write.table(final_output, 'tidyData.txt', row.names=TRUE, sep='\t')
