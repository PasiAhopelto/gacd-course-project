Codebook
========

The data is a tidy set composed from human activity measurement performed with accelerometer and gyroscope of a smart phone mounted on persons (test subjects). For details please see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The data consists of 68 variables, of which two are keys and others are measurements.

##Keys

**Test Subject** identifies a test subject. This is an integer between 1 and 30.

**Activity** identifies activity, possible values are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

##Measurements

Measurements are averages of original measurements by test subject and activity. Measurements are named "<type> <domain> <measurement> <axis|jerk magnitude>", where
* <type> is either **Mean** or **Standard deviation**, this refers to original measurement
* <domain> is either **time domain** or **gravity domain**
* <measurement> describes what is being measured
* <axis|jerk magnitude> is either X, Y or Z axis, or jerk magnitude.
The type, domain, axis and jerk magnitude as as described in the original dataset while measurement tries to be self explanatory.
