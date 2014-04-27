Codebook
=========================

Codebook for assignment of Getting and Cleaning Data course

The variables used are:

1. packages - stores the packages to be imported
2. path - stores the current working directory path
3. filesPath - stores the dataset path
4. dataSubjectTrain - stores the data table for the Subject in Train folder
5. dataSubjectTest - stores the data table for the Subject in Test folder
6. dataActivityTrain - stores the data table for the Activity in Train folder
7. dataActivityTest - stores the data table for the Activity in Test folder
8. dataTrain - stores the data table for the training set
9. dataTest - stores the data table for the test set
10. dataSubject - stores the merged value of dataSubjectTrain and dataSubjectTest
11. dataActivity - stores the merged value of dataActivityTrain and dataActivityTest
12. dataTable - stores the merged data for the dataTrain and dataTest
13. dataFeatures - stores the contents from features.txt and for keeping track of only Mean and SD
14. dataActivityNames - stores the labels of the various activities
15. categoryCount - stores the number of categories involved
16. subject - keeps track of the entity which performed a particular activity
17. activity - name of the activity
18. feature - name of the feature
19. featureDomain - stores the time and frequency
20. featureInstrument - stores the type of instrument i.e. Accelerometer or Gyroscope
21. featureAcceleration - stores the acceleration (either of the body or during free fall i.e. gravity)
22. featureMeanOrSD - stores the mean and standard deviation
23. featureJerk - stores the jerk signal
24. featureMagnitude - stores the magnitude of the signal
25. featureAxis - stores the information about the axis (X, Y, Z)


Dataset structure:

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

