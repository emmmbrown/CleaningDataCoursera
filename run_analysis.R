run_analysis <- function(xtest = './UCI HAR Dataset/test/X_test.txt', 
                         ytest = './UCI HAR Dataset/test/y_test.txt',
                         subjecttest = './UCI HAR Dataset/test/subject_test.txt',
                         xtrain = './UCI HAR Dataset/train/X_train.txt',
                         ytrain = './UCI HAR Dataset/train/y_train.txt',
                         subjecttrain = './UCI HAR Dataset/train/subject_train.txt',
                         labels = './UCI HAR Dataset/activity_labels.txt',
                         features = './UCI HAR Dataset/features.txt'){
  
  # This function will take the accelerometer data collected from
  # 30 volunteers wearing a smartphone from the UCI Machine Learning
  # Repository and return a tidy data table containing the average
  # of the mean and standard deviation of each measurement for each
  # activity and each subject.
  
  library(data.table)
  library(plyr)
  library(dplyr)
  
  # Load test data
  xtest <- as.data.table(read.table(xtest, colClasses = 'numeric'))
  ytest <- fread(ytest)
  subjectTest <- fread(subjecttest)
  
  # Load train data
  xtrain <- as.data.table(read.table(xtrain, colClasses = 'numeric'))
  ytrain <- fread(ytrain)
  subjectTrain <- fread(subjecttrain)
  
  # Bind the data for each variable
  x <- rbind(xtest, xtrain)
  y <- rbind(ytest, ytrain)
  setnames(y, 'ActivityNum')
  subject <- rbind(subjectTest, subjectTrain)
  setnames(subject, 'Subject')
  
  # Load the features for the x data, rename them so that they're
  # readable and compatible with R, then label the columns
  features <- fread(features)
  features <- t(features$V2)
  features <- sub('-mean\\(\\)', '.Mean', features)
  features <- sub('-std\\(\\)', '.Std', features)
  features <- sub('-X', '.XAxis', features)
  features <- sub('-Y', '.YAxis', features)
  features <- sub('-Z', '.ZAxis', features)
  setnames(x, features)
  
  # Select only the mean and standard deviation data from x, excludes
  # 'meanFreq' and other variables because they are not direct
  # means and involve other calculations before they were averaged
  x <- select(x, contains(".Mean"), contains(".Std"))
  
  # Mutate y to add a column with the label for each value, then only
  # select the labels to replace the ActivityNum
  labels <- fread(labels)
  labels <- labels$V2
  y <- mutate(y, Activity = labels[ActivityNum])
  y <- select(y, Activity)
  
  # Combine everything into a data table
  data <- cbind(subject, y, x)
  
  # Arrange by subject number and then activity
  data <- arrange(data, Subject)
  data <- group_by(data, Subject, Activity)
  
  # Create the final table
  tidy <- summarise_each(data, funs(mean))
  names <- colnames(tidy)
  names <- sub('tBody', 'Avg.tBody', names)
  names <- sub('fBody', 'Avg.fBody', names)
  names <- sub('tGravity', 'Avg.tGravity', names)
  names <- sub('fGravity', 'Avg.fGravity', names)
  setnames(tidy, names)
  write.table(tidy, './UCI HAR Dataset Analysis Output.txt', row.name=FALSE)
  
}