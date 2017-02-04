library("reshape2")

# Download and create a directory for the dataset. Please note that the dataset is enclosed in a Zip archive file
# and must therefore be stored in a temporary file before it can be unzipped to the directory that the user is 
# working in.
datasetUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
zipFile <- download.file(datasetUrl, temp, method = "curl", mode = "wb")
unzip(temp)

# Read the test dataset into dataframes. Assign the test dataset, columns indicated the the type of action completed
# and the test subject who completed them.
subjectDataTest <- read.table("./UCI HAR DATASET/test/subject_test.txt")
actionDataTest <- read.table("./UCI HAR DATASET/test/y_test.txt")
dataTest <- read.table("./UCI HAR DATASET/test/x_test.txt")
testDf <- cbind(subjectDataTest, actionDataTest, dataTest)

# Read the train dataset into dataframes. Assign the train dataset, columns indicated the type of action completed 
# and the test subject who completed them.
subjectDataTrain <- read.table("./UCI HAR DATASET/train/subject_train.txt")
actionDataTrain <- read.table("./UCI HAR DATASET/train/y_train.txt")
dataTrain <- read.table("./UCI HAR DATASET/train/x_train.txt")
trainDf <- cbind(subjectDataTrain, actionDataTrain, dataTrain)

# Merge the test and train datasets into a single dataset.
mergedDf <- rbind(trainDf, testDf)

# Free up memory by discarding objects no longer being used.
rm(list = c("subjectDataTest", "actionDataTest", "dataTest", "testDf", "subjectDataTrain", "actionDataTrain", "dataTrain", "trainDf"))

# Assign the combined dataset columns names that will allow the user to reshape and understand merged dataset.
dataColNames <- read.table("./UCI HAR DATASET/features.txt")
subjectAndActionColnames <- c("subjectID", "actionID")
dataColNames1 <- as.vector(as.character(dataColNames$V2))
colNames <- c(subjectAndActionColnames, dataColNames1)
colnames(mergedDf) <- colNames

# Rename the actionID column to actionName and replace the actionID values with action names.
actionNameDf <- read.table("./UCI HAR DATASET/activity_labels.txt")
mergedDf$actionID <- factor(mergedDf$actionID, levels = actionNameDf[,1], labels = actionNameDf[,2])
colnames(mergedDf)[2] <- "actionName"

# Select the columns in the combined dataset that relate to mean and standard deviation variable calculations
columnSelectVector <- c("subjectID", "actionID","mean", "std")
searchList <- grep(paste(columnSelectVector, collapse = "|"), colNames)
mergedDf <- mergedDf[,searchList]

# Reformat the variables so that they are easier to read and understand
colnames(mergedDf) <- gsub("[()]", "", colnames(mergedDf))
colnames(mergedDf) <- gsub("mean", "Mean", colnames(mergedDf))
colnames(mergedDf) <- gsub("std", "Std", colnames(mergedDf))

# Melt the data frame by turning subjects and activities into id's and the variable into measurements.
meltedDf <- melt(mergedDf, id.vars=c(1,2), measure.vars = 3:length(mergedDf))

# Recast the melted dataset to show the mean of the measure by subject and activity.
tidyDf <-  dcast(meltedDf, subjectID + actionName ~ variable, mean)

# Write the table out to a tidy dataset.
write.table(tidyDf, file = "tidyData.txt", quote = FALSE, row.names = FALSE)




















a


