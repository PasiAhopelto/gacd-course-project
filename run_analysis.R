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

testData <- cbind(testSubjects, testActivityLabels, testData)
trainData <- cbind(trainSubjects, trainActivityLabels, trainData)

names(testData)[1] <- "Test Subject"
names(trainData)[1] <- "Test Subject"

names(testData)[2] <- "Activity"
names(trainData)[2] <- "Activity"

combinedData <- rbind(testData, trainData)
row.names(combinedData) <- NULL 

colnames(combinedData) <- lapply(colnames(combinedData), function(x) {
  x <- sub('(.+)-(.+)-(.+)', '\\2 \\1 on phone \\3 axis', x)
  x <- sub('^(.+)-(.+)$', '\\2 \\1', x)
  x <- sub('mean()', 'Mean ', x, fixed = TRUE)
  x <- sub('std()', 'Standard deviation of ', x, fixed = TRUE)
  x <- sub(' t', 'time domain ', x)
  x <- sub(' f', 'frequency domain ', x)
  x <- gsub('Body', 'body ', x)
  x <- gsub('Gravity', 'gravity ', x)
  x <- sub('Acc', 'acceleration', x)
  x <- sub('Gyro', 'gyroscope', x)
  x <- sub('Jerk', ' jerk', x)
  x <- sub('Mag', ' magnitude', x)
  x <- gsub('body body ', 'body ', x)
  x
})

tidyData <- aggregate(combinedData[-2], by=combinedData[c('Test Subject', 'Activity')], FUN=mean)
tidyData <- subset(tidyData, select = -c(3))

write.table(tidyData, file = "tidydata.txt", row.names = FALSE)

# TODO refactor