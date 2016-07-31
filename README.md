This is the assignment for the third course in the Data Science Specialization, Getting and Cleaning Data. 

The purpose of the project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The following are required for the project:

1. A tidy dataset.
2. A link to a Github repository with the script for performing the analysis.
3. A code book that describes the variables, the data, and any transformations performed to clean up the data called CodeBook.md.
4. A README.md file in the repo.


The criteria for reviewing the assignment are:

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. Github contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.


Data from Samsung Galaxy 5 smartphone accelerometers will be "tidied" for this project. The data (obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) provided in several .txt files. Tidying this data required loading the data from each file into R, combining the data sets and applying the correct labels, and using the ddply() function to generate a tidy data frame with the average value of the data, according to both the SubjectID and ActivityID. The README.md and CODEBOOK.md files also have been provided in this repository, per the instructions.

