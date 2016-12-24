#Code Book

#Introduction

Welcome. This is the codebook file corresponding to the Getting and Cleaning Data Course Project, which is part of the Coursera Data Science Specialization. In this project, we were asked to develop a .R file called "run_analysis.R", that based on data that are provided, makes a subset and stores it in the "tidy_data.txt" file. This is the codebook corresponding to the generated file.

The data we will use belong to the experiment called "Human Activity Recognition Using Smartphones Dataset" carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto in the Università degli Studi di Genova. The experiment tried to verify if it is possible to know what activity is being carried out by a subject, based on the information provided by a smartphone, that this is carrying in his waist. If you are interested in obtaining more information about the original data, we suggest that you consult the "README.txt" and "features_info.txt" files that you can find in the .zip file that holds the data. It can be downloaded in the following website:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You might also find useful the "Readme.md" file that you can find in the same directory as this codebook.

#Variables

##Identifiers

Two dimensionless identifiers.

**Subject**

Identifies the subject who was performing the activity for each sample.
Class: integer
Range: [1, 30]

**Activity**

Identify the activity that was taking place on each sample.
Class: factor
Range: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

##Measurements

Eighty-six measurements of type "numeric".
Each measurement was normalized in the original data, being its range [-1, 1]. The file "tidy_data.txt" was created by making a subset of this columns and calculating the average of each of the selected ones. Because of this, the range of the 86 columns will also be [-1, 1].
Due to the above, all the measurements are dimensionless (they lost their units when they were normalized).

**tBodyAcc-mean()-X**

Mean value in the X axis of the part corresponding to the body in the acceleration signal.

**tBodyAcc-mean()-Y**

Mean value in the Y axis of the part corresponding to the body in the acceleration signal.

**tBodyAcc-mean()-Z**

Mean value in the Z axis of the part corresponding to the body in the acceleration signal.

**tBodyAcc-std()-X**

Standard deviation in the X axis of the part corresponding to the body in the acceleration signal.
        
**tBodyAcc-std()-Y**

Standard deviation in the Y axis of the part corresponding to the body in the acceleration signal.

**tBodyAcc-std()-Z**

Standard deviation in the Z axis of the part corresponding to the body in the acceleration signal.
        
**tGravityAcc-mean()-X**

Mean value in the X axis of the part corresponding to the gravity in the acceleration signal.

**tGravityAcc-mean()-Y**

Mean value in the Y axis of the part corresponding to the gravity in the acceleration signal.
        
**tGravityAcc-mean()-Z**

Mean value in the Z axis of the part corresponding to the gravity in the acceleration signal.

**tGravityAcc-std()-X**

Standard deviation in the X axis of the part corresponding to the gravity in the acceleration signal.
        
**tGravityAcc-std()-Y**

Standard deviation in the Y axis of the part corresponding to the gravity in the acceleration signal.
        
**tGravityAcc-std()-Z**

Standard deviation in the Z axis of the part corresponding to the gravity in the acceleration signal.

**tBodyAccJerk-mean()-X**

Mean value in the X axis of the Jerk signal obtained from the derivation of the body linear acceleration.
        
**tBodyAccJerk-mean()-Y**

Mean value in the Y axis of the Jerk signal obtained from the derivation of the body linear acceleration.

**tBodyAccJerk-mean()-Z**

Mean value in the Z axis of the Jerk signal obtained from the derivation of the body linear acceleration.

**tBodyAccJerk-std()-X**

Standard deviation in the X axis of the Jerk signal obtained from the derivation of the body linear acceleration.
        
**tBodyAccJerk-std()-Y**

Standard deviation in the Y axis of the Jerk signal obtained from the derivation of the body linear acceleration.
        
**tBodyAccJerk-std()-Z**

Standard deviation in the Z axis of the Jerk signal obtained from the derivation of the body linear acceleration.

**tBodyGyro-mean()-X**

Mean value in the X axis of the angular velocity signal.
        
**tBodyGyro-mean()-Y**

Mean value in the Y axis of the angular velocity signal.
        
**tBodyGyro-mean()-Z**

Mean value in the Z axis of the angular velocity signal.

**tBodyGyro-std()-X**

Standard deviation in the X axis of the angular velocity signal.
        
**tBodyGyro-std()-Y**

Standard deviation in the Y axis of the angular velocity signal.
        
**tBodyGyro-std()-Z**

Standard deviation in the Z axis of the angular velocity signal.
        
**tBodyGyroJerk-mean()-X**

Mean value in the X axis of the Jerk signal obtained from the derivation of the angular velocity signal.
        
**tBodyGyroJerk-mean()-Y**

Mean value in the Y axis of the Jerk signal obtained from the derivation of the angular velocity signal.
        
**tBodyGyroJerk-mean()-Z**

Mean value in the Z axis of the Jerk signal obtained from the derivation of the angular velocity signal.

**tBodyGyroJerk-std()-X**

Standard deviation in the X axis of the Jerk signal obtained from the derivation of the angular velocity signal.
        
**tBodyGyroJerk-std()-Y**

Standard deviation in the Y axis of the Jerk signal obtained from the derivation of the angular velocity signal.
        
**tBodyGyroJerk-std()-Z**

Standard deviation in the Z axis of the Jerk signal obtained from the derivation of the angular velocity signal.

**tBodyAccMag-mean()**

Mean value of the magnitude of the part corresponding to the body in the acceleration signal.
        
**tBodyAccMag-std()**

Standard deviation of the magnitude of the part corresponding to the body in the acceleration signal.

**tGravityAccMag-mean()**

Mean value of the magnitude of the part corresponding to the gravity in the acceleration signal.
        
**tGravityAccMag-std()**

Standard deviation of the magnitude of the part corresponding to the gravity in the acceleration signal.

**tBodyAccJerkMag-mean()**

Mean value of the magnitude of the Jerk signal obtained from the derivation of the body linear acceleration.

**tBodyAccJerkMag-std()**

Standard deviation of the magnitude of the Jerk signal obtained from the derivation of the body linear acceleration.

**tBodyGyroMag-mean()**

Mean value of the magnitude of the angular velocity signal.

**tBodyGyroMag-std()**

Standard deviation of the magnitude of the angular velocity signal.

**tBodyGyroJerkMag-mean()**

Mean value of the magnitude of the Jerk signal obtained from the derivation of the angular velocity signal.
        
**tBodyGyroJerkMag-std()**

Standard deviation of the magnitude of the Jerk signal obtained from the derivation of the angular velocity signal.

**fBodyAcc-mean()-X**

Mean value in the X axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.
        
**fBodyAcc-mean()-Y**

Mean value in the Y axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.
        
**fBodyAcc-mean()-Z**

Mean value in the Z axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.

**fBodyAcc-std()-X**

Standard deviation in the X axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.
        
**fBodyAcc-std()-Y**

Standard deviation in the Y axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.
        
**fBodyAcc-std()-Z**

Standard deviation in the Z axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.

**fBodyAcc-meanFreq()-X**

Mean frequency in the X axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.
        
**fBodyAcc-meanFreq()-Y**

Mean frequency in the Y axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.
        
**fBodyAcc-meanFreq()-Z**

Mean frequency in the Z axis of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.
        
**fBodyAccJerk-mean()-X**

Mean value in the X axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.
        
**fBodyAccJerk-mean()-Y**

Mean value in the Y axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyAccJerk-mean()-Z**

Mean value in the Z axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyAccJerk-std()-X**

Standard deviation in the X axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyAccJerk-std()-Y**

Standard deviation in the Y axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.
        
**fBodyAccJerk-std()-Z**

Standard deviation in the Z axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyAccJerk-meanFreq()-X**

Mean frequency in the X axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.
        
**fBodyAccJerk-meanFreq()-Y**

Mean frequency in the Y axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.
        
**fBodyAccJerk-meanFreq()-Z**

Mean frequency in the Z axis of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyGyro-mean()-X**

Mean value in the X axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-mean()-Y**

Mean value in the Y axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-mean()-Z**

Mean value in the Z axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-std()-X**

Standard deviation in the X axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-std()-Y**

Standard deviation in the Y axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-std()-Z**

Standard deviation in the Z axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-meanFreq()-X**

Mean frequency in the X axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-meanFreq()-Y**

Mean frequency in the Y axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyGyro-meanFreq()-Z**

Mean frequency in the Z axis of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyAccMag-mean()**

Mean value of the magnitude of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.

**fBodyAccMag-std()**

Standard deviation of the magnitude of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.

**fBodyAccMag-meanFreq()**

Mean frequency of the magnitude of the Fast Fourier Transform (FFT) applied to the part corresponding to the body in the acceleration signal.

**fBodyBodyAccJerkMag-mean()**

Mean value of the magnitude of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyBodyAccJerkMag-std()**

Standard deviation of the magnitude of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyBodyAccJerkMag-meanFreq()**

Mean frequency of the magnitude of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the body linear acceleration.

**fBodyBodyGyroMag-mean()**

Mean value of the magnitude of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyBodyGyroMag-std()**

Standard deviation of the magnitude of the Fast Fourier Transform (FFT) applied to the angular velocity signal.
        
**fBodyBodyGyroMag-meanFreq()**

Mean frequency of the magnitude of the Fast Fourier Transform (FFT) applied to the angular velocity signal.

**fBodyBodyGyroJerkMag-mean()**

Mean value of the magnitude of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the angular velocity.
        
**fBodyBodyGyroJerkMag-std()**

Standard deviation of the magnitude of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the angular velocity.
        
**fBodyBodyGyroJerkMag-meanFreq()**

Mean frequency of the magnitude of the Fast Fourier Transform (FFT) applied to the Jerk signal obtained from the derivation of the angular velocity.

**angle(tBodyAccMean,gravity)**

Angle between the average of the part corresponding to the body in the acceleration signal and the gravity.

**angle(tBodyAccJerkMean),gravityMean)**

Angle between the average of the Jerk signal obtained from the derivation of the body linear acceleration and the average of the part corresponding to gravity in the acceleration signal.

**angle(tBodyGyroMean,gravityMean)**

Angle between the average of angular velocity signal and the average of the part corresponding to gravity in the acceleration signal.

**angle(tBodyGyroJerkMean,gravityMean)**

Angle between the average of Jerk signal obtained from the derivation of the angular velocity signal and the average of the part corresponding to gravity in the acceleration signal.

**angle(X,gravityMean)**

Angle between the X axis and the average of the part corresponding to gravity in the acceleration signal.
        
**angle(Y,gravityMean)**

Angle between the Y axis and the average of the part corresponding to gravity in the acceleration signal.

**angle(Z,gravityMean)**

Angle between the Z axis and the average of the part corresponding to gravity in the acceleration signal.
