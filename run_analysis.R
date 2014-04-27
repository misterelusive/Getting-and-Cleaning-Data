#
# Filename : run_analysis.R
#

# Load the required packages
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# Set the working directory
setwd("H:/Coursera/John Hopkins/Getting and Cleaning Data/Assignment")

# Set path
path <- getwd()

# The files are in a folder named 'UCI HAR Dataset'
filesPath <- "H:/Coursera/John Hopkins/Getting and Cleaning Data/Assignment/UCI HAR Dataset"
list.files(filesPath, recursive=TRUE)

# Reading the subject files
dataSubjectTrain <- fread(file.path(filesPath, "train", "subject_train.txt"))
dataSubjectTest  <- fread(file.path(filesPath, "test" , "subject_test.txt" ))

# Reading the activity files
dataActivityTrain <- fread(file.path(filesPath, "train", "Y_train.txt"))
dataActivityTest  <- fread(file.path(filesPath, "test" , "Y_test.txt" ))

# Reading the data files.
# NOTE - fread() can no longer read files that are missing values in first row
# It has been raised here by gsee - https://r-forge.r-project.org/tracker/index.php?func=detail&aid=5413&group_id=240&atid=975
#
# So, using an alternative way to load data
fileToDataTable <- function (fileName) {
	dataFile <- read.table(fileName)
	dataTable <- data.table(dataFile)
}
dataTrain <- fileToDataTable(file.path(filesPath, "train", "X_train.txt"))
dataTest  <- fileToDataTable(file.path(filesPath, "test" , "X_test.txt" ))

# Merge the training and the test sets by concatenating the data tables
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
setnames(dataSubject, "V1", "subject")

dataActivity <- rbind(dataActivityTrain, dataActivityTest)
setnames(dataActivity, "V1", "activityNum")

dataTable <- rbind(dataTrain, dataTest)

# Merge columns
dataSubject <- cbind(dataSubject, dataActivity)
dataTable <- cbind(dataSubject, dataTable)

# Set key
setkey(dataTable, subject, activityNum)

# Reading "features.txt" and extracting only the mean and standard deviation
dataFeatures <- fread(file.path(filesPath, "features.txt"))
setnames(dataFeatures, names(dataFeatures), c("featureNum", "featureName"))

# Taking only measurements for the mean and standard deviation
dataFeatures <- dataFeatures[grepl("mean\\(\\)|std\\(\\)", featureName)]

# Convert the column numbers to a vector of variable names matching columns in dataTable
dataFeatures$featureCode <- dataFeatures[, paste0("V", featureNum)]
head(dataFeatures)
dataFeatures$featureCode

# Subset these variables using variable names
select <- c(key(dataTable), dataFeatures$featureCode)
dataTable <- dataTable[, select, with=FALSE]

# Reading "activity_labels.txt" file. This will be used to add descriptive names to the activities
dataActivityNames <- fread(file.path(filesPath, "activity_labels.txt"))
setnames(dataActivityNames, names(dataActivityNames), c("activityNum", "activityName"))

# Merge activity labels
dataTable <- merge(dataTable, dataActivityNames, by="activityNum", all.x=TRUE)

# Adding "activityName" as a key
setkey(dataTable, subject, activityNum, activityName)

# Melt the data table to reshape it from a short and wide format to a tall and narrow format
dataTable <- data.table(melt(dataTable, key(dataTable), variable.name="featureCode"))

# Merge activity name
dataTable <- merge(dataTable, dataFeatures[, list(featureNum, featureCode, featureName)], by="featureCode", all.x=TRUE)

# Creating new variables "activity" and "feature"
dataTable$activity <- factor(dataTable$activityName)
dataTable$feature <- factor(dataTable$featureName)

# Seperate features from "featureName" using function "grepthis"
grepthis <- function (regex) {
  grepl(regex, dataTable$feature)
}

# Features with 2 categories
categoryCount <- 2
y <- matrix(seq(1, categoryCount), nrow=categoryCount)
x <- matrix(c(grepthis("^t"), grepthis("^f")), ncol=nrow(y))
dataTable$featureDomain <- factor(x %*% y, labels=c("Time", "Freq"))

x <- matrix(c(grepthis("Acc"), grepthis("Gyro")), ncol=nrow(y))
dataTable$featureInstrument <- factor(x %*% y, labels=c("Accelerometer", "Gyroscope"))

x <- matrix(c(grepthis("BodyAcc"), grepthis("GravityAcc")), ncol=nrow(y))
dataTable$featureAcceleration <- factor(x %*% y, labels=c(NA, "Body", "Gravity"))

x <- matrix(c(grepthis("mean()"), grepthis("std()")), ncol=nrow(y))
dataTable$featureMeanOrSD <- factor(x %*% y, labels=c("Mean", "SD"))

# Features with 1 category
dataTable$featureJerk <- factor(grepthis("Jerk"), labels=c(NA, "Jerk"))
dataTable$featureMagnitude <- factor(grepthis("Mag"), labels=c(NA, "Magnitude"))

# Features with 3 categories
categoryCount <- 3
y <- matrix(seq(1, categoryCount), nrow=categoryCount)
x <- matrix(c(grepthis("-X"), grepthis("-Y"), grepthis("-Z")), ncol=nrow(y))
dataTable$featureAxis <- factor(x %*% y, labels=c(NA, "X", "Y", "Z"))

# Check to make sure all possible combinations of "feature" are taken care of
row1 <- nrow(dataTable[, .N, by=c("feature")])
row2 <- nrow(dataTable[, .N, by=c("featureDomain", "featureAcceleration", "featureInstrument", "featureJerk", "featureMagnitude", "featureMeanOrSD", "featureAxis")])
row1 == row2

# Creating a tidy data set and saving it in "output.csv"
setkey(dataTable, subject, activity, featureDomain, featureAcceleration, featureInstrument, featureJerk, featureMagnitude, featureMeanOrSD, featureAxis)
dataTidy <- dataTable[, list(count = .N, average = mean(value)), by=key(dataTable)]

write.csv(dataTidy, "output.csv")