
This document is code book (data dictionary) for tiday data returned by run_analysis.R script as part of data cleansing exercise.

 Returned data frame has 81 columns where first 2 column are descriptive aggregator while remaining 79 columns are average aggregation data for key measurements. All measurements starting from column 3 to column 81 are extracted mean and standard deviation data from available dataset. Each of this measurement is averaged over aggregator for given activity label for each of subject.

#no of rows of ouput represented by #no of activities * #no of subjects. i.e. 6*30=180
#no of columms represents 1st column as activity label, 2nd column indicates subject (volunteer) and subsequent all columns are average measurements of sensor data of all mean and standard deviation readings.

Activity column
  The column represent a manually recorded activity label for each of the reading. Activity represent a state of task the subject performing has one of the following values.
   . WALKING -> Indicates activity state that subject was walking on leveled ground. Numeric 1 was used in original data set which transformed by run_analysis script.
   . WALKING_UPSTAIRS -> Indicates activity state that subject was walking upstair steps. Numeric 2 was used in original data set which transformed by run_analysis script.
   . WALKING_DOWNSTAIRS -> Indicates activity state that subject was walking down stair steps. Numeric 3 was used in original data set which transformed by run_analysis script.
   . SITTING -> Indicates activity state that subject was in sitting posture. Numeric 4 was used in original data set which transformed by run_analysis script.
   . STANDING -> Indicates activity state that subject was in standing posture. Numeric 5 was used in original data set which transformed by run_analysis script.
   . LAYING -> Indicates state that subject in sleeping posture or what we called layed down posture. Numeric 6 was used in original data set which transformed by run_analysis script.

subject column
   Experiment involved 30 volunteers who had preformed planned activity using smartphone wrap around there waist. Each of the is individual is called subject here and been identified by numeric between 1 to 30. 1 represent 1st volunteer, 2 represents 2nd colunteer and so on till 30 is represented by 30th volunteer.

Sensor measurements columns - Starting 3rd column rigth upto last column each column represent numeric value of the given measurement for the column. The values in this columns are aggregated across couple of aggregators (namely activity and subject). Every column name was built by cleansing features.txt data representing short abbrevated name for each of 561 feature. The abbrevated column names can be best described with below listed convention descriptions.
Convention / accronyms used for each of measurement columns
  . first character represent type of reading. 
	. t indicates time based reading
	. f indicates frequency based reading
  . Character string 'BodyAcc' represents one of triaxial sensor signal average reading for smartphone accelerometer.
  . Character string 'BodyGyro' represents one of triaxial sensor signal average reading for gryroscope (readings are in radians).
  . 'X', 'Y' and 'Z' character present in column name indicate readin for given axis i.e. either X-axis, Y-axis or Z-axis sensor reading from respective sensor from smart meter.
  . Presence of character string 'Gravity' indicate gravity force component used for sensor data pre processing. It is averaged one.
  . Presence of character string 'Jerk' represents that reading is for the Jerks recorded.
  . Presence of character string 'Mag' represents that reading is for the Magnitude recorded.
  . Presence of character string listed below indicate type of reading,
         . mean -> mean value of reading
         . std -> standard deviation value of reading


