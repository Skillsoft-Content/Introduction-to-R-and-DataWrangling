#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## DATAWRANGLINGINR/DATASUMMARIZATIONANDTRANSFORMATION/DATAWRANGLINGINR DATASUMMARIZATIONANDTRANSFORMATION 2 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise  ####

# =================================================-





#### Please refer to module 1 of DataWranglingInR - DataSummarizationAndTransformation for Tasks 1-3



#### Task 1 #### 

# Load the `tidyverse` package. (Install if you don't have it already)

# Install and load `babynames` package.

# (this dataset is native to R)

# Only using `summarise`, find the sum of `n`, name it "total_counts". 

# You will see that is not very useful... Let's try it with `group_by`.



# Result: 



#================================================-

#### Task 2 ####

# Use `group_by` and `summarise` to find the sum of F and M names by year. 

# Name the final dataframe 'summary' and the variable 'by_year'.



# Result:





#================================================-

#### Task 3 ####

# Perform the same summary function, this time subsetting the data to only 2010 and later. Also, arrange the output by year.

#	Use pipes this time. Name the new dataframe 'pipes'



# Result:





#### Please refer to module 2 of DataWranglingInR - DataSummarizationAndTransformation for Tasks 4-9



#### Task 4 ####

# Load the datasets `USPersonalExpenditure` which we will be using for the following questions:

# (this dataset is native to R)

# What is the class of the data we just loaded?



# Result: 

# a matrix



#================================================-

#### Task 5 ####

# Change `USPersonalExpenditure` to a tibble, so we can begin to turn it into tidy data. Make sure to include the current row.names as a column. Name that column `areas_of_expense`.

# Make sure to uncomment and use the below code to perform this.



# USPersonalExpenditure = tibble(

#    areas_of_expense = row.names(USPersonalExpenditure),

#    `1940` = USPersonalExpenditure[,1],

#    `1945` = USPersonalExpenditure[,2],

#    `1950` = USPersonalExpenditure[,3],

#    `1955` = USPersonalExpenditure[,4],

#    `1960` = USPersonalExpenditure[,5])







#================================================-

#### Task 6 ####

# Use `pivot_longer` to convert this data to `tidy` format. There should be two new columns, you can decide on names based on what these columns will contain. Save the gathered tibble as `gathered`.



# Result:



#================================================-

#### Task 7 ####

# Use `pivot_wider` to convert the tibble back to its original state.

# Result:





#================================================-

#### Task 8 ####

# For the following questions, we are going to create a dataframe for the purpose of using `separate` and `unite`.

# Ensure to uncomment the code below to create the tibble.



# set.seed(2)

# date = as.Date('2016-01-01') + 0:14

# hour = sample(1:24, 15)

# min = sample(1:60, 15)

# second = sample(1:60, 15)

# event = sample(letters, 15)

# data = tibble(date, hour, min, second, event)



# Let us unite the date, hour, minute and second. Name this new dataset - `data_unite`.



# Result:



#================================================-

#### Task 9 ####

# Let us now separate the `data_unite` into these columns: year, month, day, datetime, event.

# Result:






