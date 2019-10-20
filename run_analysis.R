
#Load data from repo
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  

#1. Merges the training and the test sets to create one data set.
total_dataset <- rbind(X_train,X_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_and_std_features <- grep("mean()|std()", features[, 2]) 

#3. Uses descriptive activity names to name the activities in the data set.
total_label <- rbind(y_train, y_test)
names(total_label) <- "activity"
total_label$activity <- factor(total_label$activity, labels=activity_labels$V2)

#4. Appropriately labels the data set with descriptive variable names. 
names(total_dataset) = features$V2

total_subject <- rbind(subject_train, subject_test)
names(total_subject) <- "subjectId"

total_dataset <- total_dataset[,mean_and_std_features]

combined_dataset_and_label <- cbind(total_subject, total_dataset, total_label)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
meltedData <- melt(combined_dataset_and_label,(id.vars=c("subjectId","activity")))
secondTidyData <- dcast(meltedData, subjectId+activity ~ variable, mean)

# Write data to file
write.csv(secondTidyData, "TidyData.txt", row.names=FALSE)