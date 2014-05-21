##
# This script performs the following functions:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
#
#
##
run_analysis <- function(directory) {
  
  colNames <- generateSubjectLabels(directory)
  testSet <- processDirectory(paste(directory,"/test", sep=""), "test")
  trainSet <- processDirectory(paste(directory,"/train", sep=""), "train")
  
  totalDF <- rbind(testSet, trainSet)
  colNames(totalDF) <- colNames
  
  keepCols <- resolveColsToKeep(colNames)
  df <- df[keepCols]
  
  totalDF
}




##
# reads all of the files in a specific folder, and merges them into the specified data frame
#
# For this data set, the test files will all end with "_test.txt" and the training files
# will all end with "_train.txt". Each folder subtains the following files:
#
# subject_<set id>.txt
# X_<set id>.txt
# Y_<set id>.txt
#
# Each folder contains a subfolder named "Inertial Signal" Contain x, y, and x coordinate information
# for body accellercation, body gyroscopy, and total acceleration (9 file total)
## 
processDirectory <- function(directory, postfix) {
    subjectFile <- paste(directory, '/subject_', postfix, ".txt", sep = "")
    xFile <- paste(directory, '/X_', postfix, ".txt", sep = "")
    yFile <- paste(directory, '/Y_', postfix, ".txt", sep = "")
    
    subject <- read.table(subjectFile, header=FALSE)
    x <- read.table(xFile, header=FALSE)
    y <- read.table(yFile, header=FALSE)
    
    df <- data.frame(subject, x, y)    
}

##
# Determine the indices of all of the columns from the data frame that we would like to keep. This
# includes the columns corresponding to the X and Y files, and any features representing mean (looking for
# the text "mean" or "Mean" in the column header), or representing standard deviation (looking for the text "std"
# in the column header). 
#
# Returns the indexs for all of the columns matching these criteria. Sorts the list of indices in ascending order.
##
resolveColsToKeep <- fuction(colNames) {
  
  meanCols <-  grep("mean", colNames)
  stdCols <-  grep("std", colNames)
  xCols <- grep("subject", colNames)
  yCols <- grep("class", colNames)
  
  sort.int(c(meanCols, stdCols, xCols, yCols))
}

##
# Create a list of all of the feature names for the data frame, based in most part of the features.txt file
##
generateSubjectLabels <- function(directory) {
    featureFile <- paste(directory, "//", "features.txt", sep = "")
    features <- read.table(featureFile)
    featureList <- as.list(features[2])
    
    allFeatures <- c("subject")
    
    for(item in featureList) {
        allFeatures <- add.unique(allFeatures, as.character(item))
    }
    
    allFeatures <- add.unique(allFeatures, "class")
}

##
# Utility to combine items as a list, ensuring uniqueness of the elements
##
add.unique<-function(ls1,ls2) {
  ifelse (ls2 %in% ls1, return(ls1) , return(c(ls1,ls2)) )
}

