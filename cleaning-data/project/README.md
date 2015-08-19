#Overview
The code has comments throughout explaining the steps performed to generate the aggregate set, the steps are also summarised below.

##Steps
The following steps are performed in the run_analysis() function.

1. Row bind test/subject_test.txt with train/subject_test.txt
2. Row bind test/y_test.txt with train/y_test.txt
3. Calculate the mean and standard deviation for test_x.txt
4. Calculate the mean and standard deviation for train_x.txt
5. Column bind the two measurements together
6. Make measurements data frame by column binding y data to subject data and then to measurements data
7. Merge measurements data to activity_labels.txt data on ActivityID column to get the friendly names of the activities
8. Group by SubjectID and Activity to work out average of Mean and StandardDeviation
9. Order the data by SubjectID and ActivityID 
9. Return the aggregated data