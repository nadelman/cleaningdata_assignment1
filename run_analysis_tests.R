

##
# Tests reading a directory into a data frame for the 
# Human Activity Recognition Using Smartphones Data Set.
# 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# Tests against a scaled down data set, where the test set contains 15 samples, and the training set
# contains 10 samples. The features and activity files are the same as the real data set
##
test_create_data_set <- function() {
  install.packages("RUnit")
  library(RUnit)
  
  # data set is located at path "./unit_test_data"
  
  # run the analsyis, read in the files, check their data
  run_analysis("./unit_test_data/")
  
  dataset1 <- read.table("./Human_Activity_Recognition_Dataset1.txt")
  dataset2 <- read.table("./Human_Activity_Recognition_Dataset2.txt")
  
  checkTrue(dataset1 != null)
  checkTrue(dataset2 != null)
  
  # validate the correct number of features extracted
  checkEquals(71, length(colnames(dataset1))

  # validate the proper column names were set for the data frame
  checkequals(colnames(dataset1)[1], "subject")
  checkequals(colnames(dataset1)[2], "tBodyAcc-mean()-X")
  checkequals(colnames(dataset1)[3], "tBodyAcc-mean()-Y")
  checkequals(colnames(dataset1)[4], "tBodyAcc-mean()-Z")
  checkequals(colnames(dataset1)[5], "tBodyAcc-std()-X")
  checkequals(colnames(dataset1)[6], "tBodyAcc-std()-Y")
  checkequals(colnames(dataset1)[7], "tBodyAcc-std()-Z")
  checkequals(colnames(dataset1)[8], "tGravityAcc-mean()-X")
  checkequals(colnames(dataset1)[9], "tGravityAcc-mean()-Y")
  checkequals(colnames(dataset1)[10], "tGravityAcc-mean()-Z")
  checkequals(colnames(dataset1)[11], "tGravityAcc-std()-X")
  checkequals(colnames(dataset1)[12], "tGravityAcc-std()-Y")
  checkequals(colnames(dataset1)[13], "tGravityAcc-std()-Z")
  checkequals(colnames(dataset1)[14], "tBodyAccJerk-mean()-X")
  checkequals(colnames(dataset1)[15], "tBodyAccJerk-mean()-Y")
  checkequals(colnames(dataset1)[16], "tBodyAccJerk-mean()-Z")
  checkequals(colnames(dataset1)[17], "tBodyAccJerk-std()-X")
  checkequals(colnames(dataset1)[18], "tBodyAccJerk-std()-Y")
  checkequals(colnames(dataset1)[19], "tBodyAccJerk-std()-Z")
  checkequals(colnames(dataset1)[20], "tBodyGyro-mean()-X")
  checkequals(colnames(dataset1)[21], "tBodyGyro-mean()-Y ")
  checkequals(colnames(dataset1)[22], "tBodyGyro-mean()-Z")
  checkequals(colnames(dataset1)[23], "tBodyGyro-std()-X")
  checkequals(colnames(dataset1)[24], "tBodyGyro-std()-Y")
  checkequals(colnames(dataset1)[25], "tBodyGyro-std()-Z")
  checkequals(colnames(dataset1)[26], "tBodyGyroJerk-mean()-X")
  checkequals(colnames(dataset1)[27], "tBodyGyroJerk-mean()-Y")
  checkequals(colnames(dataset1)[28], "tBodyGyroJerk-mean()-Z")
  checkequals(colnames(dataset1)[29], "tBodyGyroJerk-std()-X")
  checkequals(colnames(dataset1)[30], "tBodyGyroJerk-std()-Y")
  checkequals(colnames(dataset1)[31], "tBodyGyroJerk-std()-Z")
  checkequals(colnames(dataset1)[32], "tBodyAccMag-mean()")
  checkequals(colnames(dataset1)[33], "tBodyAccMag-std()")
  checkequals(colnames(dataset1)[34], "tGravityAccMag-mean()")
  checkequals(colnames(dataset1)[35], "tGravityAccMag-std()")
  checkequals(colnames(dataset1)[36], "tBodyAccJerkMag-mean()")
  checkequals(colnames(dataset1)[37], "tBodyAccJerkMag-std()")
  checkequals(colnames(dataset1)[38], "tBodyGyroMag-mean()")
  checkequals(colnames(dataset1)[39], "tBodyGyroMag-std()")
  checkequals(colnames(dataset1)[40], "tBodyGyroJerkMag-mean()")
  checkequals(colnames(dataset1)[41], "tBodyGyroJerkMag-std()")
  checkequals(colnames(dataset1)[42], "fBodyAcc-mean()-X")
  checkequals(colnames(dataset1)[43], "fBodyAcc-mean()-Y")
  checkequals(colnames(dataset1)[44], "fBodyAcc-mean()-Z")
  checkequals(colnames(dataset1)[45], "fBodyAcc-std()-X")
  checkequals(colnames(dataset1)[46], "fBodyAcc-std()-Y")
  checkequals(colnames(dataset1)[47], "fBodyAcc-std()-Z")
  checkequals(colnames(dataset1)[51], "fBodyAccJerk-mean()-X")
  checkequals(colnames(dataset1)[52], "fBodyAccJerk-mean()-Y")
  checkequals(colnames(dataset1)[53], "fBodyAccJerk-mean()-Z")
  checkequals(colnames(dataset1)[54], "fBodyAccJerk-std()-X")
  checkequals(colnames(dataset1)[55], "fBodyAccJerk-std()-Y")
  checkequals(colnames(dataset1)[56], "fBodyAccJerk-std()-Z")
  checkequals(colnames(dataset1)[57], "fBodyGyro-mean()-X ")
  checkequals(colnames(dataset1)[58], "fBodyGyro-mean()-Y")
  checkequals(colnames(dataset1)[59], "fBodyGyro-mean()-Z")
  checkequals(colnames(dataset1)[60], "fBodyGyro-std()-X")
  checkequals(colnames(dataset1)[61], "fBodyGyro-std()-Y")
  checkequals(colnames(dataset1)[62], "fBodyGyro-std()-Z")
  checkequals(colnames(dataset1)[63], "fBodyAccMag-mean()")
  checkequals(colnames(dataset1)[64], "fBodyAccMag-std()")
  checkequals(colnames(dataset1)[65], "fBodyBodyAccJerkMag-mean()")
  checkequals(colnames(dataset1)[66], "fBodyBodyAccJerkMag-std()")
  checkequals(colnames(dataset1)[67], "fBodyBodyGyroMag-mean()")
  checkequals(colnames(dataset1)[68], "fBodyBodyGyroMag-std()")
  checkequals(colnames(dataset1)[69], "fBodyBodyGyroJerkMag-mean()")
  checkequals(colnames(dataset1)[70], "fBodyBodyGyroJerkMag-std()")
  checkequals(colnames(dataset1)[71], "class")      
              
  # validate the proper number of rows were generated
  checkequals(25, length(dataset1[,1]))

  # validate we read in teh correct first few values for the first line from the test data set. 
  # just a spot check, assume that if we read some of a line in correctly, we read it all in correctly.
  checkequals(2, dataset1[1,]$subject)
  checkequals(0.2571778, dataset1[1,]$tBodyAcc-mean()-X)
  checkequals(-0.02328523, dataset1[1,]$tBodyAcc-mean()-Y)
  checkequals(-0.01465376, dataset1[1,]$tBodyAcc-mean()-Z)
  checkequals(-0.938404  , dataset1[1,]$tBodyAcc-std()-X)
  checkequals(5, dataset1[1,]$class)
              
  # validate we read in teh correct first few values for the first line from the training data set. 
  # just a spot check, assume that if we read some of a line in correctly, we read it all in correctly.
  checkequals(7, dataset1[16,]$subject)
  checkequals(0.2885845, dataset1[16,]$tBodyAcc-mean()-X)
  checkequals(-0.02029417, dataset1[16,]$tBodyAcc-mean()-Y)
  checkequals(6, dataset1[16,]$class)
              
}