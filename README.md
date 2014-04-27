Getting-and-Cleaning-Data
=========================

Assignment of Getting and Cleaning Data course

To run this file make sure the paths are properly set in your machine.

1. Open the file "run_analysis.R" in R Studio.
2. Ensure that the path for the data files are correct.
3. Run the file

Output produced will be:

1. A tidy dataset as specified in the problem. It will stored initially as a CSV file.


Working of the script:

1. First the required packges are imported.
2. The current working directory is set appropriately.
3. The path for the data set is specified.
4. The files are fetched into the R system - dataSubjectTrain, dataSubjectTest, dataActivityTrain, dataActivtyTest, dataTrain, dataTest
5. The data is merged accordingly as required e.g. dataSubjectTrain and dataSubjectTest is merged into dataSubject, dataActivityTrain and dataActivityTest is merged into dataActivity, dataTrain and dataTest is merged into dataTable
6. The columns are merged together - dataSubject and dataActivity is merged into dataSubject, dataSubject and dataTable is merged into dataTable
7. Next "features.txt" is read
8. We are supposed to take only the measurements for mean and standard deviation
9. Conversion of the column numbers to a vector of variable names matching columns in dataTable
10. Reading "activity_labels.txt" file. This will be used to add descriptive names to the activities
11. Merging of activity labelsis done
12. "activityName" is added as a key
13. The data table is melted from short and wide format to tall and narrow format
14. Merging of activity names are done
15. Seperation of features from "featureName" using function "grepthis" is done
16. The data table is examined for features with 2 categories, 1 category and 3 categories one by one
17. We must check to ensure all possible combinations of "feature" are taken care of
18. Creation of a tidy data set and saving it in "output.csv"
