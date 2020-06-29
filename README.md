# GettingAndCleaningData

The goal of this assignment is to submit work which fulfils the following criteria:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This repository contains the script (more information below) and a [CodeBook](./CodeBook.md) of the data.

## Data

The original data are found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Flow of operations
[run_analysis.R](./run_analysis.R) performs the following actions:
1. Reads in the data from the various data files.
1. Labels the data to make it easier for binding later and for easy understanding.
1. Binds the data together to form one data set.
1. Extracts the data relating to mean and standard deviation.
1. Uses descriptive activity names instead of ids.
1. Calculates the average for all the data points, per subjectid and activity.
1. Writes the summary data to a csv.

## Specifics of the code

The code run over the data is [run_analysis.R](./run_analysis.R). I've assumed
that the original data has been unzipped and is stored in the folder above this one. 

First I've read in the data. The data do not have headers in this case, so I've explicitly
excluded them. In the case of the activity measurements, I've needed to specify the separator.
```{r}
subject_train <- read.csv("../UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.csv("../UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
y_train <- read.csv("../UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_test <- read.csv("../UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.csv("../UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
y_test <- read.csv("../UCI HAR Dataset/test/y_test.txt", header = FALSE)
```

I then name the data in order to make binding the training and test data easier.
This is where I'm labelling the data set with descriptive variable names.
```{r}
data_names <- read.csv("../UCI HAR Dataset/features.txt", sep = "", header = FALSE)
names(x_train) <- data_names$V2
names(x_test) <- data_names$V2

# apply consistent naming to enable easy merging of data
names(subject_train) <- "subjectid"
names(subject_test) <- "subjectid"
names(y_train) <- "activityid"
names(y_test) <- "activityid"
```

I merge the test and train data together
```{r}
x <- bind_rows(x_test, x_train)
y <- bind_rows(y_test, y_train)
subject <- bind_rows(subject_test, subject_train)
fulldata <- bind_cols(subject, y, x)
```

I extract only the measurements of the mean and standard deviation for each measurement.
I'm basing my extraction of columns based in the variable name containing the word "mean" or "std".
I've ignored case as there are some variable names containing the word "Mean"
```{r}
subset <- fulldata %>%
    select(subjectid, activityid, grep("mean|std", names(fulldata), ignore.case = TRUE) )
```

I've used descriptive activity names to name the activities in the data set.
I've achieved this by joining the activity_labels file with the data set under analysis, 
using the activity id in both as the common id to join on.
```{r}
activitylabels <- read.csv("../UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
names(activitylabels) <- c("activityid", "activitylabel")
subset <- inner_join(activitylabels, subset, by = "activityid") %>%
    select(-activityid)
```

I've created an independent tidy data set with the average (mean) of each variable,
grouped by each activity and each subject.
```{r}
summariseddataset <- subset %>%
    group_by(activitylabel, subjectid) %>%
    summarise_all(list(mean))
```

I've then written that data set to a new file, [SummarisedDataset.txt](./SummarisedDataset.txt), to upload for this assignment.
Note that I've also written the same data to [SummarisedDataset.csv](./SummarisedDataset.csv) using write.csv(),
as it's easier to read on github.
```{r}
write.table(summariseddataset, file = "SummarisedDataset.txt", row.names = FALSE)
```