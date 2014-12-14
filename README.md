gacd-course-project
===================

This is a Getting and cleaning data course project which creates a tidy data set from provided accelerometer data set.

Steps to create the tidy data set:

1. Clone gacd-course-project git repository:
	```
	git clone https://github.com/PasiAhopelto/gacd-course-project
	```

2. Download data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it into the cloned git repository:
	```
	cd gacd-course-project
	wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	unzip "getdata_projectfiles_UCI HAR Dataset.zip"
	```

3. Create tidy data with:
	```
	R --no-save < run_analysis.R
	```

The script writes the tidy data into tidydata.txt. Please see CodeBook.md for its description.
