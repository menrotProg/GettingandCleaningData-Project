# GettingandCleaningData-Project
This repo is for the course project of Getting and Cleaning Data

Processed Human Activity Recognition Using Smartphones Data Set 


Abstract: Based on Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors (reference - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), the script run_analysis.R creates a dataset including the average for each subject and each activity of mean and std for each feature.


The files in the repo are:
	Readme.md
	run_Analysis.R - the script file using the refernce dataset and creating the "tidy.txt" dataset.
	CodeBook.md - describing the resulting dataset
	tidy.txt - the resulting dataset

How to run the run_analysis.R script
	The script assumes
		1) in is run from the working directory
		2) the working directory includes the original data set in a folder "UCI HAR Dataset"
	The script creates in the working directory the resulting dataset with the name "tidy.txt"
	
	
		



Data Set Characteristics:  

Number of Instances:

180

Number of Attributes:

68

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 


Attribute Information:

For each record in the dataset it is provided: 
- An identifier of the subject who carried out the experiment.
- Its activity label. 
- A 66-feature vector having the average of the selected (MEAN and STD)features. A detailed list can be found in the CodeBook.MD file.
  
Processing

