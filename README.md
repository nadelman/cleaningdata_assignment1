cleaningdata_assignment1
========================

Assignment for getting and cleaning data course

Methodology:

The run_analysis function is the entry point for generating the first data set. It follows this methodolgy:

1. generate a list of column names. The first column name will be "subject" (this column will be sourced from the subject files). The last column will be named "class" (the classification of the observation, sourced from the y data files). In between will be the X data (feature observation data, sourced from the X files). The column names for all of these will be read from the features.txt file. As part of this process, the column names for the features are scrubbed by removing the "()" and converting any "-" to "." instead. A more thorough approach would have been to leverage the information in the feature_info file and create a hard-coded list of labels. The approach used here was more programatic, as a time-saver, but the results are not optimal.

2. Create a data frame for the test data, a second data from for the y data, and combine the two using rbind to obtain a sinlge large data set. A single function, processDirectory, is used to form a data frame from the combination of an X, Y, and subject file within a given directory (either test or train, in this case)

3. The columns to retain are determined as follows: the columsn representing the subject and their activity for the observation (the "subject", "class", and "activity" columns) are retained. For the observation columns, the column is removed from the data set if it does not contiain the text "mean()" (case insensitive) or the text "std". Note that we do remove the meanFreq() variables, and they are not semantically the same as the mean() variables (see feature descriptions for data set).

4. An additional activity column is added to the end of the data frame. This is a tranlsation of the "class" column to a readable acitivty name value. The names for the activity are read from the activity_label.txt file. It is assumed that the position of an acitivity name in that file corresponds to the number (index) of each y value in the testing and traingin sets.


The second data set is generated via the generate_means function, which is called separately. The input to this method should be the data set output by the run_analaysis method.