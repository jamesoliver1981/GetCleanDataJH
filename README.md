# GetCleanDataJH
Repo for the Getting and Cleaning Data Course as part of Coursera Specialisation from John Hopkins

This READ ME file was created on 23/10/2015 at 18:12 CET and updated at 23/10/2015 at 18:12 CET

The code that this file is associated with manipulates data that can be found from this url
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Once downloaded into the working directory, the code will combine a number of sources within this file to create a tidy dataset.

Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
These activities were performed whilst wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The core data variables were X_test and X_train reflect the split of test and train respectively.

More information on the original dataset is available in it's own readme file.

This code combines x_test, y_test, subject, activity_label, & features
The x_test are the measures of the variables
The y_test are the activities captured as numbers and are treated as rows to the x test.
The activity label gives a description to the activity number and is added per row.
THe subject information labels which subject undertook which observed variable.

The subject, y_test and activity labels were all added as rows to the data.

The feature dataset corresponds to the column headers and reflect the measures that were captured in x_test.  These were added as column headers.
This completed file is called alltest

The same split exists for the x_train and the same process to complete a file which is called alltrain.

These data sets are then appended to each other using rbind.

The requirement of the final data set was to be restricted to mean and standard deviation values.
grepl was used to identify those with mean and standard deviation seperately.
These files were then combined to create a final file.

The dataset had 84 columns at this point, which included one duplicate.  These were extracted and compared and found to be identical.  Therefore column 39 of the dataset was dropped.

This is the dataset which is labelled as finalpart2.  It's dimensions are 83 columns and 10,299 observations.
Descriptions of the variables can be found in the code book.

Output2 is a summarised version of finalpart2.
This provides means for each variable with summaries by Subject and Activity.
Given that there are 30 subjects and 6 activities, the table has 180 obervations of the 81 columns.

