readDataSet <- function(dataset, activityLabels, featureTitles, selectedColumns) {
  subjects <- read.delim(file = paste("UCI HAR Dataset/", dataset, "/subject_", dataset, ".txt", sep = ''), header = FALSE)
  activities <- read.delim(file = paste("UCI HAR Dataset/", dataset, "/y_", dataset, ".txt", sep = ''), header = FALSE)
  activities <- apply(activities, 1, function(x) { activityLabels[x, 2] })
  data <- read.delim(file = paste("UCI HAR Dataset/", dataset, "/X_", dataset, ".txt", sep = ''), sep='', header = FALSE)
  colnames(data) <- featureTitles[, 2]
  data <- data[, selectedColumns]
  data <- cbind(subjects, activities, data)
  names(data)[1] <- "Test Subject"
  names(data)[2] <- "Activity"
  data
}

featureTitles <- read.delim(file = "UCI HAR Dataset/features.txt", sep = ' ', header = FALSE)
activityLabels <- read.delim(file = "UCI HAR Dataset/activity_labels.txt", sep = ' ', header = FALSE)

filteredColumns <- sapply(featureTitles, function(x) grep("mean\\(\\)|std\\(\\)", x))
selectedColumns <- c(unlist(filteredColumns[2])) 

testData <- readDataSet('test', activityLabels, featureTitles, selectedColumns)
trainData <- readDataSet('train', activityLabels, featureTitles, selectedColumns)

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