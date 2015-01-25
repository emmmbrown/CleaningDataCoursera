# Getting and Cleaning Data Final Project
This is the repo for the final project in the Getting and Cleaning Data Coursera class.

This project involved the accelerometer data from an experiment with Samsung phones found <a href="http://archive.ics.uci.edu/ml/machine-learning-databases/00240/">here</a> at the UCI Machine Learning Database. The script run_analysis.R includes a function run_analysis() which formats it, distills it down to fewer variables, and outputs a data table of average values per research subject for each activity and variable in the file UCI HAR Dataset Analysis Output.txt. 

## In detail:

<ul>First, it loads both the test and training sets, and combines them into one dataset.</ul>
<ul>It renames the variables used in the features file to make them R compatible and easier to follow. Specifically, it finds and replaces every instance of '-mean()', '-std()', '-X', '-Y', and '-Z', and replaces them with '.Mean', '.Std', '.XAxis', '.YAxis', and '.ZAxis'.</ul>
<ul>Then it extracts only the mean and standard deviation of each measurement. This does not include 'meanFreq' because it is the weighted average of the frequency components and can be calculated from the means already taken. It also does not include 'gravityMean', 'tBodyAccMean', 'tBodyAccJerkMean', 'tBodyGyroMean', and 'tBodyGyroJerkMean' because they depend on an extra variable and can also be calculated from the means already taken.</ul>
<ul>It then uses the labels text file to replace the activity numbers with the activity names.</ul>
<ul>Then, finally, it groups the data by research Subject, followed by Activity, calculates the average of each measurement for every Subject and Activity, and exports the data into a data table in the 'UCI HAR Dataset Analysis Output.txt' file.</ul>

## To run:

<ul>Download run_analysis.R. The most convenient spot for the script to be downloaded is the same directory as the UCI HAR Dataset folder.</ul>
<ul>Source the file and change the working directory in R to be the same as the run_analysis.R script.</ul>
<ul>Run the function run_analysis(). If your working directory is the same directory as the UCI HAR Dataset folder, you can run the function with no arguments. Otherwise, you must input the file path arguments for xtest='./filepath/X_test.txt', ytest = './filepath/y_test.txt', subjecttest = './filepath/subject_test.txt', xtrain = './filepath/X_train.txt', ytrain = './filepath/y_train.txt', subjecttrain = './filepath/subject_train.txt', labels = './filepath/activity_labels.txt', and features = './UCI HAR Dataset/features.txt'.</ul>
<ul>I prefer to keep the script as a function so that you are able to easily input different file paths.</ul>

## Codebook (based on the codebook from the original data):

<ul><b>Avg</b> - All variables begin with Avg. to signify that they are the average of a number of measurements for a certain research subject during a certain activity.</ul>
<ul><b>Mean</b> - Mean value. </ul>
<ul><b>Std</b> - Standard deviation.</ul>
<ul><b>t</b> - Time-based measurement. They were captured at a rate of 50 Hz and then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.</ul>
<ul><b>f</b> - Frequency domain signal. Produced by applying a Fast Fourier Transform (FFT) to some of the time-based measurements. </ul>
<ul><b>Acc</b> - Accelerometer signal, separated into <b>Body</b> and <b>Gravity</b> using a low pass Butterworth filter with a corner frequency of 0.3 Hz.</ul>
<ul><b>Gyro</b> - Gyroscope signal.</ul>
<ul><b>Jerk</b> - Obtained by deriving the body linear acceleration and angular velocity in time.</ul>
<ul><b>Mag</b> - The magnitude of three-dimensional signals calculated using the Euclidean norm. </ul>
<ul><b>XAxis</b>, <b>YAxis</b>, or <b>ZAxis</b> - The axis on which the data was recorded.</ul>


These are all combined to create the following variables:

 [3] "Avg.tBodyAcc.Mean.XAxis"       "Avg.tBodyAcc.Mean.YAxis"      
 [5] "Avg.tBodyAcc.Mean.ZAxis"       "Avg.tGravityAcc.Mean.XAxis"   
 [7] "Avg.tGravityAcc.Mean.YAxis"    "Avg.tGravityAcc.Mean.ZAxis"   
 [9] "Avg.tBodyAccJerk.Mean.XAxis"   "Avg.tBodyAccJerk.Mean.YAxis"  
[11] "Avg.tBodyAccJerk.Mean.ZAxis"   "Avg.tBodyGyro.Mean.XAxis"     
[13] "Avg.tBodyGyro.Mean.YAxis"      "Avg.tBodyGyro.Mean.ZAxis"     
[15] "Avg.tBodyGyroJerk.Mean.XAxis"  "Avg.tBodyGyroJerk.Mean.YAxis" 
[17] "Avg.tBodyGyroJerk.Mean.ZAxis"  "Avg.tBodyAccMag.Mean"         
[19] "Avg.tGravityAccMag.Mean"       "Avg.tBodyAccJerkMag.Mean"     
[21] "Avg.tBodyGyroMag.Mean"         "Avg.tBodyGyroJerkMag.Mean"    
[23] "Avg.fBodyAcc.Mean.XAxis"       "Avg.fBodyAcc.Mean.YAxis"      
[25] "Avg.fBodyAcc.Mean.ZAxis"       "Avg.fBodyAccJerk.Mean.XAxis"  
[27] "Avg.fBodyAccJerk.Mean.YAxis"   "Avg.fBodyAccJerk.Mean.ZAxis"  
[29] "Avg.fBodyGyro.Mean.XAxis"      "Avg.fBodyGyro.Mean.YAxis"     
[31] "Avg.fBodyGyro.Mean.ZAxis"      "Avg.fBodyAccMag.Mean"         
[33] "Avg.fBodyBodyAccJerkMag.Mean"  "Avg.fBodyBodyGyroMag.Mean"    
[35] "Avg.fBodyBodyGyroJerkMag.Mean" "Avg.tBodyAcc.Std.XAxis"       
[37] "Avg.tBodyAcc.Std.YAxis"        "Avg.tBodyAcc.Std.ZAxis"       
[39] "Avg.tGravityAcc.Std.XAxis"     "Avg.tGravityAcc.Std.YAxis"    
[41] "Avg.tGravityAcc.Std.ZAxis"     "Avg.tBodyAccJerk.Std.XAxis"   
[43] "Avg.tBodyAccJerk.Std.YAxis"    "Avg.tBodyAccJerk.Std.ZAxis"   
[45] "Avg.tBodyGyro.Std.XAxis"       "Avg.tBodyGyro.Std.YAxis"      
[47] "Avg.tBodyGyro.Std.ZAxis"       "Avg.tBodyGyroJerk.Std.XAxis"  
[49] "Avg.tBodyGyroJerk.Std.YAxis"   "Avg.tBodyGyroJerk.Std.ZAxis"  
[51] "Avg.tBodyAccMag.Std"           "Avg.tGravityAccMag.Std"       
[53] "Avg.tBodyAccJerkMag.Std"       "Avg.tBodyGyroMag.Std"         
[55] "Avg.tBodyGyroJerkMag.Std"      "Avg.fBodyAcc.Std.XAxis"       
[57] "Avg.fBodyAcc.Std.YAxis"        "Avg.fBodyAcc.Std.ZAxis"       
[59] "Avg.fBodyAccJerk.Std.XAxis"    "Avg.fBodyAccJerk.Std.YAxis"   
[61] "Avg.fBodyAccJerk.Std.ZAxis"    "Avg.fBodyGyro.Std.XAxis"      
[63] "Avg.fBodyGyro.Std.YAxis"       "Avg.fBodyGyro.Std.ZAxis"      
[65] "Avg.fBodyAccMag.Std"           "Avg.fBodyBodyAccJerkMag.Std"  
[67] "Avg.fBodyBodyGyroMag.Std"      "Avg.fBodyBodyGyroJerkMag.Std"

The Activities include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

There are 30 Research Subjects, identified by a number.
