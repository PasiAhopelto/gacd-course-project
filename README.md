gacd-course-project
===================

This is a Getting and Cleaning Data course project which creates a tidy data set from test subjects' acceleration and angular velocity measurements.

## Creating tidy data set

1. Clone gacd-course-project git repository:
	```
	git clone https://github.com/PasiAhopelto/gacd-course-project
	```

2. Download data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it into the cloned git repository:
	```
	cd gacd-course-project
	wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip -O data.zip
	unzip data.zip
	```

3. Create tidy data with:
	```
	R --no-save < run_analysis.R
	```

The script writes the tidy data into tidydata.txt. Please see CodeBook.md for description.

## What the script does?

The script
* reads test and train data sets (*set* is either 'test' or 'train'):
  * subjects come from UCI HAR Dataset/*set*/subject_*set*.txt
  * activities (integers) come from UCI HAR Data/*set*/y_*set*.txt
  * variables are read from UCI HAR Data/*set*/X_*set*.txt
  * selects variables which have 'mean()' or 'std()' in their name and drops others.
* labels data sets:
  * activity labels are read from UCI HAR Data/activity_labels.txt, these replace values read from UCI HAR Data/*set*/y_*set*.txt
  * measurements are 'expanded' to be more understandable, for example 't' in beginning of measurement is translated to 'time domain'.
* merges two data sets ('test' and 'train') to form one data set
* aggregates the combined data set by test subject and activity with average function to tidy data set
* writes the tidy data set to file 'tidydata.txt'.
