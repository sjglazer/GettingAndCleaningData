library(reshape2)


# A simple function to read file contents into memory
ReadData <- function(file) {
  return(read.table(file))
}


# load all of the data sets into memory
test.subject <- ReadData("subject_test.txt")
test.x      <- ReadData("X_test.txt")
test.y  <- ReadData("y_test.txt")

train.subject <- ReadData("subject_train.txt")
train.x <- ReadData("X_train.txt")
train.y <- ReadData("y_train.txt")

features <- ReadData("features.txt")
activity.labels <- ReadData("activity_labels.txt")

# function to merge the subjects data
MergeSubjects <-function(){
  subjectTemp <- rbind(test.subject, train.subject)
  colnames(subjectTemp) <- "subject"
  return(subjectTemp)
}

# function to merge the label data
MergeLabels <-function(){
  labelTemp <- rbind(test.y, train.y)
  labelTemp <- merge(labelTemp, activity.labels, by=1)[,2]
  return (labelTemp)
}

subjects <- MergeSubjects()
labels <- MergeLabels()

# join the two main data files
data <- rbind(test.x, train.x)

# attach the features to the column names in data
colnames(data) <- features[, 2]

# Merge the subject, labels, and data data frames together
data <- cbind(subjects, labels, data)
              

# keep only the mean and standard deviation variables
meanAndStd <- grep("-mean|-std", colnames(data))
data.lean <- data[,c(1,2,meanAndStd)]

# Calculate the averages, grouped by subject and label
melted = melt(data.lean, id.var = c("subject", "labels"))
means = dcast(melted , subject + label ~ variable, mean)

# Save the final tiny data
write.table(means, file="tidy_data.txt")



