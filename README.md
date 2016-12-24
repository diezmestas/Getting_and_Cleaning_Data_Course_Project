#README

##Introduction

Welcome. This is the readme file corresponding to the Getting and Cleaning Data Course Project, which is part of the Coursera Data Science Specialization. In this project, we were asked to develop a .R file called "run_analysis.R", that based on data that are provided, makes a subset of it. In particular, the data we will use belong to the experiment called "Human Activity Recognition Using Smartphones" carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto in the Università degli Studi di Genova. The experiment tried to verify if it is possible to know what activity is being carried out by a subject, based on the information provided by a smartphone, that this is carrying in his waist. As we mentioned, the data obtained this way will be used by our script to generate a subset of them, but before that, we must carry out some other steps. In particular, the steps that the problem definition asks us to make in the script are as follows:

1. Merge the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
   measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with
   the average of each variable for each activity and each subject.
 
In the next two sections, we will explain in more depth the data we have used as well as the script we have developed.

##Data

As we explained previously in the introduction, the data we will use in the project belong to the experiment called "Human Activity Recognition Using Smartphones" carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto in the Università degli Studi di Genova. The experiment tried to verify if it is possible to know what activity is being carried out by a subject, based on the information provided by a smartphone, that this is carrying in his waist. The data generated in the experiment can be downloaded in the following website:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Two different things must be explained of the data we will use, one is its content, the way in which the data were obtained (number of observations, number of variables, etc.). The second, not less important, is the file structure in which the data has been stored (data have been divided into several files that must be merged).

###Data content

In this section, we will proceed to make an explanation of the content of the data that we will use. For this, it is necessary to explain in some depth how the experiment was performed. It is important to note, that we will focus on the measurements that will be used in the script (not all that were carried out will be explained). Because of this, our explanation should be considered only as a brief introduction. So if you are interested in obtaining more information about them, we suggest that you consult the "README.txt" and "features_info.txt" files that you can find in the .zip file that holds the data.

The experiment consists of a group of 30 volunteers aged between 19 and 48 who performed six types of activities (sitting, standing, laying, walking, walking upstairs and walking downstairs) while carrying a smartphone at their waist. This type of terminal, which in this case was a Samsung Galaxy S II, has an accelerometer and a gyroscope, which provided information on each of the three axis that was sampled with a frequency of 50 Hz. After this, with the application of a filter, the acceleration signal was separated into two parts, one corresponding to the acceleration of the body and one corresponding to the gravity. Therefore, at this point we have three signals (apart from subject and activity identifiers), each formed by three axes:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyGyro-XYZ

which respectively represent the two components of the acceleration and the angular velocity.

Two of the above three signals were derived in time, which created the following two Jerk signals:

* tBodyAccJerk-XYZ
* tBodyGyroJerk-XYZ

both also formed by three axes. After this, using the Euclidean norm, the magnitude of each of the 5 previous signals was calculated, generating the following one-dimensional signals:

* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag

Next, the Fourier transform was applied to seven of the above signals, obtaining the following:

* fBodyAcc-XYZ
* fBodyAccMag
* fBodyAccJerk-XYZ
* fBodyAccJerkMag
* fBodyGyro-XYZ
* fBodyGyroMag
* fBodyGyroJerkMag

Finally, five new average signals were created:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

which were used solely to calculate the angle between vectors.

From each of the first seventeen signals (everyone except the finished in "Mean") were calculated several variables (mean, standard deviation, maximum, minimum, etc.). But we must remember that in the problem definition we were asked to create a subset of the data with only the measurements of the mean and the standard deviation of each measurement. Initially, we decided to carry it out to the letter but finally, given the possibility of understanding it in several ways, we decided to choose a less restrictive option (in fact, the most general possible). We selected all the measurements that include the word "mean" or "std" (standard deviation) in its name. This way, if in the future we notice that our decision was not correct, we could subset the file generated by our script, and select only the necessary columns. Acting this way, out of the total of 563, we selected 86 measurements (the subset generated by our script will have 88 columns, because we must add to the number of measurements, a column for each of the subject and activity identifiers).

Finally, before finishing this section, we must highlight three things:

* Data were randomly divided into two groups, 70% for the training set and 30% for the test set.
* Each measurement (apart from subject and activity identifiers) has been normalized, so its value is in the range [-1, 1].
* Due to the above, all the measurements are dimensionless (they lost their units when they were normalized).

###File structure

In this section, we will proceed to make an explanation of the file structure of the data. However, it should be noted that this is only a brief introduction. This is because we will focus on the files that contain the measurements that will be used in the script. So, as we mentioned before, if you are interested in obtaining more information, we suggest that you consult the "README.txt" and "features_info.txt" files.

Time now to talk about the files that we will use. As we have already explained, the data are divided into two sets, one formed by the training data and the other formed by the test data. Apart from them, there are also two important files which are:

* features.txt: txt file containing 561 obs. of 2 variables. Contains the names of all the measurements that were carried out for each sample.
* activity_labels.txt: txt file containing 6 obs. of 2 variables. Contains the names of the various activities that were conducted during the experiment.

####Training set

The training set has been located in its own folder within the file structure of the data (the folder is called train). We will use the following three files:

* subject_train.txt: txt file containing 7352 obs. of 1 variable. Identifies the subject who was performing the activity for each sample.
* y_train.txt: txt file containing 7352 obs. of 1 variable. Identifies the activity that was being performed for each sample.
* X_train.txt: txt file containing 7352 obs. of 561 variables. Contains all the measurements that were carried out for each sample.

####Test set

As in the case of the training set, the test test has been located in its own folder within the file structure of the data (the folder is called test). We will use the following three files (which are equivalent to those used in the training set):

* subject_test.txt: txt file containing 2947 obs. of 1 variable. Identifies the subject who was performing the activity for each sample.
* y_test.txt: txt file containing 2947 obs. of 1 variable. Identifies the activity that was being performed for each sample.
* X_test.txt: txt file containing 2947 obs. of 561 variables. Contains all the measurements that were carried out for each sample.

##Code

Once we have listed the data files that we will use, we will explain the operation of the code that we have prepared. However, it should be noted that this is only a brief introduction. So if you are interested in obtaining more information about it, we suggest that you consult the comments included in the source code.

In the problem definition, we were asked to perform all the steps mentioned in the introduction in a single .R file called "run_analysis.R". After its execution, a file called "tidy_data.txt" is created. This file, that contains the requested subset, can be loaded by using the following command:

``` R
        data <- read.table("tidy_data.txt", header = TRUE)
```

(the idea of the previous command was obtained from the website suggested in the course forum: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)

In both the script and this readme document, we have decided to divide the process into sections to make it more clear how the script we have prepared, performs each step.

###Step 0

Before starting the project, We proceed to execute two preliminary steps that will be necessary for the subsequent realization of it:

1. During the script, we will use the "dplyr" package explained in the third week of the course. Therefore, we will check if it is available. If not, it will be downloaded and installed.
2. Once we have verified that we have the necessary package for the analysis, we will do the same with the data. As in the previous case, if the data files are not available in the working directory, we will proceed to download and unzip them.

###Step 1

In this step, we proceed to merge both training and test to create one data set. But before we can carry it out, we must load the three files that form each set in memory (subject, y and X). Once this has been done, we will create two temporary data.frames, one for each set. Finally, we will merge them to obtain the definitive data.frame.

###Step 2

In this section, we create a new data.frame consisting in a subset of the original data. In particular, we are asked to select all the columns that contain the mean and standard deviation for each measurement. We carry this out with the help of the "features.txt" file that contains the names of all the measurements that were done for each sample. Based on this information, we perform the desired subsetting by using the grep command applied to the features names.

###Step 3

In this step, we are asked to update the contents of our data.frame. In particular, we use descriptive names to identify the activities. We carry this out with the help of the "activity_labels.txt" file that contains the names of the various activities that were conducted during the experiment. Using this information, we replace the original activity identifier values (integers between 1 and 6) by their real names.

###Step 4

In this section, we label the columns that compose our data.frame. The first two correspond to the subject identifier which we call "Subject" and the type of activity being carried out, which we simply call "Activity". For the following columns, we use a different method. They were generated by using the grep command in the step 2. Because of this, their names will be assigned by applying the same subsetting that was carried to the columns of the original data.frame, to the list of variable names contained in the "features.txt" file.

###Step 5

It is in this section, where the true data processing occur. To do this, we use the "dplyr" package that provides us with a flexible grammar for data manipulation. In addition to using the functions contained in the package, we also use its ability to chain them. In the problem definition, we are asked to create a second data.frame with the average of each variable for each activity and each subject. To carry this out, we group the data using as the first variable the identifier of the subject, and as the second the type of activity that was taking place at that time (it could be done in the other way). After this, using the command "summarise_each", we average each of the remaining columns, which correspond to those selected in step 2 (the columns that contain the mean and standard deviation for each measurement). Finally, the result of the entire process, is saved in a txt file, called "tidy_data.txt".

##License

Of course, the source code of the "run_analysis.R" script can be used with complete freedom. However, the use of the data, even if it is only the "tidy_data.txt" file (as a subset of the original data), is subject to the following license:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
