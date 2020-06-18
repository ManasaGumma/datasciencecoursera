
R version 4.0.0 (2020-04-24) -- "Arbor Day"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: i386-w64-mingw32/i386 (32-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> dir()
[1] "desktop.ini"            "My Music"               "My Pictures"           
[4] "My Videos"              "Picture Motion Browser" "R"                     
[7] "UCI HAR Dataset"        "Zoom"                  
> setwd("UCI HAR Dataset")
> dir()
[1] "activity_labels.txt" "features.txt"        "features_info.txt"  
[4] "README.txt"          "test"                "train"              
> features<-read.table("features.txt",col.names=c("n","functions"))
> activities<-read.table("activity_labels.txt",col.names=c("code","activity"))
> subject_test<-read.table("test/subject_test.txt",col.names="subject")
> x_test<-read.table("test/X_test.txt",col.names=features$functions)
> y_test<-read.table("test/y_test.txt",col.names="code")
> subject_train<-read.table("train/subject_train.txt",col.names="subject")
> x_train<-read.table("train/X_train.txt",col.names=features$functions)
> y_train<-read.table("train/y_train.txt",col.names="code")
> 
> X<-rbind(x_train,x_test)
> Y<-rbind(y_train,y_test)
> Subject<-rbind(subject_train,subject_test)
> Merged_Data<-cbind(Subject,X,Y)
> TidyData<-Merged_Data %>% select(subject,code,contains("mean"),contains("std"))
> TidyData$code<-activities(TidyData$code,2)
Error in activities(TidyData$code, 2) : 
  could not find function "activities"
> TidyData$code<-activities[TidyData$code,2]
> names(TidyData)[2]="activity"
> names(TidyData)[2]<-gsub("Acc","Accelerometer",names(TidyData))
Warning message:
In names(TidyData)[2] <- gsub("Acc", "Accelerometer", names(TidyData)) :
  number of items to replace is not a multiple of replacement length
> names(TidyData)<-gsub("Acc","Accelerometer",names(TidyData))
> names(TidyData)<-gsub("Gyro","Gyroscope",names(TidyData))
> names(TidyData)<-gsub("BodyBody","Body",names(TidyData))
> names(TidyData)<-gsub("Mag","Magnitude",names(TidyData))
> names(TidyData)<-gsub("^t","Time",names(TidyData))
> names(TidyData)<-gsub("^f","Frequency",names(TidyData))
> names(TidyData)<-gsub("tBody","TimeBody",names(TidyData))
> names(TidyData)<-gsub("-mean()","Mean",names(TidyData))
> names(TidyData)<-gsub("-std()","STD",names(TidyData))
> names(TidyData)<-gsub("-freq()","Frequency",names(TidyData))
> names(TidyData)<-gsub("angle","Angle",names(TidyData))
> names(TidyData)<-gsub("angle","Angle",names(TidyData))
> 
> 
> 
> 
> 
> names(TidyData)<-gsub("gravity","Gravity",names(TidyData))
> FinalData<-TidyData%>%group_by(subject,activity)%>%summarise_all(funs(mean))
Error: Must group by variables found in `.data`.
* Column `activity` is not found.
Run `rlang::last_error()` to see where the error occurred.
> names(TidyData)
 [1] "subject"                                           
 [2] "subject"                                           
 [3] "TimeBodyAccelerometer.mean...X"                    
 [4] "TimeBodyAccelerometer.mean...Y"                    
 [5] "TimeBodyAccelerometer.mean...Z"                    
 [6] "TimeGravityAccelerometer.mean...X"                 
 [7] "TimeGravityAccelerometer.mean...Y"                 
 [8] "TimeGravityAccelerometer.mean...Z"                 
 [9] "TimeBodyAccelerometerJerk.mean...X"                
[10] "TimeBodyAccelerometerJerk.mean...Y"                
[11] "TimeBodyAccelerometerJerk.mean...Z"                
[12] "TimeBodyGyroscope.mean...X"                        
[13] "TimeBodyGyroscope.mean...Y"                        
[14] "TimeBodyGyroscope.mean...Z"                        
[15] "TimeBodyGyroscopeJerk.mean...X"                    
[16] "TimeBodyGyroscopeJerk.mean...Y"                    
[17] "TimeBodyGyroscopeJerk.mean...Z"                    
[18] "TimeBodyAccelerometerMagnitude.mean.."             
[19] "TimeGravityAccelerometerMagnitude.mean.."          
[20] "TimeBodyAccelerometerJerkMagnitude.mean.."         
[21] "TimeBodyGyroscopeMagnitude.mean.."                 
[22] "TimeBodyGyroscopeJerkMagnitude.mean.."             
[23] "FrequencyBodyAccelerometer.mean...X"               
[24] "FrequencyBodyAccelerometer.mean...Y"               
[25] "FrequencyBodyAccelerometer.mean...Z"               
[26] "FrequencyBodyAccelerometer.meanFreq...X"           
[27] "FrequencyBodyAccelerometer.meanFreq...Y"           
[28] "FrequencyBodyAccelerometer.meanFreq...Z"           
[29] "FrequencyBodyAccelerometerJerk.mean...X"           
[30] "FrequencyBodyAccelerometerJerk.mean...Y"           
[31] "FrequencyBodyAccelerometerJerk.mean...Z"           
[32] "FrequencyBodyAccelerometerJerk.meanFreq...X"       
[33] "FrequencyBodyAccelerometerJerk.meanFreq...Y"       
[34] "FrequencyBodyAccelerometerJerk.meanFreq...Z"       
[35] "FrequencyBodyGyroscope.mean...X"                   
[36] "FrequencyBodyGyroscope.mean...Y"                   
[37] "FrequencyBodyGyroscope.mean...Z"                   
[38] "FrequencyBodyGyroscope.meanFreq...X"               
[39] "FrequencyBodyGyroscope.meanFreq...Y"               
[40] "FrequencyBodyGyroscope.meanFreq...Z"               
[41] "FrequencyBodyAccelerometerMagnitude.mean.."        
[42] "FrequencyBodyAccelerometerMagnitude.meanFreq.."    
[43] "FrequencyBodyAccelerometerJerkMagnitude.mean.."    
[44] "FrequencyBodyAccelerometerJerkMagnitude.meanFreq.."
[45] "FrequencyBodyGyroscopeMagnitude.mean.."            
[46] "FrequencyBodyGyroscopeMagnitude.meanFreq.."        
[47] "FrequencyBodyGyroscopeJerkMagnitude.mean.."        
[48] "FrequencyBodyGyroscopeJerkMagnitude.meanFreq.."    
[49] "Angle.TimeBodyAccelerometerMean.Gravity."          
[50] "Angle.TimeBodyAccelerometerJerkMean..GravityMean." 
[51] "Angle.TimeBodyGyroscopeMean.GravityMean."          
[52] "Angle.TimeBodyGyroscopeJerkMean.GravityMean."      
[53] "Angle.X.GravityMean."                              
[54] "Angle.Y.GravityMean."                              
[55] "Angle.Z.GravityMean."                              
[56] "TimeBodyAccelerometer.std...X"                     
[57] "TimeBodyAccelerometer.std...Y"                     
[58] "TimeBodyAccelerometer.std...Z"                     
[59] "TimeGravityAccelerometer.std...X"                  
[60] "TimeGravityAccelerometer.std...Y"                  
[61] "TimeGravityAccelerometer.std...Z"                  
[62] "TimeBodyAccelerometerJerk.std...X"                 
[63] "TimeBodyAccelerometerJerk.std...Y"                 
[64] "TimeBodyAccelerometerJerk.std...Z"                 
[65] "TimeBodyGyroscope.std...X"                         
[66] "TimeBodyGyroscope.std...Y"                         
[67] "TimeBodyGyroscope.std...Z"                         
[68] "TimeBodyGyroscopeJerk.std...X"                     
[69] "TimeBodyGyroscopeJerk.std...Y"                     
[70] "TimeBodyGyroscopeJerk.std...Z"                     
[71] "TimeBodyAccelerometerMagnitude.std.."              
[72] "TimeGravityAccelerometerMagnitude.std.."           
[73] "TimeBodyAccelerometerJerkMagnitude.std.."          
[74] "TimeBodyGyroscopeMagnitude.std.."                  
[75] "TimeBodyGyroscopeJerkMagnitude.std.."              
[76] "FrequencyBodyAccelerometer.std...X"                
[77] "FrequencyBodyAccelerometer.std...Y"                
[78] "FrequencyBodyAccelerometer.std...Z"                
[79] "FrequencyBodyAccelerometerJerk.std...X"            
[80] "FrequencyBodyAccelerometerJerk.std...Y"            
[81] "FrequencyBodyAccelerometerJerk.std...Z"            
[82] "FrequencyBodyGyroscope.std...X"                    
[83] "FrequencyBodyGyroscope.std...Y"                    
[84] "FrequencyBodyGyroscope.std...Z"                    
[85] "FrequencyBodyAccelerometerMagnitude.std.."         
[86] "FrequencyBodyAccelerometerJerkMagnitude.std.."     
[87] "FrequencyBodyGyroscopeMagnitude.std.."             
[88] "FrequencyBodyGyroscopeJerkMagnitude.std.."         
> FinalData<-TidyData%>%group_by(subject,subject)%>%summarise_all(funs(mean))
Error: Column name `subject` must not be duplicated.
Run `rlang::last_error()` to see where the error occurred.
> names(TidyData)[2]="activity"
> names(TidyData)[2]->"activity"
> names(TidyData)
 [1] "subject"                                           
 [2] "activity"                                          
 [3] "TimeBodyAccelerometer.mean...X"                    
 [4] "TimeBodyAccelerometer.mean...Y"                    
 [5] "TimeBodyAccelerometer.mean...Z"                    
 [6] "TimeGravityAccelerometer.mean...X"                 
 [7] "TimeGravityAccelerometer.mean...Y"                 
 [8] "TimeGravityAccelerometer.mean...Z"                 
 [9] "TimeBodyAccelerometerJerk.mean...X"                
[10] "TimeBodyAccelerometerJerk.mean...Y"                
[11] "TimeBodyAccelerometerJerk.mean...Z"                
[12] "TimeBodyGyroscope.mean...X"                        
[13] "TimeBodyGyroscope.mean...Y"                        
[14] "TimeBodyGyroscope.mean...Z"                        
[15] "TimeBodyGyroscopeJerk.mean...X"                    
[16] "TimeBodyGyroscopeJerk.mean...Y"                    
[17] "TimeBodyGyroscopeJerk.mean...Z"                    
[18] "TimeBodyAccelerometerMagnitude.mean.."             
[19] "TimeGravityAccelerometerMagnitude.mean.."          
[20] "TimeBodyAccelerometerJerkMagnitude.mean.."         
[21] "TimeBodyGyroscopeMagnitude.mean.."                 
[22] "TimeBodyGyroscopeJerkMagnitude.mean.."             
[23] "FrequencyBodyAccelerometer.mean...X"               
[24] "FrequencyBodyAccelerometer.mean...Y"               
[25] "FrequencyBodyAccelerometer.mean...Z"               
[26] "FrequencyBodyAccelerometer.meanFreq...X"           
[27] "FrequencyBodyAccelerometer.meanFreq...Y"           
[28] "FrequencyBodyAccelerometer.meanFreq...Z"           
[29] "FrequencyBodyAccelerometerJerk.mean...X"           
[30] "FrequencyBodyAccelerometerJerk.mean...Y"           
[31] "FrequencyBodyAccelerometerJerk.mean...Z"           
[32] "FrequencyBodyAccelerometerJerk.meanFreq...X"       
[33] "FrequencyBodyAccelerometerJerk.meanFreq...Y"       
[34] "FrequencyBodyAccelerometerJerk.meanFreq...Z"       
[35] "FrequencyBodyGyroscope.mean...X"                   
[36] "FrequencyBodyGyroscope.mean...Y"                   
[37] "FrequencyBodyGyroscope.mean...Z"                   
[38] "FrequencyBodyGyroscope.meanFreq...X"               
[39] "FrequencyBodyGyroscope.meanFreq...Y"               
[40] "FrequencyBodyGyroscope.meanFreq...Z"               
[41] "FrequencyBodyAccelerometerMagnitude.mean.."        
[42] "FrequencyBodyAccelerometerMagnitude.meanFreq.."    
[43] "FrequencyBodyAccelerometerJerkMagnitude.mean.."    
[44] "FrequencyBodyAccelerometerJerkMagnitude.meanFreq.."
[45] "FrequencyBodyGyroscopeMagnitude.mean.."            
[46] "FrequencyBodyGyroscopeMagnitude.meanFreq.."        
[47] "FrequencyBodyGyroscopeJerkMagnitude.mean.."        
[48] "FrequencyBodyGyroscopeJerkMagnitude.meanFreq.."    
[49] "Angle.TimeBodyAccelerometerMean.Gravity."          
[50] "Angle.TimeBodyAccelerometerJerkMean..GravityMean." 
[51] "Angle.TimeBodyGyroscopeMean.GravityMean."          
[52] "Angle.TimeBodyGyroscopeJerkMean.GravityMean."      
[53] "Angle.X.GravityMean."                              
[54] "Angle.Y.GravityMean."                              
[55] "Angle.Z.GravityMean."                              
[56] "TimeBodyAccelerometer.std...X"                     
[57] "TimeBodyAccelerometer.std...Y"                     
[58] "TimeBodyAccelerometer.std...Z"                     
[59] "TimeGravityAccelerometer.std...X"                  
[60] "TimeGravityAccelerometer.std...Y"                  
[61] "TimeGravityAccelerometer.std...Z"                  
[62] "TimeBodyAccelerometerJerk.std...X"                 
[63] "TimeBodyAccelerometerJerk.std...Y"                 
[64] "TimeBodyAccelerometerJerk.std...Z"                 
[65] "TimeBodyGyroscope.std...X"                         
[66] "TimeBodyGyroscope.std...Y"                         
[67] "TimeBodyGyroscope.std...Z"                         
[68] "TimeBodyGyroscopeJerk.std...X"                     
[69] "TimeBodyGyroscopeJerk.std...Y"                     
[70] "TimeBodyGyroscopeJerk.std...Z"                     
[71] "TimeBodyAccelerometerMagnitude.std.."              
[72] "TimeGravityAccelerometerMagnitude.std.."           
[73] "TimeBodyAccelerometerJerkMagnitude.std.."          
[74] "TimeBodyGyroscopeMagnitude.std.."                  
[75] "TimeBodyGyroscopeJerkMagnitude.std.."              
[76] "FrequencyBodyAccelerometer.std...X"                
[77] "FrequencyBodyAccelerometer.std...Y"                
[78] "FrequencyBodyAccelerometer.std...Z"                
[79] "FrequencyBodyAccelerometerJerk.std...X"            
[80] "FrequencyBodyAccelerometerJerk.std...Y"            
[81] "FrequencyBodyAccelerometerJerk.std...Z"            
[82] "FrequencyBodyGyroscope.std...X"                    
[83] "FrequencyBodyGyroscope.std...Y"                    
[84] "FrequencyBodyGyroscope.std...Z"                    
[85] "FrequencyBodyAccelerometerMagnitude.std.."         
[86] "FrequencyBodyAccelerometerJerkMagnitude.std.."     
[87] "FrequencyBodyGyroscopeMagnitude.std.."             
[88] "FrequencyBodyGyroscopeJerkMagnitude.std.."         
> FinalData<-TidyData%>%group_by(subject,activity)%>%summarise_all(funs(mean))
Warning message:
`funs()` is deprecated as of dplyr 0.8.0.
Please use a list of either functions or lambdas: 

  # Simple named list: 
  list(mean = mean, median = median)

  # Auto named with `tibble::lst()`: 
  tibble::lst(mean, median)

  # Using lambdas
  list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
This warning is displayed once every 8 hours.
Call `lifecycle::last_warnings()` to see where this warning was generated. 
> tibble::lst()
named list()
> FinalData<-TidyData%>%group_by(subject,activity)%>%summarise_all(funs(mean))
> write.table(FinalData,"FinalData.txt",row.name=FALSE)
> str(FinalData)
tibble [180 x 88] (S3: grouped_df/tbl_df/tbl/data.frame)
 $ subject                                           : int [1:180] 1 1 1 1 1 1 2 2 2 2 ...
 $ activity                                          : chr [1:180] "LAYING" "SITTING" "STANDING" "WALKING" ...
 $ TimeBodyAccelerometer.mean...X                    : num [1:180] 0.222 0.261 0.279 0.277 0.289 ...
 $ TimeBodyAccelerometer.mean...Y                    : num [1:180] -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 $ TimeBodyAccelerometer.mean...Z                    : num [1:180] -0.113 -0.105 -0.111 -0.111 -0.108 ...
 $ TimeGravityAccelerometer.mean...X                 : num [1:180] -0.249 0.832 0.943 0.935 0.932 ...
 $ TimeGravityAccelerometer.mean...Y                 : num [1:180] 0.706 0.204 -0.273 -0.282 -0.267 ...
 $ TimeGravityAccelerometer.mean...Z                 : num [1:180] 0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 $ TimeBodyAccelerometerJerk.mean...X                : num [1:180] 0.0811 0.0775 0.0754 0.074 0.0542 ...
 $ TimeBodyAccelerometerJerk.mean...Y                : num [1:180] 0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 $ TimeBodyAccelerometerJerk.mean...Z                : num [1:180] 0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 $ TimeBodyGyroscope.mean...X                        : num [1:180] -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 $ TimeBodyGyroscope.mean...Y                        : num [1:180] -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ TimeBodyGyroscope.mean...Z                        : num [1:180] 0.1487 0.0629 0.0748 0.0849 0.0901 ...
 $ TimeBodyGyroscopeJerk.mean...X                    : num [1:180] -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ TimeBodyGyroscopeJerk.mean...Y                    : num [1:180] -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ TimeBodyGyroscopeJerk.mean...Z                    : num [1:180] -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 $ TimeBodyAccelerometerMagnitude.mean..             : num [1:180] -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ TimeGravityAccelerometerMagnitude.mean..          : num [1:180] -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ TimeBodyAccelerometerJerkMagnitude.mean..         : num [1:180] -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ TimeBodyGyroscopeMagnitude.mean..                 : num [1:180] -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ TimeBodyGyroscopeJerkMagnitude.mean..             : num [1:180] -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ FrequencyBodyAccelerometer.mean...X               : num [1:180] -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 $ FrequencyBodyAccelerometer.mean...Y               : num [1:180] -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 $ FrequencyBodyAccelerometer.mean...Z               : num [1:180] -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ FrequencyBodyAccelerometer.meanFreq...X           : num [1:180] -0.1588 -0.0495 0.0865 -0.2075 -0.3074 ...
 $ FrequencyBodyAccelerometer.meanFreq...Y           : num [1:180] 0.0975 0.0759 0.1175 0.1131 0.0632 ...
 $ FrequencyBodyAccelerometer.meanFreq...Z           : num [1:180] 0.0894 0.2388 0.2449 0.0497 0.2943 ...
 $ FrequencyBodyAccelerometerJerk.mean...X           : num [1:180] -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 $ FrequencyBodyAccelerometerJerk.mean...Y           : num [1:180] -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 $ FrequencyBodyAccelerometerJerk.mean...Z           : num [1:180] -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ FrequencyBodyAccelerometerJerk.meanFreq...X       : num [1:180] 0.132 0.257 0.314 -0.209 -0.253 ...
 $ FrequencyBodyAccelerometerJerk.meanFreq...Y       : num [1:180] 0.0245 0.0475 0.0392 -0.3862 -0.3376 ...
 $ FrequencyBodyAccelerometerJerk.meanFreq...Z       : num [1:180] 0.02439 0.09239 0.13858 -0.18553 0.00937 ...
 $ FrequencyBodyGyroscope.mean...X                   : num [1:180] -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ FrequencyBodyGyroscope.mean...Y                   : num [1:180] -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 $ FrequencyBodyGyroscope.mean...Z                   : num [1:180] -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 $ FrequencyBodyGyroscope.meanFreq...X               : num [1:180] -0.00355 0.18915 -0.12029 0.01478 -0.10045 ...
 $ FrequencyBodyGyroscope.meanFreq...Y               : num [1:180] -0.0915 0.0631 -0.0447 -0.0658 0.0826 ...
 $ FrequencyBodyGyroscope.meanFreq...Z               : num [1:180] 0.010458 -0.029784 0.100608 0.000773 -0.075676 ...
 $ FrequencyBodyAccelerometerMagnitude.mean..        : num [1:180] -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ FrequencyBodyAccelerometerMagnitude.meanFreq..    : num [1:180] 0.0864 0.2367 0.2846 0.1906 0.1192 ...
 $ FrequencyBodyAccelerometerJerkMagnitude.mean..    : num [1:180] -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ FrequencyBodyAccelerometerJerkMagnitude.meanFreq..: num [1:180] 0.2664 0.3519 0.4222 0.0938 0.0765 ...
 $ FrequencyBodyGyroscopeMagnitude.mean..            : num [1:180] -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ FrequencyBodyGyroscopeMagnitude.meanFreq..        : num [1:180] -0.139775 -0.000262 -0.028606 0.268844 0.349614 ...
 $ FrequencyBodyGyroscopeJerkMagnitude.mean..        : num [1:180] -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ FrequencyBodyGyroscopeJerkMagnitude.meanFreq..    : num [1:180] 0.176 0.185 0.334 0.191 0.19 ...
 $ Angle.TimeBodyAccelerometerMean.Gravity.          : num [1:180] 0.021366 0.027442 -0.000222 0.060454 -0.002695 ...
 $ Angle.TimeBodyAccelerometerJerkMean..GravityMean. : num [1:180] 0.00306 0.02971 0.02196 -0.00793 0.08993 ...
 $ Angle.TimeBodyGyroscopeMean.GravityMean.          : num [1:180] -0.00167 0.0677 -0.03379 0.01306 0.06334 ...
 $ Angle.TimeBodyGyroscopeJerkMean.GravityMean.      : num [1:180] 0.0844 -0.0649 -0.0279 -0.0187 -0.04 ...
 $ Angle.X.GravityMean.                              : num [1:180] 0.427 -0.591 -0.743 -0.729 -0.744 ...
 $ Angle.Y.GravityMean.                              : num [1:180] -0.5203 -0.0605 0.2702 0.277 0.2672 ...
 $ Angle.Z.GravityMean.                              : num [1:180] -0.3524 -0.218 0.0123 0.0689 0.065 ...
 $ TimeBodyAccelerometer.std...X                     : num [1:180] -0.928 -0.977 -0.996 -0.284 0.03 ...
 $ TimeBodyAccelerometer.std...Y                     : num [1:180] -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 $ TimeBodyAccelerometer.std...Z                     : num [1:180] -0.826 -0.94 -0.98 -0.26 -0.23 ...
 $ TimeGravityAccelerometer.std...X                  : num [1:180] -0.897 -0.968 -0.994 -0.977 -0.951 ...
 $ TimeGravityAccelerometer.std...Y                  : num [1:180] -0.908 -0.936 -0.981 -0.971 -0.937 ...
 $ TimeGravityAccelerometer.std...Z                  : num [1:180] -0.852 -0.949 -0.976 -0.948 -0.896 ...
 $ TimeBodyAccelerometerJerk.std...X                 : num [1:180] -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ TimeBodyAccelerometerJerk.std...Y                 : num [1:180] -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ TimeBodyAccelerometerJerk.std...Z                 : num [1:180] -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ TimeBodyGyroscope.std...X                         : num [1:180] -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ TimeBodyGyroscope.std...Y                         : num [1:180] -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ TimeBodyGyroscope.std...Z                         : num [1:180] -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ TimeBodyGyroscopeJerk.std...X                     : num [1:180] -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ TimeBodyGyroscopeJerk.std...Y                     : num [1:180] -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ TimeBodyGyroscopeJerk.std...Z                     : num [1:180] -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ TimeBodyAccelerometerMagnitude.std..              : num [1:180] -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ TimeGravityAccelerometerMagnitude.std..           : num [1:180] -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ TimeBodyAccelerometerJerkMagnitude.std..          : num [1:180] -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ TimeBodyGyroscopeMagnitude.std..                  : num [1:180] -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ TimeBodyGyroscopeJerkMagnitude.std..              : num [1:180] -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ FrequencyBodyAccelerometer.std...X                : num [1:180] -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 $ FrequencyBodyAccelerometer.std...Y                : num [1:180] -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ FrequencyBodyAccelerometer.std...Z                : num [1:180] -0.813 -0.934 -0.978 -0.28 -0.298 ...
 $ FrequencyBodyAccelerometerJerk.std...X            : num [1:180] -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 $ FrequencyBodyAccelerometerJerk.std...Y            : num [1:180] -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ FrequencyBodyAccelerometerJerk.std...Z            : num [1:180] -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ FrequencyBodyGyroscope.std...X                    : num [1:180] -0.882 -0.978 -0.987 -0.517 -0.495 ...
 $ FrequencyBodyGyroscope.std...Y                    : num [1:180] -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 $ FrequencyBodyGyroscope.std...Z                    : num [1:180] -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ FrequencyBodyAccelerometerMagnitude.std..         : num [1:180] -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ FrequencyBodyAccelerometerJerkMagnitude.std..     : num [1:180] -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ FrequencyBodyGyroscopeMagnitude.std..             : num [1:180] -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ FrequencyBodyGyroscopeJerkMagnitude.std..         : num [1:180] -0.933 -0.987 -0.995 -0.382 -0.392 ...
 - attr(*, "groups")= tibble [30 x 2] (S3: tbl_df/tbl/data.frame)
  ..$ subject: int [1:30] 1 2 3 4 5 6 7 8 9 10 ...
  ..$ .rows  : list<int> [1:30] 
  .. ..$ : int [1:6] 1 2 3 4 5 6
  .. ..$ : int [1:6] 7 8 9 10 11 12
  .. ..$ : int [1:6] 13 14 15 16 17 18
  .. ..$ : int [1:6] 19 20 21 22 23 24
  .. ..$ : int [1:6] 25 26 27 28 29 30
  .. ..$ : int [1:6] 31 32 33 34 35 36
  .. ..$ : int [1:6] 37 38 39 40 41 42
  .. ..$ : int [1:6] 43 44 45 46 47 48
  .. ..$ : int [1:6] 49 50 51 52 53 54
  .. ..$ : int [1:6] 55 56 57 58 59 60
  .. ..$ : int [1:6] 61 62 63 64 65 66
  .. ..$ : int [1:6] 67 68 69 70 71 72
  .. ..$ : int [1:6] 73 74 75 76 77 78
  .. ..$ : int [1:6] 79 80 81 82 83 84
  .. ..$ : int [1:6] 85 86 87 88 89 90
  .. ..$ : int [1:6] 91 92 93 94 95 96
  .. ..$ : int [1:6] 97 98 99 100 101 102
  .. ..$ : int [1:6] 103 104 105 106 107 108
  .. ..$ : int [1:6] 109 110 111 112 113 114
  .. ..$ : int [1:6] 115 116 117 118 119 120
  .. ..$ : int [1:6] 121 122 123 124 125 126
  .. ..$ : int [1:6] 127 128 129 130 131 132
  .. ..$ : int [1:6] 133 134 135 136 137 138
  .. ..$ : int [1:6] 139 140 141 142 143 144
  .. ..$ : int [1:6] 145 146 147 148 149 150
  .. ..$ : int [1:6] 151 152 153 154 155 156
  .. ..$ : int [1:6] 157 158 159 160 161 162
  .. ..$ : int [1:6] 163 164 165 166 167 168
  .. ..$ : int [1:6] 169 170 171 172 173 174
  .. ..$ : int [1:6] 175 176 177 178 179 180
  .. ..@ ptype: int(0) 
  ..- attr(*, ".drop")= logi TRUE
> Final
Error: object 'Final' not found
> FinalData
# A tibble: 180 x 88
# Groups:   subject [30]
   subject activity TimeBodyAcceler~ TimeBodyAcceler~ TimeBodyAcceler~
     <int> <chr>               <dbl>            <dbl>            <dbl>
 1       1 LAYING              0.222         -0.0405           -0.113 
 2       1 SITTING             0.261         -0.00131          -0.105 
 3       1 STANDING            0.279         -0.0161           -0.111 
 4       1 WALKING             0.277         -0.0174           -0.111 
 5       1 WALKING~            0.289         -0.00992          -0.108 
 6       1 WALKING~            0.255         -0.0240           -0.0973
 7       2 LAYING              0.281         -0.0182           -0.107 
 8       2 SITTING             0.277         -0.0157           -0.109 
 9       2 STANDING            0.278         -0.0184           -0.106 
10       2 WALKING             0.276         -0.0186           -0.106 
# ... with 170 more rows, and 83 more variables:
#   TimeGravityAccelerometer.mean...X <dbl>,
#   TimeGravityAccelerometer.mean...Y <dbl>,
#   TimeGravityAccelerometer.mean...Z <dbl>,
#   TimeBodyAccelerometerJerk.mean...X <dbl>,
#   TimeBodyAccelerometerJerk.mean...Y <dbl>,
#   TimeBodyAccelerometerJerk.mean...Z <dbl>, TimeBodyGyroscope.mean...X <dbl>,
#   TimeBodyGyroscope.mean...Y <dbl>, TimeBodyGyroscope.mean...Z <dbl>,
#   TimeBodyGyroscopeJerk.mean...X <dbl>, TimeBodyGyroscopeJerk.mean...Y <dbl>,
#   TimeBodyGyroscopeJerk.mean...Z <dbl>,
#   TimeBodyAccelerometerMagnitude.mean.. <dbl>,
#   TimeGravityAccelerometerMagnitude.mean.. <dbl>,
#   TimeBodyAccelerometerJerkMagnitude.mean.. <dbl>,
#   TimeBodyGyroscopeMagnitude.mean.. <dbl>,
#   TimeBodyGyroscopeJerkMagnitude.mean.. <dbl>,
#   FrequencyBodyAccelerometer.mean...X <dbl>,
#   FrequencyBodyAccelerometer.mean...Y <dbl>,
#   FrequencyBodyAccelerometer.mean...Z <dbl>,
#   FrequencyBodyAccelerometer.meanFreq...X <dbl>,
#   FrequencyBodyAccelerometer.meanFreq...Y <dbl>,
#   FrequencyBodyAccelerometer.meanFreq...Z <dbl>,
#   FrequencyBodyAccelerometerJerk.mean...X <dbl>,
#   FrequencyBodyAccelerometerJerk.mean...Y <dbl>,
#   FrequencyBodyAccelerometerJerk.mean...Z <dbl>,
#   FrequencyBodyAccelerometerJerk.meanFreq...X <dbl>,
#   FrequencyBodyAccelerometerJerk.meanFreq...Y <dbl>,
#   FrequencyBodyAccelerometerJerk.meanFreq...Z <dbl>,
#   FrequencyBodyGyroscope.mean...X <dbl>,
#   FrequencyBodyGyroscope.mean...Y <dbl>,
#   FrequencyBodyGyroscope.mean...Z <dbl>,
#   FrequencyBodyGyroscope.meanFreq...X <dbl>,
#   FrequencyBodyGyroscope.meanFreq...Y <dbl>,
#   FrequencyBodyGyroscope.meanFreq...Z <dbl>,
#   FrequencyBodyAccelerometerMagnitude.mean.. <dbl>,
#   FrequencyBodyAccelerometerMagnitude.meanFreq.. <dbl>,
#   FrequencyBodyAccelerometerJerkMagnitude.mean.. <dbl>,
#   FrequencyBodyAccelerometerJerkMagnitude.meanFreq.. <dbl>,
#   FrequencyBodyGyroscopeMagnitude.mean.. <dbl>,
#   FrequencyBodyGyroscopeMagnitude.meanFreq.. <dbl>,
#   FrequencyBodyGyroscopeJerkMagnitude.mean.. <dbl>,
#   FrequencyBodyGyroscopeJerkMagnitude.meanFreq.. <dbl>,
#   Angle.TimeBodyAccelerometerMean.Gravity. <dbl>,
#   Angle.TimeBodyAccelerometerJerkMean..GravityMean. <dbl>,
#   Angle.TimeBodyGyroscopeMean.GravityMean. <dbl>,
#   Angle.TimeBodyGyroscopeJerkMean.GravityMean. <dbl>,
#   Angle.X.GravityMean. <dbl>, Angle.Y.GravityMean. <dbl>,
#   Angle.Z.GravityMean. <dbl>, TimeBodyAccelerometer.std...X <dbl>,
#   TimeBodyAccelerometer.std...Y <dbl>, TimeBodyAccelerometer.std...Z <dbl>,
#   TimeGravityAccelerometer.std...X <dbl>,
#   TimeGravityAccelerometer.std...Y <dbl>,
#   TimeGravityAccelerometer.std...Z <dbl>,
#   TimeBodyAccelerometerJerk.std...X <dbl>,
#   TimeBodyAccelerometerJerk.std...Y <dbl>,
#   TimeBodyAccelerometerJerk.std...Z <dbl>, TimeBodyGyroscope.std...X <dbl>,
#   TimeBodyGyroscope.std...Y <dbl>, TimeBodyGyroscope.std...Z <dbl>,
#   TimeBodyGyroscopeJerk.std...X <dbl>, TimeBodyGyroscopeJerk.std...Y <dbl>,
#   TimeBodyGyroscopeJerk.std...Z <dbl>,
#   TimeBodyAccelerometerMagnitude.std.. <dbl>,
#   TimeGravityAccelerometerMagnitude.std.. <dbl>,
#   TimeBodyAccelerometerJerkMagnitude.std.. <dbl>,
#   TimeBodyGyroscopeMagnitude.std.. <dbl>,
#   TimeBodyGyroscopeJerkMagnitude.std.. <dbl>,
#   FrequencyBodyAccelerometer.std...X <dbl>,
#   FrequencyBodyAccelerometer.std...Y <dbl>,
#   FrequencyBodyAccelerometer.std...Z <dbl>,
#   FrequencyBodyAccelerometerJerk.std...X <dbl>,
#   FrequencyBodyAccelerometerJerk.std...Y <dbl>,
#   FrequencyBodyAccelerometerJerk.std...Z <dbl>,
#   FrequencyBodyGyroscope.std...X <dbl>, FrequencyBodyGyroscope.std...Y <dbl>,
#   FrequencyBodyGyroscope.std...Z <dbl>,
#   FrequencyBodyAccelerometerMagnitude.std.. <dbl>,
#   FrequencyBodyAccelerometerJerkMagnitude.std.. <dbl>,
#   FrequencyBodyGyroscopeMagnitude.std.. <dbl>,
#   FrequencyBodyGyroscopeJerkMagnitude.std.. <dbl>
> 
