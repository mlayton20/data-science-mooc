#Overview
The code has comments throughout explaining the steps performed to generate the aggregate set, the steps are also summarised below.

##Steps
The following steps are performed in the run_analysis() function.

1. Row bind test/subject_test.txt with train/subject_train.txt
2. Row bind test/y_test.txt with train/y_train.txt
3. Read features to get the names of the columns in X file.
4. Row bind test/X_test.txt with train/X_train.txt
5. Find the mean columns. Columns that contain "mean()" will be extracted.
6. Find the standard deviation columns. Columns that contain "std()" will be extracted.
7. Make X data to extract the mean and std columns from X
8. Make measurements data frame by column binding y data to subject data and then to X data
9. Merge measurements data to activity_labels.txt data on ActivityID column to get the friendly names of the activities
10. Group by SubjectID and Activity to work out average of each measurement variable
11. Order the data by SubjectID and ActivityID 
12. Return the aggregated data