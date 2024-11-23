## Human Activity Recognition Dataset Analysis

This project involves analyzing data collected from the accelerometer and gyroscope of a Samsung Galaxy S smartphone to recognize human activities. The dataset contains measurements related to various physical activities like walking, sitting, standing, etc.

The project aims to:
1. Merge training and test data sets.
2. Extract measurements related to mean and standard deviation.
3. Label activities with descriptive names.
4. Clean the dataset by renaming columns with more descriptive names.
5. Create a tidy dataset with average values of each variable for each activity and subject.

#Folder Structure#
- **`README.md`**: This file provides an overview of the project, its objectives, and how to run the analysis.
- **`run_analysis.R`**: This is the main R script for performing the data analysis, including data cleaning and transformation.
- **`CodeBook.md`**: This file explains the variables in the dataset and documents the transformations and cleaning steps.
- **`UCI HAR Dataset/`**: This folder contains the raw data files (`activity_labels.txt`, `features.txt`, `train/`, and `test/` folders).

---

## How to Run the Analysis

### Prerequisites:
1. Download the dataset from the UCI repository and unzip it into your project directory.
2. The folder structure should look like the one mentioned above, with the `UCI HAR Dataset/` folder containing all the necessary data files.

### Running the Script:

1. **Set Your Working Directory:**
   Before running the analysis, set the working directory in R to the folder where the `run_analysis.R` script is located, using the `setwd()` function:

   ```R
   setwd("C:\Users\Dell\Downloads\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset")
## Source of the R script##
   source(run_analysis.R")

