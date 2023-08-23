#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOR/DATATYPESANDDATASTRUCTURES/INTROTOR DATATYPESANDDATASTRUCTURES 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 7: Basic data classes: integer  ####

# Create an integer type variable.
integer_var = 34L

# Check type of variable.
typeof(integer_var)

# Check class of variable.
class(integer_var)

# Check attributes of variable
attributes(integer_var)

# Check if the variable is integer.
is.integer(integer_var)

# Check length of variable 
# (i.e. how many entries).
length(integer_var)


#=================================================-
#### Slide 8: Basic data classes: numeric  ####

# Create a numeric class variable.
numeric_var = 24.24
typeof(numeric_var)
# Check class of variable.
class(numeric_var)

# Check attributes of variable
attributes(numeric_var)

# Check if the variable is numeric
is.numeric(numeric_var)
# Check length of variable 
length(numeric_var)


#=================================================-
#### Slide 9: Basic data classes: character  ####

# Create a character class variable
character_var = "Hello" # using double quotation marks
character_var2 = 'Hello' # using single quotation marks


#=================================================-
#### Slide 10: Basic data classes: character (contd)  ####

# Create a character class variable.
character_var = "Hello"
# Check if the variable is character.
is.character(character_var)

# Check class of variable.
class(character_var)

# Check metadata/attributes of variable.
attributes(character_var)

# Check length of variable 
# (i.e. how many entries).
length(character_var)


#=================================================-
#### Slide 11: Some useful character operations  ####

# Create another character class variable.
case_study = "JUmbLEd CaSE"

# Convert a character string to lower case.
tolower(case_study)

# Convert a character string to upper case.
toupper(case_study)

# Count number of characters in a string.
nchar(case_study)

# Compare to the output of the `length` command.
length(case_study)

# Get just a part of character string.
substr(case_study, #<- original string
       1,          #<- start index of substring
       7)          #<- end index of substring


#=================================================-
#### Slide 12: Basic data classes: logical  ####

# Create a logical class variable.
logical_var = TRUE

# Check type of variable.
typeof(logical_var)

# Check if the variable is logical.
is.logical(logical_var)

# Check metadata/attributes of variable.
attributes(logical_var)

# Check length of variable 
# (i.e. how many entries).
length(logical_var)


#=================================================-
#### Slide 14: Data type conversions  ####

# Create a numeric class variable.
numeric_var = 24.24
typeof(numeric_var)

# Convert numeric variable to integer
a = as.integer(numeric_var)
print(a)

# Convert numeric variable to character
char_variable = as.character(numeric_var)
print(char_variable)



#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOR/DATATYPESANDDATASTRUCTURES/INTROTOR DATATYPESANDDATASTRUCTURES 2 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 3: Basic data structures: atomic vectors  ####

# To make an empty vector in R, 
# you have a few options:
# Option 1: use `vector()` command.
# The default in R is an empty vector of 
# `logical` mode!
vector()

# Option 2: use `c()` command 
# (`c` stands for concatenate).
# The default empty vector produced by `c()` 
# has a single entry, `NULL`!
c()

# Make a vector from a set of char. strings
c("My", "name", "is", "Vector")

# Make a vector out of given set of numbers
c(1, 2, 3, 765, -986, 0.5)


#=================================================-
#### Slide 4: Basic data structures: atomic vectors (cont'd)  ####

# Create a vector of mode `character` from 
# pre-defined set of character strings.
character_vec = c("My", "name", "is", "Vector")
character_vec

# Check if the variable is character.
is.character(character_vec)

# Check metadata/attributes of variable.
attributes(character_vec)

# Check length of variable 
# (i.e. how many entries).
length(character_vec)


#=================================================-
#### Slide 5: Basic data structures: accessing vector values  ####

# To access an element inside of the
# vector use `[]` and the index of the element.
character_vec[1]

# To access multiple elements inside of
# a vector use the start and end indices
# with `:` in-between.
character_vec[1:3]

# Start by creating a sequence of numbers from 1 to 5.
number_seq = seq(from = 1, to = 5, by = 1)
number_seq

# Check class.
class(number_seq)

# Subset the first 3 elements.
number_seq[1:3]


#=================================================-
#### Slide 6: Basic data structures: operations on vectors  ####

number_seq      #<- Let's take our vector.


number_seq + 5  #<- Add a number to every entry.


number_seq - 5  #<- Subtract a number from every entry.


number_seq * 2  #<- Multiply every entry by a number.

# To sum all elements use `sum`.
sum(number_seq)

# To multiply all elements use `prod`.
prod(number_seq)

# To get the mean of all vector 
# values use `mean`.
mean(number_seq)

# To get the smallest value
# in a vector use `min`.
min(number_seq)



#=================================================-
#### Slide 7: Basic data structures: why atomic vectors?  ####

# Create a vector with entries of different type.
atomic_vec = c(333, "some text", TRUE, NULL)
atomic_vec

# Check class of the resulting vector.
class(atomic_vec)


#=================================================-
#### Slide 9: Basic data structures: working with multiple dimensions  ####

?dim        #<- Check R documentation
dim(object) #<- Any R object



#=================================================-
#### Slide 10: Basic data structures: making matrices  ####

sample_matrix1 = matrix(nrow = 3, #<- n rows
                        ncol = 3) #<- m cols
sample_matrix1

# An empty matrix will default to `NA`s.

# Check matrix dimensions.
dim(sample_matrix1)

#The `length` command will produce
# the total number of elements in the matrix 
# (length = n rows x m cols).
length(sample_matrix1)

sample_matrix2 = 1:9 #<- another way to make
                     #   a sequence of numbers!

# Assign dimensions to matrix:
# 1st number is for rows, 2nd is for columns.
dim(sample_matrix2) = c(3, #<- n rows
                        3) #<- m cols

sample_matrix2

# Check matrix dimensions.
dim(sample_matrix2)


#=================================================-
#### Slide 11: Basic data structures: working with matrices  ####

# Check type of variable.
typeof(sample_matrix1)

# Check class of variable.
class(sample_matrix1)

# Check if the variable of type `integer`.
is.integer(sample_matrix1)

# Check metadata/attributes of variable.
attributes(sample_matrix1)


#=================================================-
#### Slide 12: Basic data structures: operations on matrices  ####

# Let's take a sample matrix.
sample_matrix2

# Add a number to every entry.
sample_matrix2 + 5

# Multiply every entry by a number.
sample_matrix2 * 2

# To sum all elements use `sum`.
sum(sample_matrix2)

# To multiply all elements use `prod`.
prod(sample_matrix2)

# To get the mean of all matrix 
# values use `mean`.
mean(sample_matrix2)

# To get the smallest value
# in a matrix use `min`.
min(sample_matrix2)



#=================================================-
#### Slide 15: Basic data structures: lists  ####

# To make an empty list in R, 
# you have a few options:
# Option 1: use `list()` command.
list()

# Make a list with different entries.
sample_list = list(1, "am", TRUE)
sample_list


#=================================================-
#### Slide 16: Basic data structures: naming list elements  ####

# Create a named list.
sample_list_named = list(One = 1, 
                         Two = "am", 
                         Three = TRUE)
sample_list_named

attributes(sample_list_named)

# Name existing list.
names(sample_list) = c("One", "Two", "Three")
sample_list

attributes(sample_list)


#=================================================-
#### Slide 17: Basic data structures: introducing structure  ####

?str        #<- Check R documentation
str(object) #<- Any R object

# Inspect the list's structure.
str(sample_list)



#=================================================  -
#### Slide 18: Basic data structures: accessing data within lists  ####

# Access an element of a list.
sample_list[[2]] 

# Access a sub-list with its element(s).
sample_list[2]

# Access a sub-list with its element(s).
sample_list[2:3]

# Access named list elements.
sample_list$One
sample_list$Two
sample_list$Three


#=================================================-
#### Slide 21: Basic data structures: making dataframes  ####

# To make an empty dataframe in R, 
# use `data.frame()` command.
data.frame()

# To make a dataframe with several
# columns, pass column values
# to the `data.frame()` command just like
# you would do with lists.
data.frame(1:5, 6:10)



#=================================================-
#### Slide 22: Dataframes: converting a matrix  ####

# Make a dataframe from matrix.
sample_matrix1 = matrix(nrow = 3, ncol = 3)
sample_matrix1 = 1:9
dim(sample_matrix1) = c(3, 3)

sample_df1 = as.data.frame(sample_matrix1)
sample_df1

# Make a dataframe from matrix with named columns and rows.
sample_df2 = as.data.frame(sample_matrix1, row.names = c('Row1','Row2','Row3')) 
cols = c('Col1','Col2','Col3') # defining the column names
colnames(sample_df2) = cols   # assigning the column names to df
sample_df2


#=================================================-
#### Slide 23: Dataframes: selecting columns  ####

# To access a column of a dataframe
# Option 1: Use `$column_name`.
sample_df2$Col1

# To access a column of a dataframe
# Option 2: Use `[[column_index]]`.
sample_df2[[1]]

# To access a column of a dataframe
# Option 3: Use `[ , column_index]`.
sample_df2[, 1]


#=================================================-
#### Slide 24: Dataframes: subsetting rows  ####

# To access a row of a dataframe
# Option 1: use `[row_index, ]`.
sample_df2[1, ]

# To access a row of a dataframe
# Option 2: use `["row_name", ]`.
sample_df2["Row1", ]


#=================================================-
#### Slide 25: Dataframes: accessing individual values  ####

# Option 1: 
# `data_frame$column_name[row_index]`
sample_df2$Col2[1]

# Option 2:
# `data_frame[[column_index]][row_index]`
sample_df2[[2]][1]

# Option 3: 
# `data_frame[row_index, column_index]`
sample_df2[1, 2]

# Option 4:
# `data_frame["row_name", "column_name"]`
sample_df2["Row1", "Col2"]


#=================================================-
#### Slide 27: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
