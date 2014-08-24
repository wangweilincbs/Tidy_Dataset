Tidy_Dataset
============

Course project for Getting and Cleaning Data

The script has comments written out for each of the steps required by the project.  Specifically,

For step 1: 
-- Read feature and activity files first
-- Then read x_test, y_test, subject_text, x_train, y_train and subject_train files, and apply features as column names as you x_ files
-- Row combine test and train data set
-- Column combine x, y and subject
-- Now you have fully combined test and train set, with features as column names, and subject_id and activity_id added to ID rows

For step 2:
-- Select on features with means() and std() in the names

For step 3:
-- Since column names have already been applied in step 1, this step is already done

For step 4:
-- Change abrreviated names to full names
-- Then shift around the sequence of the name components so it's more human-friendly. E.g. fBodyAcc-Mean()-Z => Body_Acceleration_Frequency_Mean_on_Z_Axis

For step 5:
-- 30 subjects and 6 activities = 180 factors
-- Split the dataset by these 180 factors
-- Then calculate column (feature) means for the 180 factors (groups)
-- Write.table to produce the output called "tidy_dataset.txt"