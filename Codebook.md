Tidy_Dataset
============

Course project for Getting and Cleaning Data

To understand how the scripts work, please see README.MD. 

Overall, the feature selection is the following:


1) The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
2) Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
3) Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


To make the feature names more human-friendly, below is the before and after names of the features:

BEFORE				AFTER
1 tBodyAcc-mean()-X	=>	Body_Acceleration_Time_MeanOn_X_Axis
2 tBodyAcc-mean()-Y	=>	Body_Acceleration_Time_MeanOn_Y_Axis
3 tBodyAcc-mean()-Z	=>	Body_Acceleration_Time_MeanOn_Z_Axis
4 tBodyAcc-std()-X	=>	Body_Acceleration_Time_StdDevOn_X_Axis
5 tBodyAcc-std()-Y	=>	Body_Acceleration_Time_StdDevOn_Y_Axis
6 tBodyAcc-std()-Z	=>	Body_Acceleration_Time_StdDevOn_Z_Axis
41 tGravityAcc-mean()-X	=>	Gravity_Acceleration_Time_MeanOn_X_Axis
42 tGravityAcc-mean()-Y	=>	Gravity_Acceleration_Time_MeanOn_Y_Axis
43 tGravityAcc-mean()-Z	=>	Gravity_Acceleration_Time_MeanOn_Z_Axis
44 tGravityAcc-std()-X	=>	Gravity_Acceleration_Time_StdDevOn_X_Axis
45 tGravityAcc-std()-Y	=>	Gravity_Acceleration_Time_StdDevOn_Y_Axis
46 tGravityAcc-std()-Z	=>	Gravity_Acceleration_Time_StdDevOn_Z_Axis
81 tBodyAccJerk-mean()-X	=>	Jerk_of_Body_Acceleration_Time_MeanOn_X_Axis
82 tBodyAccJerk-mean()-Y	=>	Jerk_of_Body_Acceleration_Time_MeanOn_Y_Axis
83 tBodyAccJerk-mean()-Z	=>	Jerk_of_Body_Acceleration_Time_MeanOn_Z_Axis
84 tBodyAccJerk-std()-X	=>	Jerk_of_Body_Acceleration_Time_StdDevOn_X_Axis
85 tBodyAccJerk-std()-Y	=>	Jerk_of_Body_Acceleration_Time_StdDevOn_Y_Axis
86 tBodyAccJerk-std()-Z	=>	Jerk_of_Body_Acceleration_Time_StdDevOn_Z_Axis
121 tBodyGyro-mean()-X	=>	Body_Angular_Speed_Time_MeanOn_X_Axis
122 tBodyGyro-mean()-Y	=>	Body_Angular_Speed_Time_MeanOn_Y_Axis
123 tBodyGyro-mean()-Z	=>	Body_Angular_Speed_Time_MeanOn_Z_Axis
124 tBodyGyro-std()-X	=>	Body_Angular_Speed_Time_StdDevOn_X_Axis
125 tBodyGyro-std()-Y	=>	Body_Angular_Speed_Time_StdDevOn_Y_Axis
126 tBodyGyro-std()-Z	=>	Body_Angular_Speed_Time_StdDevOn_Z_Axis
161 tBodyGyroJerk-mean()-X	=>	Jerk_of_Body_Angular_Speed_Time_MeanOn_X_Axis
162 tBodyGyroJerk-mean()-Y	=>	Jerk_of_Body_Angular_Speed_Time_MeanOn_Y_Axis
163 tBodyGyroJerk-mean()-Z	=>	Jerk_of_Body_Angular_Speed_Time_MeanOn_Z_Axis
164 tBodyGyroJerk-std()-X	=>	Jerk_of_Body_Angular_Speed_Time_StdDevOn_X_Axis
165 tBodyGyroJerk-std()-Y	=>	Jerk_of_Body_Angular_Speed_Time_StdDevOn_Y_Axis
166 tBodyGyroJerk-std()-Z	=>	Jerk_of_Body_Angular_Speed_Time_StdDevOn_Z_Axis
201 tBodyAccMag-mean()	=>	Magnitude_of_Body_Acceleration_Time_Mean
202 tBodyAccMag-std()	=>	Magnitude_of_Body_Acceleration_Time_StdDev
214 tGravityAccMag-mean()	=>	Magnitude_of_Gravity_Acceleration_Time_Mean
215 tGravityAccMag-std()	=>	Magnitude_of_Gravity_Acceleration_Time_StdDev
227 tBodyAccJerkMag-mean()	=>	Jerk_and_Magnitude_of_Body_Acceleration_Time_Mean
228 tBodyAccJerkMag-std()	=>	Jerk_and_Magnitude_of_Body_Acceleration_Time_StdDev
240 tBodyGyroMag-mean()	=>	Magnitude_of_Body_Angular_Speed_Time_Mean
241 tBodyGyroMag-std()	=>	Magnitude_of_Body_Angular_Speed_Time_StdDev
253 tBodyGyroJerkMag-mean()	=>	Jerk_and_Magnitude_of_Body_Angular_Speed_Time_Mean
254 tBodyGyroJerkMag-std()	=>	Jerk_and_Magnitude_of_Body_Angular_Speed_Time_StdDev
266 fBodyAcc-mean()-X	=>	Body_Acceleration_Frequency_MeanOn_X_Axis
267 fBodyAcc-mean()-Y	=>	Body_Acceleration_Frequency_MeanOn_Y_Axis
268 fBodyAcc-mean()-Z	=>	Body_Acceleration_Frequency_MeanOn_Z_Axis
269 fBodyAcc-std()-X	=>	Body_Acceleration_Frequency_StdDevOn_X_Axis
270 fBodyAcc-std()-Y	=>	Body_Acceleration_Frequency_StdDevOn_Y_Axis
271 fBodyAcc-std()-Z	=>	Body_Acceleration_Frequency_StdDevOn_Z_Axis
345 fBodyAccJerk-mean()-X	=>	Jerk_of_Body_Acceleration_Frequency_MeanOn_X_Axis
346 fBodyAccJerk-mean()-Y	=>	Jerk_of_Body_Acceleration_Frequency_MeanOn_Y_Axis
347 fBodyAccJerk-mean()-Z	=>	Jerk_of_Body_Acceleration_Frequency_MeanOn_Z_Axis
348 fBodyAccJerk-std()-X	=>	Jerk_of_Body_Acceleration_Frequency_StdDevOn_X_Axis
349 fBodyAccJerk-std()-Y	=>	Jerk_of_Body_Acceleration_Frequency_StdDevOn_Y_Axis
350 fBodyAccJerk-std()-Z	=>	Jerk_of_Body_Acceleration_Frequency_StdDevOn_Z_Axis
424 fBodyGyro-mean()-X	=>	Body_Angular_Speed_Frequency_MeanOn_X_Axis
425 fBodyGyro-mean()-Y	=>	Body_Angular_Speed_Frequency_MeanOn_Y_Axis
426 fBodyGyro-mean()-Z	=>	Body_Angular_Speed_Frequency_MeanOn_Z_Axis
427 fBodyGyro-std()-X	=>	Body_Angular_Speed_Frequency_StdDevOn_X_Axis
428 fBodyGyro-std()-Y	=>	Body_Angular_Speed_Frequency_StdDevOn_Y_Axis
429 fBodyGyro-std()-Z	=>	Body_Angular_Speed_Frequency_StdDevOn_Z_Axis
503 fBodyAccMag-mean()	=>	Magnitude_of_Body_Acceleration_Frequency_Mean
504 fBodyAccMag-std()	=>	Magnitude_of_Body_Acceleration_Frequency_StdDev
516 fBodyBodyAccJerkMag-mean()	=>	Jerk_and_Magnitude_of_Total_Acceleration_Frequency_Mean
517 fBodyBodyAccJerkMag-std()	=>	Jerk_and_Magnitude_of_Total_Acceleration_Frequency_StdDev
529 fBodyBodyGyroMag-mean()	=>	Magnitude_of_Total_Angular_Speed_Frequency_Mean
530 fBodyBodyGyroMag-std()	=>	Magnitude_of_Total_Angular_Speed_Frequency_StdDev
542 fBodyBodyGyroJerkMag-mean()	=>	Jerk_and_Magnitude_of_Total_Angular_Speed_Frequency_Mean
543 fBodyBodyGyroJerkMag-std()	=>	Jerk_and_Magnitude_of_Total_Angular_Speed_Frequency_StdDev
