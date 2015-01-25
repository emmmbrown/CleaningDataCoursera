# Getting and Cleaning Data Final Project
This is the repo for the final project in the Getting and Cleaning Data Coursera class.

The script run_analysis.R contains a function called run_analysis which will take the data found <a href="http://archive.ics.uci.edu/ml/machine-learning-databases/00240/">here</a>, format it, distill it down to fewer variables, and output a data table of average values per research subject for each activity and variable in the file UCI HAR Dataset Analysis Output.txt. 

## In detail:

<ul>First, it loads both the test and training sets, and combines them into one dataset.</ul>
<ul>It renames the variables used in the features file to make them R compatible and easier to follow. Specifically, it finds and replaces every instance of '-mean()', '-std()', '-X', '-Y', and '-Z', and replaces them with '.Mean', '.Std', '.XAxis', .'YAxis', and '.ZAxis'.</ul>
<ul>Then it extracts only the mean and standard deviation of each measurement. This does not include 'meanFreq', 'gravityMean', 'tBodyAccMean', 'tBodyAccJerkMean', 'tBodyGyroMean', and 'tBodyGyroJerkMean' because these are not straight mean or standard deviation calculations, but rather involve other calculations before you arrive to the mean.</ul>
<ul>It then uses the labels text file to replace the activity numbers with the activity names.</ul>
<ul>Then, finally, it groups the data by research Subject, followed by Activity, calculates the average of each measurement for every Subject and Activity, and exports the data into a data table in the UCI HAR Dataset Analysis Output.txt file.</ul>

## Codebook:

<ul>
