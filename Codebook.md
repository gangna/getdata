Codebook
=======
A code book that describes the variables, the data, and any transformations or work.

## Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Data Transformation
The original train and test data sets were merged into a single data set as specified in the instructions.

The id variable was transformed from an integer to a factor.

The activity variable was transformed from an integer to a factor using the names in activity_labels.txt:
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING 

## Variables
* id       : Factor from 1 to 30 indicating the person
* activity : Factor with one of six values
* mean     : Mean value
* std      : Standard deviation
* '-XYZ'   : denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc (and etc): subset of the original features

Examples are as follows. 

- "tBodyAcc.std...X"                                        
- "tBodyAcc.std...Y"                               
- "tBodyAcc.std...Z" 
- "tBodyAcc.mean...X"              
- "tBodyAcc.mean...Y"                                            
- "tBodyAcc.mean...Z"                                             


