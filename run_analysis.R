install.packages("dplyr")
install.packages("tidyr")

library(dplyr)
library(tidyr)

setwd("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/")
getwd()

file.exists("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

features <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
activity_labels <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", col.names = c("activityId", "activity"))


subject_train <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
y_train <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", col.names = "activityId")


subject_test <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", col.names = features$V2)
y_test <- read.table("C:/Users/Dell/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", col.names = "activityId")


subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
merged_data <- cbind(subject, y_data, x_data)


mean_std_features <- grep("-(mean|std)\\(\\)", features$V2)
selected_data <- merged_data[, c(1, 2, mean_std_features + 2)]


selected_data <- merge(selected_data, activity_labels, by.x = "activityId", by.y = "activityId")
selected_data$activityId <- NULL

# Step 4: Label the Dataset
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("-mean\\(\\)", "Mean", names(selected_data), ignore.case = TRUE)
names(selected_data) <- gsub("-std\\(\\)", "STD", names(selected_data), ignore.case = TRUE)
names(selected_data) <- gsub("-", "_", names(selected_data))

# Step 5: Create Tidy Dataset
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Write tidy data to file
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)


