
#run_analysis function / script does following steps,
# 1. unzip data files for Samung GalaxyS experiment mobile 
# 2. Create data frame from all training and test feed based on the files.
# 3. Extracts all mean and standard deviation process data for feature
#    vectors from both training and test data in collection data frame.
# 4. Merge all training and test data for following data,
#      a. xfeature (feature vector X)
#      b. yactivity (Activity label code vector Y for corresponding vector X)
#      c. subject (Subject vector mapping to feature vector and activity vector.)
# 5. Rename each of measurement column of feature, activity label and subject vector.
# 6. Create resultant additional vector representing tidy data set for,
#      a. mesaurements averaged by each activity and subject.
# 7. Return tidy vector.

library(plyr)

run_analysis <- function(){
  bdir <- "data/data/"
  traindir <- paste(bdir,"train/",sep="")
  testdir <- paste(bdir,"test/",sep="")
  
  train <- NULL
  test <- NULL
  
  features <- getFeatures(bdir)
  activitylabels <- getActivityLabels(bdir)

  #Read & merge train and test data for feature vector x
  data.xfeatures <- rbind(
    getTrainData(traindir,"x_train.txt"),
    getTestData(testdir,"x_test.txt")
  )

  #Read & merge train and test data for activity vector x
  data.yactivity <- rbind(
    getTrainData(traindir,"y_train.txt"),
    getTestData(testdir,"y_test.txt")
  )
  
  #Read & merge train and test data for subject vector x
  data.subject <- rbind(
    getTrainData(traindir,"subject_train.txt"),
    getTestData(testdir,"subject_test.txt")
  )
  
  #filter index of columns havin mean or std from x feature vector
  colindex <- features[grep("mean|std",V2),V1]
  #correct names of column by removing '-','(','')' char
  correctednames <- mutate(features[colindex,],name=gsub("[-()]","",V2))
  data.xfeatures <- tbl_df(data.xfeatures)
  #Using index filter requried columns
  data.xfeatures <- data.xfeatures[,colindex]
  #Correct names of columns in feature vector
  colnames(data.xfeatures) <- as.character(correctednames[,name])
  
  #update activity table y with acctivity name label
  data.yactivity <- join(data.yactivity,activitylabels,by="V1")
  data.yactivity <- subset(data.yactivity,select = c("V2"))
  
  #column name for activity vector
  colnames(data.yactivity) <- c("activitylabel")
  
  #column name for subject vector
  colnames(data.subject) <- c("subject")
  
  #Create tidy data
  data.clean <- aggregate(x=data.xfeatures,
                          by=c(activity=data.yactivity,subject=data.subject),
                          FUN=mean)
  
  
  #list(features,activitylabels,
  #     train.xfeatures,train.yactivity,train.subject,
  #     test.xfeatures,test.yactivity,test.subject)
  
  #list(features,activitylabels,data.xfeatures,data.yactivity)
       
}

#function to read feature description data
#arg is directory for reading features.txt
#returns data frame with festures data
getFeatures <- function( bdir = "UCI\ HAR\ Dataset/"){
  fread(paste(bdir,"features.txt",sep=""))
}

#function to read activity label data
#arg is directory for reading activity_labels.txt
#returns data frame with activity label data
getActivityLabels <- function( bdir = "UCI\ HAR\ Dataset/"){
  fread(paste(bdir,"activity_labels.txt",sep=""))
}

#function to read given file from train data directory
# arg 1st is directory from where files is to be read
# arg 2nd is file to be readed
# returns the data frame with file from train data.
getTrainData <- function( bdir = "UCI\ HAR\ Dataset/train/", fl = ""){
  flpath <- paste(bdir,fl,sep="");
  #message(flpath)
  #fread(paste(bdir,fl,sep=""))
  fread(flpath)
}

#function to read given file from test data directory
# arg 1st is directory from where files is to be read
# arg 2nd is file to be readed
# returns the data frame with file from test data.
getTestData <- function( bdir = "UCI\ HAR\ Dataset/test/", fl = ""){
  flpath <- paste(bdir,fl,sep="");
  #message("reading " + flpath)
  #fread(paste(bdir,fl,sep=""))
  fread(flpath)
}

