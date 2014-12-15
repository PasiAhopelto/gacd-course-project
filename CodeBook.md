Codebook
========

## Overview

The data is a tidy set composed from human activity measurements (or variables) done with accelerometer and gyroscope of a smart phone mounted on persons (test subjects). For details please see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The tidy data set
* contains mean and standard deviation variables of the original data set
* uses textual labels for activities instead of numeric factors of original data set
* labels variables with descriptive names
* has merged test and train data sets
* shows averages of each variable by test subject and activity.

The data consists of 68 variables, of which two form a key and others are measurements.

##Key

**Test Subject** identifies a test subject. This is an integer between 1 and 30.

**Activity** identifies activity, possible values are **WALKING**, **WALKING_UPSTAIRS**, **WALKING_DOWNSTAIRS**, **SITTING**, **STANDING**, **LAYING**.

Combination of the two is unique within data set.

##Measurements

Measurements are averages of original measurements by test subject and activity. Measurements are named "*type* *domain* *measurement* *axis*", where
* *type* is either **Mean** or **Standard deviation**, this refers to original measurement
* *domain* is either **time domain** or **frequency domain** **TODO explain**
* *measurement* describes how test subject moves during activity, more specifically:
** acceleration tells test subject's acceleration during an activity in units of standard gravity (g) relative to given axis
** angular velocity tells speed at which test subject rotates around given axis in radians/second
** additional information (eg jerk) tells more about movement's type.
* *axis* is either **X**, **Y** or **Z axis**, or empty in case of no axis. Note that phone is firmly attached to test subjects chest, so phone axis is same as test subjects axis.

The type, domain, axis and jerk magnitude as as described in the original dataset while measurement names are based on the original data sets' description.
