# Samsung Galaxy S Smartphone Accelerometer & Gyroscope Tidy Dataset

***

## Overview
The R Script contained in run_analysis.R is designed to fetch, merge and output a single tidy dataset from the datasets held in the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) stored on the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html) website. The output is saved in tidyData.txt. The script achieves this by performing the following tasks.

1.	Fetching the data from the repository and saving it to the current working directory
2.	Merge the test and train datasets in a single dataset
3.	Tidy the dataset by adding column names that match the activity labels and renaming identifier column names so that they are more easily understood
4.	Remove any measurement columns from the dataset that do relate to Standard Deviation and Mean calculations of the the measurements from the original dataset
5.	Reformat column names replacing complex formattting in the column names to make them more easily understood
6.	The dataset is then melted in a new dataset by turning the subjects and actions they perform into identifier and measurement columns
7.	The new data set is then recast to show the mean of each measurement by subject and activity identifier columns
8.	Write the recasted dataset into .txt file called tidyData in the current working directory

##Bibliography

The R language and the libraries listed below have been utilised in this project.

R Core Team (2016). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.

Hadley Wickham (2007). Reshaping Data with the reshape Package. Journal of Statistical Software, 21(12), 1-20. URL http://www.jstatsoft.org/v21/i12/.

UCI machine learning repository: Human activity recognition using Smartphones data set (2012) Available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (Accessed: 4 February 2017)

