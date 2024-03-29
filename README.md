# Getting and cleaning data course project

## Author: S.J

### escription
Practice project for course [Getting and Cleaning Data](https://www.coursera.org/course/getdata).
Free dataset comes from ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


__Data set needs to be downloaded if the working repo does not contain it:__

1. Download the zip file from [URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.

__Package reshape2 is needed to run the script__
1. install.packages(""reshape2")

__Run the R script ([run_analysis.R](run_analysis.R)).__
The analysis script will take all the train and test data set and corresponding label to combine to be one big data table. It greps all mean and std related features and represent the label with activity description/dactor fashion.

__The output of the R script is a tidy data set, [tidyData.txt](tidyData.txt).__

__Attached [code book](CodeBook.md) for variable description.__