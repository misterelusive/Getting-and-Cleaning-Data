Codebook
=========================

Codebook for assignment of Getting and Cleaning Data course

Variables used:
---------------

Variable name       |  Description
--------------------|--------------
packages            |  stores the packages to be imported
path                |  stores the current working directory path
filesPath           |  stores the dataset path
dataSubjectTrain    |  stores the data table for the Subject in Train folder
dataSubjectTest     |  stores the data table for the Subject in Test folder
dataActivityTrain   |  stores the data table for the Activity in Train folder
dataActivityTest    |  stores the data table for the Activity in Test folder
dataTrain           |  stores the data table for the training set
dataTest            |  stores the data table for the test set
dataSubject         |  stores the merged value of dataSubjectTrain and dataSubjectTest
dataActivity        |  stores the merged value of dataActivityTrain and dataActivityTest
dataTable           |  stores the merged data for the dataTrain and dataTest
dataFeatures        |  stores the contents from features.txt and for keeping track of only Mean and SD
dataActivityNames   |  stores the labels of the various activities
categoryCount       |  stores the number of categories involved
subject             |  keeps track of the entity which performed a particular activity
activity            |  name of the activity
feature             |  name of the feature
featureDomain       |  stores the time and frequency
featureInstrument   |  stores the type of instrument i.e. Accelerometer or Gyroscope
featureAcceleration |  stores the acceleration (either of the body or during free fall i.e. gravity)
featureMeanOrSD     |  stores the mean and standard deviation
featureJerk         |  stores the jerk signal
featureMagnitude    |  stores the magnitude of the signal
featureAxis         |  stores the information about the axis (X, Y, Z)


Dataset structure:
------------------
```
Classes ‘data.table’ and 'data.frame':	11880 obs. of  11 variables:
 $ subject            : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activity           : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ featureDomain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
 $ featureAcceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
 $ featureInstrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
 $ featureJerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
 $ featureMagnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
 $ featureMeanOrSD    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
 $ featureAxis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
 $ count              : int  50 50 50 50 50 50 50 50 50 50 ...
 $ average            : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
 - attr(*, "sorted")= chr  "subject" "activity" "featureDomain" "featureAcceleration" ...
 - attr(*, ".internal.selfref")=<externalptr>
```
