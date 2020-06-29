# CodeBook

This codebook describes the variables, the data, and any transformations or work that I performed to clean up the data.

## The Data

The original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This represents data collected from accelerometers from Samsung Galaxy S smartphones. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The Transformations

I used the following transformations to tidy the data:
* `bind_rows()` to merge the train and test data.
* `bind_cols()` to merge the subjectid, activity and measurements.
* `select()` along with a `grep()` to extract a subset of the data (only the means and std devs).
* `inner_join()` to merge the activity labels with the rest of the data, followed by `select()` to remove the activity ids.
* `group_by()` and `summarise_all()` to calculate averages of all the measurements.

## The Variables

The variables in the data are outlined as follows:

Variable name | Range of values | Description
-------|-------|-------
activitylabel | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING | The activity that the subject was performing at the time these measurements were taken.
subjectid | 1 to 30 | The id of the person performing the activity.
tBodyAcc-mean()-X	|	-1 to 1	|	Mean of the body acceleration signal over the time domain (X coordinate)
tBodyAcc-mean()-Y	|	-1 to 1	|	Mean of the body acceleration signal over the time domain (Y coordinate)
tBodyAcc-mean()-Z	|	-1 to 1	|	Mean of the body acceleration signal over the time domain (Z coordinate)
tBodyAcc-std()-X	|	-1 to 1	|	Standard deviation of the body acceleration signal over the time domain (X coordinate)
tBodyAcc-std()-Y	|	-1 to 1	|	Standard deviation of the body acceleration signal over the time domain (Y coordinate)
tBodyAcc-std()-Z	|	-1 to 1	|	Standard deviation of the body acceleration signal over the time domain (Z coordinate)
tGravityAcc-mean()-X	|	-1 to 1	|	Mean of the gravity acceleration signal over the time domain (X coordinate)
tGravityAcc-mean()-Y	|	-1 to 1	|	Mean of the gravity acceleration signal over the time domain (Y coordinate)
tGravityAcc-mean()-Z	|	-1 to 1	|	Mean of the gravity acceleration signal over the time domain (Z coordinate)
tGravityAcc-std()-X	|	-1 to 1	|	Standard deviation of the gravity acceleration signal over the time domain (X coordinate)
tGravityAcc-std()-Y	|	-1 to 1	|	Standard deviation of the gravity acceleration signal over the time domain (Y coordinate)
tGravityAcc-std()-Z	|	-1 to 1	|	Standard deviation of the gravity acceleration signal over the time domain (Z coordinate)
tBodyAccJerk-mean()-X	|	-1 to 1	|	Mean of the body linear acceleration over the time domain (X coordinate)
tBodyAccJerk-mean()-Y	|	-1 to 1	|	Mean of the body linear acceleration over the time domain (Y coordinate)
tBodyAccJerk-mean()-Z	|	-1 to 1	|	Mean of the body linear acceleration over the time domain (Z coordinate)
tBodyAccJerk-std()-X	|	-1 to 1	|	Standard deviation of the body linear acceleration over the time domain (X coordinate)
tBodyAccJerk-std()-Y	|	-1 to 1	|	Standard deviation of the body linear acceleration over the time domain (Y coordinate)
tBodyAccJerk-std()-Z	|	-1 to 1	|	Standard deviation of the body linear acceleration over the time domain (Z coordinate)
tBodyGyro-mean()-X	|	-1 to 1	|	Mean of the gyroscope signal over the time domain (X coordinate)
tBodyGyro-mean()-Y	|	-1 to 1	|	Mean of the gyroscope signal over the time domain (Y coordinate)
tBodyGyro-mean()-Z	|	-1 to 1	|	Mean of the gyroscope signal over the time domain (Z coordinate)
tBodyGyro-std()-X	|	-1 to 1	|	Standard deviation of the gyroscope signal over the time domain (X coordinate)
tBodyGyro-std()-Y	|	-1 to 1	|	Standard deviation of the gyroscope signal over the time domain (Y coordinate)
tBodyGyro-std()-Z	|	-1 to 1	|	Standard deviation of the gyroscope signal over the time domain (Z coordinate)
tBodyGyroJerk-mean()-X	|	-1 to 1	|	Mean of the body angular velocity over the time domain (X coordinate)
tBodyGyroJerk-mean()-Y	|	-1 to 1	|	Mean of the body angular velocity over the time domain (Y coordinate)
tBodyGyroJerk-mean()-Z	|	-1 to 1	|	Mean of the body angular velocity over the time domain (Z coordinate)
tBodyGyroJerk-std()-X	|	-1 to 1	|	Standard deviation of the body angular velocity over the time domain (X coordinate)
tBodyGyroJerk-std()-Y	|	-1 to 1	|	Standard deviation of the body angular velocity over the time domain Y coordinate)
tBodyGyroJerk-std()-Z	|	-1 to 1	|	Standard deviation of the body angular velocity over the time domain (Z coordinate)
tBodyAccMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the body acceleration signal over the time domain
tBodyAccMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the body acceleration signal over the time domain
tGravityAccMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the gravity acceleration signal over the time domain
tGravityAccMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the gravity acceleration signal over the time domain
tBodyAccJerkMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the body linear acceleration over the time domain
tBodyAccJerkMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the body linear acceleration over the time domain
tBodyGyroMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the gyroscope signal over the time domain
tBodyGyroMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the gyroscope signal over the time domain
tBodyGyroJerkMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the body angular velocity over the time domain
tBodyGyroJerkMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the body angular velocity over the time domain
fBodyAcc-mean()-X	|	-1 to 1	|	Mean of the body acceleration signal over the frequency domain (X coordinate)
fBodyAcc-mean()-Y	|	-1 to 1	|	Mean of the body acceleration signal over the frequency domain (Y coordinate)
fBodyAcc-mean()-Z	|	-1 to 1	|	Mean of the body acceleration signal over the frequency domain (Z coordinate)
fBodyAcc-std()-X	|	-1 to 1	|	Standard deviation of the body acceleration signal over the frequency domain (X coordinate)
fBodyAcc-std()-Y	|	-1 to 1	|	Standard deviation of the body acceleration signal over the frequency domain (Y coordinate)
fBodyAcc-std()-Z	|	-1 to 1	|	Standard deviation of the body acceleration signal over the frequency domain (Z coordinate)
fBodyAcc-meanFreq()-X	|	-1 to 1	|	Weighted average of the frequency components of the body acceleration signal over the frequency domain (X coordinate)
fBodyAcc-meanFreq()-Y	|	-1 to 1	|	Weighted average of the frequency components of the body acceleration signal over the frequency domain (Y coordinate)
fBodyAcc-meanFreq()-Z	|	-1 to 1	|	Weighted average of the frequency components of the body acceleration signal over the frequency domain (Z coordinate)
fBodyAccJerk-mean()-X	|	-1 to 1	|	Mean of the body linear acceleration over the frequency domain (X coordinate)
fBodyAccJerk-mean()-Y	|	-1 to 1	|	Mean of the body linear acceleration over the frequency domain (Y coordinate)
fBodyAccJerk-mean()-Z	|	-1 to 1	|	Mean of the body linear acceleration over the frequency domain (Z coordinate)
fBodyAccJerk-std()-X	|	-1 to 1	|	Standard deviation of the body linear acceleration over the frequency domain (X coordinate)
fBodyAccJerk-std()-Y	|	-1 to 1	|	Standard deviation of the body linear acceleration over the frequency domain (Y coordinate)
fBodyAccJerk-std()-Z	|	-1 to 1	|	Standard deviation of the body linear acceleration over the frequency domain (Z coordinate)
fBodyAccJerk-meanFreq()-X	|	-1 to 1	|	Weighted average of the frequency components of the body linear acceleration over the frequency domain (X coordinate)
fBodyAccJerk-meanFreq()-Y	|	-1 to 1	|	Weighted average of the frequency components of the body linear acceleration over the frequency domain (Y coordinate)
fBodyAccJerk-meanFreq()-Z	|	-1 to 1	|	Weighted average of the frequency components of the body linear acceleration over the frequency domain (Z coordinate)
fBodyGyro-mean()-X	|	-1 to 1	|	Mean of the gyroscope signal over the frequency domain (X coordinate)
fBodyGyro-mean()-Y	|	-1 to 1	|	Mean of the gyroscope signal over the frequency domain (Y coordinate)
fBodyGyro-mean()-Z	|	-1 to 1	|	Mean of the gyroscope signal over the frequency domain (Z coordinate)
fBodyGyro-std()-X	|	-1 to 1	|	Standard deviation of the gyroscope signal over the frequency domain (X coordinate)
fBodyGyro-std()-Y	|	-1 to 1	|	Standard deviation of the gyroscope signal over the frequency domain (Y coordinate)
fBodyGyro-std()-Z	|	-1 to 1	|	Standard deviation of the gyroscope signal over the frequency domain (Z coordinate)
fBodyGyro-meanFreq()-X	|	-1 to 1	|	Weighted average of the frequency components of the gyroscope signal over the frequency domain (X coordinate)
fBodyGyro-meanFreq()-Y	|	-1 to 1	|	Weighted average of the frequency components of the gyroscope signal over the frequency domain (Y coordinate)
fBodyGyro-meanFreq()-Z	|	-1 to 1	|	Weighted average of the frequency components of the gyroscope signal over the frequency domain (Z coordinate)
fBodyAccMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the body acceleration signal over the frequency domain
fBodyAccMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the body acceleration signal over the frequency domain
fBodyAccMag-meanFreq()	|	-1 to 1	|	Weighted average of the frequency components of the calculated magnitude of the body acceleration signal over the frequency domain
fBodyBodyAccJerkMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the body linear acceleration over the frequency domain
fBodyBodyAccJerkMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the body linear acceleration over the frequency domain
fBodyBodyAccJerkMag-meanFreq()	|	-1 to 1	|	Weighted average of the frequency components of the calculated magnitude of the body linear acceleration over the frequency domain
fBodyBodyGyroMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the gyroscope signal over the frequency domain
fBodyBodyGyroMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the gyroscope signal over the frequency domain
fBodyBodyGyroMag-meanFreq()	|	-1 to 1	|	Weighted average of the frequency components of the calculated magnitude of the gyroscope signal over the frequency domain
fBodyBodyGyroJerkMag-mean()	|	-1 to 1	|	Mean of the calculated magnitude of the body angular velocity over the frequency domain
fBodyBodyGyroJerkMag-std()	|	-1 to 1	|	Standard deviation of the calculated magnitude of the body angular velocity over the frequency domain
fBodyBodyGyroJerkMag-meanFreq()	|	-1 to 1	|	Weighted average of the frequency components of the calculated magnitude of the body angular velocity over the frequency domain
angle(tBodyAccMean,gravity)	|	-1 to 1	|	Average of the signals in a signal window sample of the body acceleration signal over the time domain
angle(tBodyAccJerkMean),gravityMean)	|	-1 to 1	|	Average of the signals in a signal window sample of the body linear acceleration over the time domain
angle(tBodyGyroMean,gravityMean)	|	-1 to 1	|	Average of the signals in a signal window sample of the gyroscope signal over the time domain
angle(tBodyGyroJerkMean,gravityMean)	|	-1 to 1	|	Average of the signals in a signal window sample of the body angular velocity over the time domain
angle(X,gravityMean)	|	-1 to 1	|	Average of the signals in a signal window sample of the gravity acceleration signal over the time domain (X coordinate)
angle(Y,gravityMean)	|	-1 to 1	|	Average of the signals in a signal window sample of the gravity acceleration signal over the time domain (Y coordinate)
angle(Z,gravityMean)	|	-1 to 1	|	Average of the signals in a signal window sample of the gravity acceleration signal over the time domain (Z coordinate)
