# Getting-and-Cleaning-Data-Course-Project
## Files

*codebook.md* : this file describes the variables

*run_analysis.R* : this is the script executed to obtained the tidydataset

*tidydataset.txt* :is a tidy data set with the average of each variable for each activity and each subject

## How the script works


Dplyr
package must to be loaded before executing (library(dplyr))

The
script is divided into the next steps:

1. Set the working directory

2. Read files:

    Test files (x_test.txt, y_test.txt, subject_test.txt)

    Train files (X_train.txt, y_train.txt, subject_train.txt)

    Features (“features.txt”) and activity names (“activity_labels.txt”)

3. Add the labels (y_test and y_train) and the subjects to the datasets

4. Merge the train and test data sets

5. Add names to the columns

6. Add the descriptive activity name (using “activity_labels.txt”)

7. Create a tidy data set with the average of each activity and each subject
