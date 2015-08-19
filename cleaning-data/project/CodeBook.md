---
title: "CodeBook"
author: "Matthew Layton"
---

#Overview
The run_analysis script uses data from the following files to generate an aggregated set of data showing the mean and standard deviation for each Subject and Activity grouping against each variable. The source data represents movement of subjects performing daily activities such as walking, sitting and laying.

Source Files used:

- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Movement of subjects in each activity, broken down by time intervals
- 'y_train.txt': Labels for the activities performed, these will match to the activity_labels.txt
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'features.txt': List of all features. Each entry represents a column in the x file.

The script merges the test and training set data together, extract the mean and standard deviation columns on each row then aggregates the data as described above. The aggregated data is then ordered by subject and activity for ease of use.

#Output Columns

* SubjectID - The ID's for each subject that performed in the experiment. Possible Values: 
    + 1 to 30
* Acitivity (ActivityID) - The Activities performed. Possible Values:
    + WALKING (1)
    + WALKING_UPSTAIRS (2)
    + WALKING_DOWNSTAIRS (3)
    + SITTING (4)
    + STANDING (5)
    + LAYING (6)
* ActivityID - See bracketed values above for ID mapping to Activity.
* \*mean()\* - The average of each measurement relating to mean
* \*std()\* - The average of each measurement relating to standard deviation (std)

#Usage
The is how to run the script:
```
run_analysis()
```
