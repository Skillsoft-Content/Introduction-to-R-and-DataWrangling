#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## DATAWRANGLINGINR/DATAWRANGLING/DATAWRANGLINGINR DATAWRANGLING 4 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise ####

# =================================================-





#### Please refer to module 1 of DataWranglingInR - DataWrangling for Tasks 1-5



#### Task 1 ####



# Set the data directory and load the "CMP" dataset if you haven't already.

# Create a vector of column indices named "column_keep" with columns 24:26 and 52:55 using `c`.

# Subset CMP using `column_keep` to retain the specified columns in a smaller dataset named `sub_cmp`.

# Confirm the structure of `sub_cmp`. 

# How many columns are in `sub_cmp`? How many columns are integers?



# Result:













#================================================-

#### Task 2 ####



# Summarize the variables in `sub_cmp`.

# Which variable has the most NA's?



# Result:







#================================================-

#### Task 3 ####



# Create a list of logical values where NA's in ManufacturingProcess11 are TRUE.

# Save this list of logical values to a variable names `also_na`.

# Use `which` to find the row indexes of the NA values and save that list of row indexes to `idofnas`.



# Result:





#================================================-

#### Task 4 ####



# Compute the mean of the `ManufacturingProcess11` with the NAs removed.



# Result:





#================================================-

#### Task 5 ####



# Assign the mean to the entry(s) with the `NA` in ManufacturingProcess11.

# Check the result.



# Result:







#### Please refer to module 3 of DataWranglingInR - DataWrangling for Tasks 6-12

#### Task 6 ####

# Load the `tidyverse` package. (Install if you don't have it already)

# Install and load `babynames` package.

# (this dataset is native to R)

# Filter all values in `babynames` that year is 2015.



# Result:



#================================================-

#### Task 7 ####

# Filter all values in babynames that year is 2015 and sex is F.



# Result:



#================================================-

#### Task 8 ####

#Filter all values that are below 1000 counts (`n`) and that are between 1947-1975.



# Result:



#================================================-

#### Task 9 ####

# Filter all values that are either sex is F or n is above 1000 counts, all in 1975.



# Result:



#================================================-

#### Task 10 #### 

# Arrange `babynames` by year in descending order.



# Result:



#================================================-

#### Task 11 ####

# Now arrange by year then by sex. What are the name and year in row 1?



# Result: 



#================================================-

#### Task 12 ####

# Now arrange by sex, year, and name descending. What is the name in the first row?



# Result: 



#### Please refer to module 4 of DataWranglingInR - DataWrangling for Tasks 13-18



#### Task 13 ####

# Select only year,name and count (`n`) from `babynames`.



# Result:



#================================================-

#### Task 14 ####

# Now select the same columns, but by specifying which NOT to include in the subset.



# Result:



#================================================-

#### Task 15 #### 

# Use the helper functions of `select` to find all columns that contain the letter `e`.



# Hint: Use the helper function contains() to find the columns which contain a particular letter.

# Result:



#================================================-

##### Task 16 ####

# Subset `babynames` to be all names from 2015, keep all columns, save the subset as babynames_small.

# Using the newly created subset and `mutate`, create a new column "rank" that ranks by the count (`n`). Save the new subset as `babynames_mutate`.



# Hint: Use the function: dense_rank() to create the rank column:



# babynames_small = filter(babynames, year == 2015)

# babynames_mutate = mutate(babynames_small,rank = dense_rank(n))



# Result:



#================================================-

#### Task 17 ####

# Arrange the mutated dataset by rank descending, then by name. What is the rank,name and sex in the first row?



# Result: 



#================================================-

#### Task 18 ####

# Now instead of the `babynames_mutate` subset, use a function that will simply create one column that gives you the rank of the counts - "RANK". Use the dataset `babynames_small`.



# Hint: Use the function: dense_rank() to create the RANK column:



# transmute(babynames_small,RANK = dense_rank(n))



# Result:






