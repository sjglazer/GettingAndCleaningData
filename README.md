	The purpose of this assignment is take unstructured raw data taken from here: 
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


	And to transform the data into a tidy data set. More specifically:


    "You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."


	What the script "run_analysis.R" does:

	1) I merged the Subject and Label data. 
	2) I merged the two main data files. 
	3) I attached the actual feature names to the combined data files. 
	4) I merged the Subject, Labels, and Data file together. 
	5) I purged out all of the variables that were not a mean or standard deviation. 
	6) I calculated the averages, grouped by subject and label. 
	7) I wrote the result to the file "tiny_data.txt"
	
	*** Note: The script assumes that all data files are in the current working directory along with the script. The output data set is also placed in the same directory.
