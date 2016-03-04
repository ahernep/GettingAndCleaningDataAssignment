run_analysis <- function() {

# Read all data sets
x_trainData <- read.table("./train/X_train.txt")
y_trainData <- read.table("./train/y_train.txt")
subject_trainData <- read.table("./train/subject_train.txt")
x_testData <- read.table("./test/X_test.txt")
y_testData <- read.table("./test/y_test.txt")
subject_testData <- read.table("./test/subject_test.txt")

# Merges the training and the test sets to create one data set.
x_joined <- rbind(x_trainData, x_testData)
y_joined <- rbind(y_trainData, y_testData)
subject_joined <- rbind(subject_trainData, subject_testData)

# load features and activity info
features <- read.table("./features.txt")
names(features) <- c("featureID", "featureName")
activities <- read.table("./activity_labels.txt")
names(activities) <- c("activityID", "activityName")
activities$activityName <- gsub("_", "", as.character(activities$activityName))
featuresMeanStd <- grep("-mean\\(\\)|-std\\(\\)", features$featureName) #Index for all standard and mean features

# Extract data for Mean & Standard features from data set
x_joined<- x_joined[, featuresMeanStd]
names(x_joined) <- gsub("\\(|\\)", "", features$featureName[featuresMeanStd])
names(y_joined) = "activityID"
activity <- merge(y_joined, activities, by="activityID")$activityName

# Merge data
names(subject_joined) = "subjectID"
data <- cbind(subject_joined, x_joined, activity)
write.table(data, "tidy_data.txt", row.names = FALSE)

#Calculate results

library(data.table)
dataDT <- data.table(data)
results <- dataDT[, lapply(.SD, mean), by=c("subjectID", "activity")]
write.table(results, "results.txt", row.names = FALSE)

}