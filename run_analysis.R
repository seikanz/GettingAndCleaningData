library(dplyr)

# read in the data
subject_train <- read.csv("../UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.csv("../UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
y_train <- read.csv("../UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_test <- read.csv("../UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.csv("../UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
y_test <- read.csv("../UCI HAR Dataset/test/y_test.txt", header = FALSE)

# 4. Appropriately labels the data set with descriptive variable names.
# name the columns according to the features
data_names <- read.csv("../UCI HAR Dataset/features.txt", sep = "", header = FALSE)
names(x_train) <- data_names$V2
names(x_test) <- data_names$V2

# apply consistent naming to enable easy merging of data
names(subject_train) <- "subjectid"
names(subject_test) <- "subjectid"
names(y_train) <- "activityid"
names(y_test) <- "activityid"

# 1. Merges the training and the test sets to create one data set.
x <- bind_rows(x_test, x_train)
y <- bind_rows(y_test, y_train)
subject <- bind_rows(subject_test, subject_train)
fulldata <- bind_cols(subject, y, x)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
subset <- fulldata %>%
    select(subjectid, activityid, grep("mean|std", names(fulldata), ignore.case = TRUE) )

# 3. Uses descriptive activity names to name the activities in the data set
activitylabels <- read.csv("../UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
names(activitylabels) <- c("activityid", "activitylabel")
subset <- inner_join(activitylabels, subset, by = "activityid") %>%
    select(-activityid)

# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

summariseddataset <- 
    subset %>%
    group_by(activitylabel, subjectid) %>%
    summarise_all(list(mean))

# Creating a csv from the dataset. Excluding the row ids.
write.csv(summariseddataset, file = "SummarisedDataset.csv", row.names = FALSE)

