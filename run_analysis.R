featureTitles <- read.delim(file = "UCI HAR Dataset/features.txt", sep = ' ', header = FALSE)
activityLabels <- read.delim(file = "UCI HAR Dataset/activity_labels.txt", sep = ' ', header = FALSE)

testSubjects <- read.delim(file = "UCI HAR Dataset/test/subject_test.txt", header = FALSE)
trainSubjects <- read.delim(file = "UCI HAR Dataset/train/subject_train.txt", header = FALSE)

testActivityLabels <- read.delim(file = "UCI HAR Dataset/test/y_test.txt", header = FALSE)
trainActivityLabels <- read.delim(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE)

testActivityLabels <- apply(testActivityLabels, 1, function(x) { activityLabels[x, 2] })
trainActivityLabels <- apply(trainActivityLabels, 1, function(x) { activityLabels[x, 2] })

testData <- read.delim(file = "UCI HAR Dataset/test/X_test.txt", sep='', header = FALSE)
trainData <- read.delim(file = "UCI HAR Dataset/train/X_train.txt", sep='', header = FALSE, )

colnames(testData) <- featureTitles[, 2]
colnames(trainData) <- featureTitles[, 2]

filteredColumns <- sapply(featureTitles, function(x) grep("mean\\(\\)|std\\(\\)", x))
selectedColumns <- c(unlist(filteredColumns[2])) 
testData <- testData[, selectedColumns]
trainData <- trainData[, selectedColumns]

# TODO convert column names to human readable names

# TODO add test subjects to datas

# TODO add activity labels to datas

# TODO merge test and train datas

#C TODO clear workspace and test