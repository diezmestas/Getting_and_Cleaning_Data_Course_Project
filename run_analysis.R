################################################################################
#                                                                              #
#       Filename:       run_analysis.R                                         #                                                                     
#                                                                              #
#       Description:    File containing the R language code that, based on     #
#                       data that are provided, creates the desired subset.    #
#                                                                              #
################################################################################

#-------------------------------------------------------------------------------
#Step 0:
#Before starting the project, We proceed to execute two preliminary steps that
#will be necessary for the subsequent realization of it:

#1. During the script, we will use the "dplyr" package explained in the third
#   week of the course. Therefore, we will check if it is available. If not,
#   it will be downloaded and installed:

#If the package is not available:
if(!require("dplyr")){
        
        #We download the package from the web. Then, We install and load it.
        install.packages("dplyr")
        library("dplyr")
        
}
#Note: If the package is available, the call to the "require()" function
#within this "if" automatically loads it.

#2. Once we have verified that we have the necessary package for the analysis,
#   we will do the same with the data. As in the previous case, if the data
#   files are not available in the working directory, we will proceed to
#   download and unzip them:

#We create a character vector that contains the relative paths to each of the
#files that will be used:
required_files <- c("./UCI HAR Dataset/test/subject_test.txt",
                    "./UCI HAR Dataset/test/y_test.txt",
                    "./UCI HAR Dataset/test/X_test.txt",
                    "./UCI HAR Dataset/train/subject_train.txt",
                    "./UCI HAR Dataset/train/y_train.txt",
                    "./UCI HAR Dataset/train/X_train.txt",
                    "./UCI HAR Dataset/features.txt",
                    "./UCI HAR Dataset/activity_labels.txt")

#If the data files are not available (even if only one):        
if (sum(file.exists(required_files)) != 8) {
        
        #If the zip file is not in the working directory, we download it from
        #the web:
        if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
                
                URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(URL, destfile = "getdata_projectfiles_UCI HAR Dataset.zip")
                
        }
        
        #Once we are sure that the zip file is available, we unzip it:
        unzip("getdata_projectfiles_UCI HAR Dataset.zip")

}        
#Note: We have done two different checks in order to save time and resources.
#Data could be in the working directory but only in its zip version. In that
#case, it should not be downloaded again.
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
#Step 1:
#Merge the training and the test sets to create one data set.

#Before we can proceed to the merge of both data sets, these must be loaded
#into R. It should be noted that both are formed by three files each, which
#we will previously unite in temporary data.frames:

#Test set:
#As we just explained, the test set is formed by the following three files:
#
#   subject_test.txt:   txt file containing 2947 obs. of 1 variable. Identifies
#                       the subject who was performing the activity for each
#                       sample.
#   y_test.txt:         txt file containing 2947 obs. of 1 variable. Identifies
#                       the activity that was being performed for each sample.
#   X_test.txt:         txt file containing 2947 obs. of 561 variables. Contains
#                       all the measurements that were carried out for each
#                       sample.

#We load each of the three files that are part of the test set:
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

#Once the files are loaded, we create the temporary "test" data.frame:
test <- data.frame(subject_test, y_test, X_test)

#Train set:
#Like the test set, the training set is formed by three files that are
#equivalent to the previous ones:
# 
#   subject_train.txt:  txt file containing 7352 obs. of 1 variable.
#   y_train.txt:        txt file containing 7352 obs. of 1 variable.
#   X_train.txt:        txt file containing 7352 obs. of 561 variables.

#We load each of the three files that are part of the training set:
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

#Once the files are loaded, we create the temporary "train" data.frame:
train <- data.frame(subject_train, y_train, X_train)

#At this point, we can finally merge both temporary data.frames to create a new
#one called "raw_data":
raw_data <- rbind(test, train)

#Note: We could have done the merge of the training and the test sets in a
#different way. We could have created three columns, one for the "subject"
#files, one more for the "y" files and a last one for the "X" files. This way,
#we would have needed three temporary data.frames but after its merge, the end
#result would have been the same.
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
#Step 2:
#Extracts only the measurements on the mean and standard deviation for each
#measurement.

#In this section, we are asked to create a new data.frame consisting in a subset
#of the original data. In particular, we are asked to select all the columns
#that contain the mean and standard deviation for each measurement. We will
#carry this out with the help of the "features.txt" file, a txt document
#containing 561 obs. of 2 variables. The first column of this file is just an
#integer index, but the second one contains the names of all the measurements
#that were carried out for each sample. That is, the names of each of the 561
#columns of the "X_test.txt" and "X_train.txt" files. Based on this, we will
#perform the desired subsetting by using the grep command applied to the names
#of the columns:

#We start by loading the file with the column names in memory:
features <- read.table("./UCI HAR Dataset/features.txt")

#We use the grep command to extract only those columns that contain the mean and
#standard deviation for each measurement. We will store the index of each
#selected column in the "columns" integer vector:
columns <- grep("[Mm]ean|[Ss]td",features[,2])

#We create a new data.frame. Its first two columns match those of raw_data (the
#first contained the subject identifier and the second, the activity performed).
#The rest of the columns will come from making a subset of the "raw_data"
#data_frame based on the "columns" vector obtained in the previous step:
data_set <- raw_data[,c(1, 2, columns + 2)]

#Note: It should be noted that the selection of columns could have been done in
#other ways. The exact wording of the problem definition was as follows:

#   Extracts only the measurements on the mean and standard deviation for each
#   measurement.

#In the "features.txt" file there are five possible places where "mean" and
#"std" appear:

#1. At the end of the variable name, preceded by a minus sign and accompanied
#   by a pair of parentheses (-mean() and -std()).
#2. Same as in the previous case, followed by another minus sign and a capital
#   letter indicating the axis (X, Y and Z).
#3. At the end of the variable name, preceded by a minus sign and accompanied
#   by the letters Freq (uppercase letter f) and a pair of parentheses (only
#   -meanFreq() appears, -stdFreq() never does).
#4. Same as in the previous case, followed by another minus sign and a capital
#   letter indicating the axis (X, Y and Z).
#5. As one of the two vectors between which the angle is being calculated. In
#   this case it does not have to be at the end of the label and is not preceded
#   by the minus sign. Only appears mean, never std, and can be recognized
#   because it starts with a capital m.

#Given the above, different calls to the grep command could be designed to
#select the cases in which we were interested. Here are some examples and the
#cases that would select each one:

#1. columns <- grep("mean|std",features[,2])
#   It selects the first four cases, but as it explicitly asks for a lowercase
#   m, it omits the last case.
#2. columns <- grep("[Mm]ean[^F]|[Ss]td[^F]",features[,2])
#   It selects cases 1, 2 and 5, but since it explicitly forbids a capital F
#   after "mean" or "std", it omits cases 3 and 4.
#3. columns <- grep("mean[^F]|std[^F]",features[,2])
#   Only select cases 1 and 2. This is because it forbids the labels from
#   starting with a capital letter (omit case 5). Also, it explicitly forbids a
#   capital F after "mean" or "std" which omits cases 3 and 4.

#Initially, we decided to apply the command of example number three and only
#select "-mean()" and "-std()" (with and without the minus sign and the axis
#letter at the end). This decision was taken after reading the
#"features_info.txt" document, in which the meaning of each variable is
#explained. But finally, we decided to choose a less restrictive option (in
#fact, the most general possible). This way, if in the future we notice that our
#decision was not correct, we could subset the file generated by our script, and
#select only the necessary columns.
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
#Step 3:
#Use descriptive activity names to name the activities in the data set.

#In this section, we are asked to update the contents of our "data_set"
#data.frame. We will carry this out with the help of the "activity_labels.txt"
#file, a txt document containing 6 obs. of 2 variables. The first column of this
#file is just an integer index, but the second one contains the names of the
#various activities that were conducted during the experiment. Using this
#information, we will substitute the original activity identifier values
#(integers between 1 and 6) by their real names:

#We start by loading the file with the activity names:
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Once loaded the names into memory, we create a new factor type variable
#containing the original activity identifier values. We assign as the labels,
#the values obtained from the "activity_labels.txt" file. And finally, we
#rewrite the data.frame column, with the updated values:
activity_names <- as.factor(data_set[,2])
levels(activity_names) <- activities[,2]
data_set[,2] <- activity_names
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
#Step 4:
#Appropriately labels the data set with descriptive variable names.

#In this step, we will label the columns that compose the "data_set" data.frame.
#The first two correspond to the subject identifier which we will call "Subject"
#and the type of activity being carried out, which we will simply call
#"Activity". For the following 86 columns, we will use a different method. We
#must remember that unlike "Subject" and "Activity" (that came directly from the
#original "raw_data" data.frame), they were generated by using the grep command
#in the step 2. Because of this, their names will be assigned by applying the
#same subsetting that was carried to the columns of the raw_data data.frame, to
#the list of variable names contained in the "features.txt" file:
names(data_set) <- c("Subject", "Activity", as.character(features[columns, 2]))
        
#Note: It should be noted that this step could have been carried out
#simultaneously to step 2. As well as that the "as.character" command is
#necessary because the labels are stored in the "features" data.frame as a
#factor type column.
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
#Step 5:
#From the data set in step 4, creates a second, independent tidy data set with
#the average of each variable for each activity and each subject.

#It is in this section, where the true data processing will occur. To do this,
#we will use the "dplyr" package that provides us with a flexible grammar for
#data manipulation. In addition to using the functions contained in the package,
#we will also use its ability to chain them:

#As we saw in the course (third week), the first step of working with the 
#"dplyr" package is to transform the data into a "tbl_df":
data_tbl <- tbl_df(data_set)

#In this case, we will group the data using as the first variable the identifier
#of the subject, and as the second the type of activity that was taking place at
#that time (it could be done in the other way). After this, using the command
#"summarise_each", we average each of the remaining columns (for each activity
#performed by each subject), which correspond to those selected in step 2:
tidy_data <- data_tbl %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

#Finally, the result of the entire process, is saved in a txt file, called
#"tidy_data.txt":
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
#-------------------------------------------------------------------------------
