library(reshape2)
library(stringr)
library(sqldf)

#step 1: combine test and train files
#step 1.1: read all the files into tables
data_path <- "./UCI HAR Dataset/"
test_path <- "./UCI HAR Dataset/test/"
train_path <- "./UCI HAR Dataset/train/"

feature <- read.table(paste(data_path, 'features.txt', sep=''), sep=' ', header=FALSE, col.names=c('id', 'feature'))
activity <- read.table(paste(data_path, 'activity_labels.txt', sep=''), sep=' ', header=FALSE, col.names=c('activity_id', 'activity'))

x_test <- read.table(paste(test_path, 'x_test.txt', sep=''), col.names=as.character(feature$feature))
y_test <- read.table(paste(test_path, 'y_test.txt', sep=''), sep='\t', header=FALSE, col.names='activity_id')
sub_test <- read.table(paste(test_path, 'subject_test.txt', sep=''), sep='\t', header=FALSE, col.names='volunteer_id')

x_train <- read.table(paste(train_path, 'x_train.txt', sep=''), col.names=as.character(feature$feature))
y_train <- read.table(paste(train_path, 'y_train.txt', sep=''), sep='\t', header=FALSE, col.names='activity_id')
sub_train <-read.table(paste(train_path, 'subject_train.txt', sep=''), sep='\t', header=FALSE, col.names='volunteer_id')

#step 1.2: combine (rbind) test and train
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
sub <- rbind(sub_test, sub_train)

#step 1.3: combine (cbind) x, y and sub 
full <- cbind(sub, y, x)

#step 1.4: insert activity name based on activity_id 
full <- merge(activity, full, by.x='activity_id', by.y='activity_id')
v_index <- grep('volunteer_id', names(full)) #move volunteer_id as the first column
full <- full[,c(v_index, (1:ncol(full))[-v_index])]

#step 2: extracts only the mean and standard deviation measurements.
#step 2.1: select the features that are means() and std()
sub_features <- sqldf("select * from feature f where f.feature like '%mean()%' or f.feature like '%std()%'")

#step 2.2: select the full columns that correspond to the mean() and std() measurements
#note1: ids of features need to be shifted by 3 - 'volunteer_id', 'activity_id', 'activity'
#note2: need to preserve the three columns from note1
#note3: gsub sequence matters, as BodyBody or JerkMag needs to be replaced first
sub_full <- full[,c(1,2,3,sub_features$id+3)]

#step 3 & 4: prescriptively name the variables
#step 4.1: change abrreviated names to full names
names <- names(sub_full)
names <- gsub('BodyBody', 'Total_', names, ignore.case=TRUE)
names <- gsub('Body', 'Body_', names, ignore.case=TRUE)
names <- gsub('Gravity', 'Gravity_', names, ignore.case=TRUE)
names <- gsub('Acc', 'Acceleration_', names, ignore.case=TRUE)
names <- gsub('Gyro', 'Angular_Speed_', names, ignore.case=TRUE)
names <- gsub('X', 'On_X_Axis', names, ignore.case=FALSE)
names <- gsub('Y', 'On_Y_Axis', names, ignore.case=FALSE)
names <- gsub('Z', 'On_Z_Axis', names, ignore.case=FALSE)

#step 4.2: shift around the order of the name components to make it more readable
mod <- function(z) {
  if (substring(z, 1, 1) == 'f') {
    if (grepl('mean', z)) {
      z <- gsub('mean', 'Frequency_Mean', substring(z,2))
    }
    if (grepl('std', z)) {
      z <- gsub('std', 'Frequency_StdDev', substring(z,2))
    }
  }
  else if (substring(z, 1, 1) == 't') {
    if (grepl('mean', z)) {
      z <- gsub('mean', 'Time_Mean', substring(z,2))
    }
    if (grepl('std', z)) {
      z <- gsub('std', 'Time_StdDev', substring(z,2))
    }
  }
  else {
    z
  }
  
  if (grepl('JerkMag',z)) {
    z <- paste('Jerk_and_Magnitude_of_', gsub('JerkMag', '', z), sep='')
  } 
  else if (grepl('Mag',z)) {
    z <- paste('Magnitude_of_', gsub('Mag', '', z), sep='')
  }
  else if (grepl('Jerk',z)) {
    z <- paste('Jerk_of_', gsub('Jerk', '', z), sep='')
  }
  else {
    z
  }
  
  z <- gsub('\\.', '', z)
}

names(sub_full) <- lapply(names, function(z) mod(z))

#step 5: 2nd tidy set with average of each variable for each activity and each subject
sp <- split(sub_full, list(sub_full$volunteer_id, sub_full$activity))
temp_tidy <- sapply(sp, function(a) colMeans(a[,names(sub_full)[4:length(names(sub_full))]]))
tidy_avg <- t(as.data.frame(temp_tidy))
write.table(tidy_avg, file = "tidy_dataset.txt", quote = FALSE, sep = "\t",
            row.names = FALSE)


