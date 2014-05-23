

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
  # data set is located at path "./unit_test_data"
  
  output <- run_analysis("./unit_test_data/")
  
  # validate the correct number of features extracted
  checkEquals(71, length(colnames(output))

  # validate the proper column names were set for the data frame
  checkequals(colnames(output)[1], "subject")
  checkequals(colnames(output)[2], "tBodyAcc-mean()-X")
  checkequals(colnames(output)[3], "tBodyAcc-mean()-Y")
  checkequals(colnames(output)[4], "tBodyAcc-mean()-Z")
  checkequals(colnames(output)[5], "tBodyAcc-std()-X")
  checkequals(colnames(output)[6], "tBodyAcc-std()-Y")
  checkequals(colnames(output)[7], "tBodyAcc-std()-Z")
  checkequals(colnames(output)[8], "tGravityAcc-mean()-X")
  checkequals(colnames(output)[9], "tGravityAcc-mean()-Y")
  checkequals(colnames(output)[10], "tGravityAcc-mean()-Z")
  checkequals(colnames(output)[11], "tGravityAcc-std()-X")
  checkequals(colnames(output)[12], "tGravityAcc-std()-Y")
  checkequals(colnames(output)[13], "tGravityAcc-std()-Z")
  checkequals(colnames(output)[14], "tBodyAccJerk-mean()-X")
  checkequals(colnames(output)[15], "tBodyAccJerk-mean()-Y")
  checkequals(colnames(output)[16], "tBodyAccJerk-mean()-Z")
  checkequals(colnames(output)[17], "tBodyAccJerk-std()-X")
  checkequals(colnames(output)[18], "tBodyAccJerk-std()-Y")
  checkequals(colnames(output)[19], "tBodyAccJerk-std()-Z")
  checkequals(colnames(output)[20], "tBodyGyro-mean()-X")
  checkequals(colnames(output)[21], "tBodyGyro-mean()-Y ")
  checkequals(colnames(output)[22], "tBodyGyro-mean()-Z")
  checkequals(colnames(output)[23], "tBodyGyro-std()-X")
  checkequals(colnames(output)[24], "tBodyGyro-std()-Y")
  checkequals(colnames(output)[25], "tBodyGyro-std()-Z")
  checkequals(colnames(output)[26], "tBodyGyroJerk-mean()-X")
  checkequals(colnames(output)[27], "tBodyGyroJerk-mean()-Y")
  checkequals(colnames(output)[28], "tBodyGyroJerk-mean()-Z")
  checkequals(colnames(output)[29], "tBodyGyroJerk-std()-X")
  checkequals(colnames(output)[30], "tBodyGyroJerk-std()-Y")
  checkequals(colnames(output)[31], "tBodyGyroJerk-std()-Z")
  checkequals(colnames(output)[32], "tBodyAccMag-mean()")
  checkequals(colnames(output)[33], "tBodyAccMag-std()")
  checkequals(colnames(output)[34], "tGravityAccMag-mean()")
  checkequals(colnames(output)[35], "tGravityAccMag-std()")
  checkequals(colnames(output)[36], "tBodyAccJerkMag-mean()")
  checkequals(colnames(output)[37], "tBodyAccJerkMag-std()")
  checkequals(colnames(output)[38], "tBodyGyroMag-mean()")
  checkequals(colnames(output)[39], "tBodyGyroMag-std()")
  checkequals(colnames(output)[40], "tBodyGyroJerkMag-mean()")
  checkequals(colnames(output)[41], "tBodyGyroJerkMag-std()")
  checkequals(colnames(output)[42], "fBodyAcc-mean()-X")
  checkequals(colnames(output)[43], "fBodyAcc-mean()-Y")
  checkequals(colnames(output)[44], "fBodyAcc-mean()-Z")
  checkequals(colnames(output)[45], "fBodyAcc-std()-X")
  checkequals(colnames(output)[46], "fBodyAcc-std()-Y")
  checkequals(colnames(output)[47], "fBodyAcc-std()-Z")
  checkequals(colnames(output)[51], "fBodyAccJerk-mean()-X")
  checkequals(colnames(output)[52], "fBodyAccJerk-mean()-Y")
  checkequals(colnames(output)[53], "fBodyAccJerk-mean()-Z")
  checkequals(colnames(output)[54], "fBodyAccJerk-std()-X")
  checkequals(colnames(output)[55], "fBodyAccJerk-std()-Y")
  checkequals(colnames(output)[56], "fBodyAccJerk-std()-Z")
  checkequals(colnames(output)[57], "fBodyGyro-mean()-X ")
  checkequals(colnames(output)[58], "fBodyGyro-mean()-Y")
  checkequals(colnames(output)[59], "fBodyGyro-mean()-Z")
  checkequals(colnames(output)[60], "fBodyGyro-std()-X")
  checkequals(colnames(output)[61], "fBodyGyro-std()-Y")
  checkequals(colnames(output)[62], "fBodyGyro-std()-Z")
  checkequals(colnames(output)[63], "fBodyAccMag-mean()")
  checkequals(colnames(output)[64], "fBodyAccMag-std()")
  checkequals(colnames(output)[65], "fBodyBodyAccJerkMag-mean()")
  checkequals(colnames(output)[66], "fBodyBodyAccJerkMag-std()")
  checkequals(colnames(output)[67], "fBodyBodyGyroMag-mean()")
  checkequals(colnames(output)[68], "fBodyBodyGyroMag-std()")
  checkequals(colnames(output)[69], "fBodyBodyGyroJerkMag-mean()")
  checkequals(colnames(output)[70], "fBodyBodyGyroJerkMag-std()")
  checkequals(colnames(output)[71], "class")      
              
  # validate the proper number of rows were generated
  checkequals(25, length(output[,1]))

  # validate we read in teh correct first few values for the first line from the test data set. 
  # just a spot check, assume that if we read some of a line in correctly, we read it all in correctly.
  checkequals(2, output[1,]$subject)
  checkequals(0.2571778, output[1,]$tBodyAcc-mean()-X)
  checkequals(-0.02328523, output[1,]$tBodyAcc-mean()-Y)
  checkequals(-0.01465376, output[1,]$tBodyAcc-mean()-Z)
  checkequals(-0.938404  , output[1,]$tBodyAcc-std()-X)
  checkequals(5, output[1,]$class)
              
  # validate we read in teh correct first few values for the first line from the training data set. 
  # just a spot check, assume that if we read some of a line in correctly, we read it all in correctly.
  checkequals(7, output[16,]$subject)
  checkequals(0.2885845, output[16,]$tBodyAcc-mean()-X)
  checkequals(-0.02029417, output[16,]$tBodyAcc-mean()-Y)
  checkequals(6, output[16,]$class)
              
}