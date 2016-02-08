
#This script is process the Samsung GalaxyS experimental data set. A data set was collected fom experiment involving 30 volunteers who were gives Samsung Galaxy S phone to use for specific set of activities. A pre planned activities include laying, sitting, walking, standing, walk upstairs and walking upstairs. While activities were performed a Sumaung smartphone was wraped up at wait to create event data from its accelerato meter and gyro meters. All these event data during the activities collected as tri-axis readings from acclerato meter and gyrometer of phone. Fruther this data was pre-processes scientifically using predeefined techniques and was made available for our exercise. A identical data coming from all 30 subjects was further randomly divided in training data and small subset of test data. Every activity was video recorded an labeled manually with actual actvity label i.e. standing, walking etc. 
#Below are key convention for collected data.
#Fianlly a data set available for us has transformed version of data which has 561 measurements (includes mean, median, standard deviation, max, min etc. for 3-axial accelerometer, gyro etc.). All these 561 reading instance together represent feature vector X while respective and manually recorded activities for respective reading forms a y vector. 

Assumptions,
1. Zip file is already downloaded and unziped in a directory.
2. run_analysis script is kept and run from same directory where unzip data files as listed in step 1 and then run.
3. below is directory structure which run_anlysis needs
    + features.txt
    + activity_labels.txt
    + train 
    |    |
    |    + x_train.txt
    |    + y_train.txt
    |    + subject_train.txt
    |
    + test
    |    |
    |    + x_test.txt
    |    + y_test.txt
    |    + subject_test.txt
   
    

#run_analysis function / script does following steps,
 . read features.txt to form data set features. The data is requried for geting descriptve names of columns of feature vector.
 . read activity_labels into data set activities. The data is requried for getting descriptive names for each of type of activity.
 . read X vector data from both train and test data to form integrated data set for feature vector X. feaure vector contains all measurment data for entire data set and each row has 561 different measurements.
 . read Y vector data from both train and test data to form integrated data set for manually captured activity data. Every row reading in X vector has corresponding reading of Y.
 . read subject data from train and test data to form integrated data representing subject who carried that activity.
 . Extracts all mean and standard deviation process data for feature vector.
 . Based on column index for mean and standard deviation from features apply name correction for feature. Correction rule applied is remove '-', '(' and ')' characters.
 . Create updated feature vector filtering the requried columns of mean and standard deviation.
 . Update column name correction on feature vector by updating column names with corrected name.
 . Update Y / activity vector with decriptive name of activity using table join with activity vector. "V1" column is used as linked key between activity vector table and Y activity table.
 . Correct column name labels for activity and subject vector.
 . Create new tidy data table with final correct data aggregated with all measurements been averaged using activity and subject as aggregator. 
 . Return tidy data frame.


