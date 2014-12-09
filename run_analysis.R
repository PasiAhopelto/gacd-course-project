featureTitles <- read.delim(file = "UCI HAR Dataset/features.txt", sep = ' ', header = FALSE)
activityLabels <- read.delim(file = "UCI HAR Dataset/activity_labels.txt", sep = ' ', header = FALSE)

testSubjects <- read.delim(file = "UCI HAR Dataset/test/subject_test.txt", header = FALSE)
trainSubjects <- read.delim(file = "UCI HAR Dataset/train/subject_train.txt", header = FALSE)

testActivityLabels <- read.delim(file = "UCI HAR Dataset/test/y_test.txt", header = FALSE)
trainActivityLabels <- read.delim(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE)
 
testData <- read.delim(file = "UCI HAR Dataset/test/X_test.txt", sep='', header = FALSE)
trainData <- read.delim(file = "UCI HAR Dataset/train/X_train.txt", sep='', header = FALSE, )

# TODO convert featureTitles to human readable names

# TODO set data headers

# TODO substitute activity labels' numbers with text labels

# TODO add test subjects to datas

# TODO add activity labels to datas

# TODO merge test and train datas