# Programming Assignment 3: Hospital Quality
## By Fan Li
### 2021 Feb 22
###### Introduction
The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset essentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining
whether hospitals should be fined for not providing high quality care to patients (see http://goo.gl/jAXFX
for some background on this particular topic).
###### Data
The Hospital Compare web site contains a lot of data and we will only look at a small subset for this
assignment. The zip file for this assignment contains three files
* `outcome-of-care-measures.csv`: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
* `hospital-data.csv`: Contains information about each hospital.
* `Hospital_Revised_Flatfiles.pdf`: Descriptions of the variables in each file (i.e the code book)

A description of the variables in each of the files is in the included PDF file named `Hospital_Revised_Flatfiles.pdf`. This document contains information about many other files that are not included with this programming assignment. You will want to focus on the variables for Number 19 (“Outcome of Care Measures.csv”) and Number 11 (“Hospital Data.csv”).
######  Part 1 Plot the 30-day mortality rates for heart attack
###### Part 2 Finding the best hospital in a state `best.R`
Write a function called 'best' that take two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular
outcome should be excluded from the set of hospitals when deciding the rankings.
###### Part 3 Ranking hospitals by outcome in a state `rankhospital.R`
Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument.
###### Part 4 Ranking hospitals in all states `rankall.R`
Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num.
