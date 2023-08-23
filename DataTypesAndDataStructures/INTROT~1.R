#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOR/DATATYPESANDDATASTRUCTURES/INTROTOR DATATYPESANDDATASTRUCTURES 2 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise ####
# =================================================-

#### Please refer to module 1 of IntroToR - DataTypesAndDataStructures for Tasks 1-2

#================================================
#### Task 1 ####

# Create a logical variable named `logvar` and assign it the value FALSE.
# Confirm the type of variable for logvar.
# Then convert the logical variable to a character variable named `new_char2`.
# Check the value of the new variable in the Global Environment. 
# Then confirm the class of the new variable.

# Result:

logvar = FALSE
typeof(logvar)
new_char2 = as.character(logvar)
class(new_char2)

#================================================-
#### Task 2 ####

# Define the variable test = 234.3
# What is the class of the `test` variable?
# What is the type of the `test` variable?
# Convert `test` to an `integer` and assign it to variable `test2`.
# Then confirm the new class of `test2`.

# Result:
test = 234.3
class(test)
typeof(test)
test2 = as.integer(test)
class(test2)

# Answer: numeric and double.

#### Please refer to module 2 of IntroToR - DataTypesAndDataStructures for Tasks 3-15

#================================================-
#### Task 3 ####

# Create a numeric vector named `numvec` that contains the values 2.3, 4, 5.63, and 4.623.
# Return the values of `numvec`.
# Convert the vector `numvec` to a vector of integers named `intvec`.
# Then confirm if the vector contains integers or not. 
# The answer should be either TRUE or FALSE.

# Result:

numvec = c(2.3, 4, 5.63, 4.623)
numvec
intvec = as.integer(numvec)
is.integer(intvec)

# Answer: TRUE

#================================================-
#### Task 4 ####

# Check how many items are in `intvec`.
# Then append the values 7, 14, and 8 to the vector `intvec`.
# Check the length of intvec again. What changed?

# Result:

length(intvec)
intvec = c(intvec, 7, 14, 8)
length(intvec)

# Answer: length increased by 3.

#================================================-
#### Task 5 ####

# Add the value 3 to all values in `intvec`.
# Note: Do not assign the result back to `intvec` after adding the value to the vector.

# Result:

intvec + 3

#================================================-
#### Task 6 ####

# Create another vector named `seqvec` that starts at 2, ends at 14, and the numbers increase by 2.
# What is the length of `seqvec`?
# Assign the result of subtracting `intvec` from `seqvec` to the vector `resvec`. 

# Result:

seqvec = seq(from = 2, to = 14, by = 2)
seqvec
length(seqvec)
resvec = seqvec - intvec
resvec

# Answer: 7

#================================================-
#### Task 7 ####

# What is the product of resvec?
# What is the minimum value in resvec?
# What is the mean of resvec?

# Result:

prod(resvec)
min(resvec)
mean(resvec)

# Answer:0, -2, 1.714286

#================================================-
#### Task 8 ####

# Bind the vectors `intvec`, `seqvec`, and `resvec` together as columns to create `matrix_c`.
# Separately bind the vectors together as rows to create `matrix_r`.
# Confirm the class of both `matrix_c` and` matrix_r`.
# How many rows and columns are there in `matrix_c` and `matrix_r` ?

# Hint for binding vectors:

# matrix_c = cbind(intvec, seqvec, resvec) #<- cbind binds as columns
# matrix_r = rbind(intvec, seqvec, resvec) #<- rbind binds as rows

# Result:

matrix_c = cbind(intvec, seqvec, resvec) #<- cbind binds as columns
matrix_r = rbind(intvec, seqvec, resvec) #<- rbind binds as rows

class(matrix_c)
class(matrix_r)

dim(matrix_c)
dim(matrix_r)

# Answer: The class for both should be "matrix". `matrix_c` has 7 rows and 3 columns. `matrix_r` has 3 rows and 7 columns.


#================================================-
#### Task 9 ####

# Check the type of matrix for matrix_c and matrix_r (hint: is it numeric, character, integer?)

# Result:

typeof(matrix_c)
typeof(matrix_r)
is.integer(matrix_r)
is.numeric(matrix_r)
is.character(matrix_r)
is.integer(matrix_c)
is.numeric(matrix_c)
is.character(matrix_c)

#================================================-
#### Task 10 ####

# Create a list named 'state' with values 'New York', 'Illinois', and 'California'.
# Set the element names as 'Northeast', 'Midwest', and 'West' respectively.
# Inspect the list's structure.
# Print the value of 'West' index using the $ operator.

# Result:

state = list('New York', 'Illinois', 'California')
names(state) = c('Northeast', 'Midwest', 'West')
str(state)
state$West

#================================================-
#### Task 11 ####

# Create a dataframe called 'ex_df' with 3 columns and 3 rows:
## Dataframe should have values: 1:3, 4:6, 7:9
## Define the column names as 'col1', 'col2', 'col3'
## Rename the rows as 'a','b','c'

# Result:

ex_df = data.frame(1:3, 4:6, 7:9) # creating a dataframe
cols = c('col1','col2','col3') # defining column names
colnames(ex_df) = cols        # assigning column names

rows = c('a','b','c')   # defining row names
rownames(ex_df) = rows  # assigning column names


ex_df = data.frame(col1 = 1:3, # Alternative solution
            col2 = 4:6, 
            col3 = 7:9,
            row.names = c('a','b','c'))




