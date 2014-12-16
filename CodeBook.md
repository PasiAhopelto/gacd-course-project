Codebook
========

## Overview

The data is a tidy set composed from human activity measurements (variables) done with accelerometer and gyroscope of a smart phone mounted on persons (test subjects). For further details on test arrangement and original source data, please see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

This tidy data set
* selects mean and standard deviation variables of the original data set
* uses textual labels for activities instead of numeric factors of original data set
* labels variables with descriptive names
* merges test and train data sets
* aggregates data to averages of each variable by test subject and activity.

The data consists of 68 variables, of which two form a key and others are measurements.

##Key

**Test Subject** identifies a test subject. This is an integer between 1 and 30.

**Activity** identifies activity, possible values are **WALKING**, **WALKING_UPSTAIRS**, **WALKING_DOWNSTAIRS**, **SITTING**, **STANDING** and **LAYING**.

Combination of the two is unique within data set.

##Measurements

Measurements are averages of original data set's measurements by test subject and activity. Measurements are named "*type* *domain* *measurement* *axis*", where
* *type* is either **Mean** or **Standard deviation**, this refers to processing applied already in the original data set's measurement
* *domain* is either **time domain** or **frequency domain**. Time domain signals were captured at constant rate of 50 Hz. Fast fourier transformation was applied to some of the signals, which produced the frequency domain signals.
* *measurement* describes how test subject moves during activity, more specifically:
  * **acceleration** (without "body") is acceleration signal from smartphone in units of standard gravity (g)
  * **body acceleration** is calculated by subtracting gravity from **acceleration** in units of g
  * **body angular velocity** tells speed at which test subject rotates around given axis in radians/second
  * additional information (**jerk**) describes movement's type
  * **magnitude** is calculated from measurements with Euclidiean norm in the original data set and it doesn't have axis
* *axis* is either **X axis**, **Y axis** or **Z axis**, or empty in case of magnitude. The smart phone is firmly attached to test subjects chest, so phone's axis is same as test subject's axis.
