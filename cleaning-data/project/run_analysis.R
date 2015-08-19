#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function() {
    #rbind test/subject_test.txt with train/subject_test.txt
    test_subject <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = c("SubjectID"))
    train_subject <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names = c("SubjectID"))
    comp_subject <- rbind(test_subject,train_subject)
    rm(test_subject,train_subject)
    
    #rbind test/y_test.txt with train/y_test.txt
    test_y <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", col.names = c("ActivityID"))
    train_y <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", col.names = c("ActivityID"))
    comp_y <- rbind(test_y,train_y)
    rm(test_y,train_y)
    
    #Read the features so we can label the X file with correct column names.
    features_labels <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", sep = " ")
    
    #rbind test/X_test.txt with train/X_test.txt
    test_x <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", col.names = features_labels[,2])
    train_x <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", col.names = features_labels[,2])
    comp_x <- rbind(test_x,train_x)
    rm(test_x,train_x)
    
    #find the mean and std columns to extract
    meanCols <- features_labels[grepl(".*mean\\(\\)",features_labels$V2),1]
    stdCols <- features_labels[grepl(".*std\\(\\)",features_labels$V2),1]
    
    #Extract columns for mean and std only
    comp_measures <- comp_x[,rbind(meanCols,stdCols)]
    
    #cbind y to subject and to measure
    measurement_data <- cbind(comp_y,comp_subject,comp_measures)
    
    #merge y to activity_labels.txt
    activity_labels <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep = " ", col.names = c("ActivityID","Activity"))
    measurement_data <- merge(measurement_data,activity_labels,all=TRUE)
    
    #Group by SubjectID and Activity to work out average of Mean and StandardDeviation
    aggregate_data <- aggregate(. ~ SubjectID+Activity+ActivityID, data = measurement_data,FUN = mean)
    aggregate_data <- aggregate_data[order(aggregate_data$SubjectID,aggregate_data$ActivityID),]
    aggregate_data
    str(aggregate_data)

}