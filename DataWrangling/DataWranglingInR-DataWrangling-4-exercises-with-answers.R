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

path = box::file()
main_dir = dirname(dirname(path))
data_dir = paste0(main_dir, "/data")
plot_dir = paste0(main_dir, "/plots")
setwd(data_dir)

CMP = read.csv("ChemicalManufacturingProcess.csv",   #<- Load dataset
               header = TRUE,
               stringsAsFactors = FALSE)


column_keep = c(24:26, 52:55)
sub_cmp = CMP[ , column_keep]
str(sub_cmp)

# Answer: 7 columns, 1 column of integers.

#================================================-
#### Task 2 ####

# Summarize the variables in `sub_cmp`.
# Which variable has the most NA's?

# Result:

summary(sub_cmp)

# Answer: ManufacturingProcess11

#================================================-
#### Task 3 ####

# Create a list of logical values where NA's in ManufacturingProcess11 are TRUE.
# Save this list of logical values to a variable names `also_na`.
# Use `which` to find the row indexes of the NA values and save that list of row indexes to `idofnas`.

# Result:

also_na = is.na(sub_cmp$ManufacturingProcess11)
idsofnas = which(also_na)

#================================================-
#### Task 4 ####

# Compute the mean of the `ManufacturingProcess11` with the NAs removed.

# Result:

mean_process11 = mean(sub_cmp$ManufacturingProcess11, na.rm = TRUE)
mean_process11

#================================================-
#### Task 5 ####

# Assign the mean to the entry(s) with the `NA` in ManufacturingProcess11.
# Check the result.

# Result:

sub_cmp$ManufacturingProcess11[idsofnas] = mean_process11
sub_cmp$ManufacturingProcess11[idsofnas]


#### Please refer to module 3 of DataWranglingInR - DataWrangling for Tasks 6-12
#### Task 6 ####
# Load the `tidyverse` package. (Install if you don't have it already)
# Install and load `babynames` package.
# (this dataset is native to R)
# Filter all values in `babynames` that year is 2015.

# Result:
library(tidyverse)
install.packages("babynames")
library(babynames)
filter(babynames, year == 2015)

#================================================-
#### Task 7 ####
# Filter all values in babynames that year is 2015 and sex is F.

# Result:
filter(babynames,year == 2015,sex == 'F')

#================================================-
#### Task 8 ####
#Filter all values that are below 1000 counts (`n`) and that are between 1947-1975.

# Result:
filter(babynames, n < 1000, year >= 1947, year <= 1975)

#================================================-
#### Task 9 ####
# Filter all values that are either sex is F or n is above 1000 counts, all in 1975.

# Result:
filter(babynames, year == 1975, (sex == 'F' | n > 1000))

#================================================-
#### Task 10 #### 
# Arrange `babynames` by year in descending order.

# Result:
arrange(babynames, desc(year))

#================================================-
#### Task 11 ####
# Now arrange by year then by sex. What are the name and year in row 1?

# Result: 
arrange(babynames, year, sex)
# Answer: Name: Mary, Year: 1880

#================================================-
#### Task 12 ####
# Now arrange by sex, year, and name descending. What is the name in the first row?

# Result: 
arrange(babynames, sex, year, desc(name))
# Answer: Zula

#### Please refer to module 4 of DataWranglingInR - DataWrangling for Tasks 13-18

#### Task 13 ####
# Select only year,name and count (`n`) from `babynames`.

# Result:
select(babynames, year, name, n)

#================================================-
#### Task 14 ####
# Now select the same columns, but by specifying which NOT to include in the subset.

# Result:
select(babynames, -c(sex, prop))

#================================================-
#### Task 15 #### 
# Use the helper functions of `select` to find all columns that contain the letter `e`.

# Hint: Use the helper function contains() to find the columns which contain a particular letter.
# Result:
select(babynames,contains("e"))

#================================================-
##### Task 16 ####
# Subset `babynames` to be all names from 2015, keep all columns, save the subset as babynames_small.
# Using the newly created subset and `mutate`, create a new column "rank" that ranks by the count (`n`). Save the new subset as `babynames_mutate`.

# Hint: Use the function: dense_rank() to create the rank column:

# babynames_small = filter(babynames, year == 2015)
# babynames_mutate = mutate(babynames_small,rank = dense_rank(n))

# Result:
babynames_small = filter(babynames, year == 2015)
babynames_mutate = mutate(babynames_small,rank = dense_rank(n))
babynames_mutate

#================================================-
#### Task 17 ####
# Arrange the mutated dataset by rank descending, then by name. What is the rank,name and sex in the first row?

# Result: 
arrange(babynames_mutate,desc(rank),name)
# Answer: 1386, Emma, F

#================================================-
#### Task 18 ####
# Now instead of the `babynames_mutate` subset, use a function that will simply create one column that gives you the rank of the counts - "RANK". Use the dataset `babynames_small`.

# Hint: Use the function: dense_rank() to create the RANK column:

# transmute(babynames_small,RANK = dense_rank(n))

# Result:
transmute(babynames_small,RANK = dense_rank(n))



